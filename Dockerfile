FROM michilu/docker-web-essentials

ENV \
  GOPATH="/usr/local/go_appengine/gopath" \
  GOROOT="/usr/local/go_appengine/goroot" \
  PATH="/usr/local/go_appengine:$PATH"

RUN version="1.9.40" \
  ; zipfile="go_appengine_sdk_linux_amd64-${version}.zip" \
  ; apk --no-cache --update add --virtual=build-time-only \
  curl \
  && curl -sO https://storage.googleapis.com/appengine-sdks/featured/${zipfile} \
  && apk del build-time-only \
  && unzip -qq ${zipfile} -d /usr/local \
  && rm ${zipfile}

CMD echo "print versions..."\
  && goapp version \
  && echo -n "GOPATH: " \
  && goapp env GOPATH \
  ;

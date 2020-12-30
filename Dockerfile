FROM golang:1.15.6

RUN apt-get update \
  && apt-get install -y build-essential git curl wget \
                        zlib1g-dev libxml2-dev libxslt1-dev \
                        openssl less libssl-dev libreadline-dev vim

RUN mkdir /go/src/app
WORKDIR /go/src/app
COPY ./app ./

RUN go get github.com/pilu/fresh@latest
RUN go get github.com/go-delve/delve/cmd/dlv@latest
RUN go get github.com/gin-gonic/gin

EXPOSE 8000

CMD gin -i run

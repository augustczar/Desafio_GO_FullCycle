FROM golang:1.21.1 as builderGo

WORKDIR  /usr/go/app

COPY . .
RUN go mod init main && \ 
  go build .

FROM scratch
WORKDIR /usr/go/app

COPY  --from=builderGo /usr/go/app/main .
CMD [ "/usr/go/app/main" ]

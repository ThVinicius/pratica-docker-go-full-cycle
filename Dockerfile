FROM golang AS build

WORKDIR /app

COPY . /app

RUN go mod init hello

RUN go build

FROM scratch

WORKDIR /app

COPY --from=build /app/hello ./

ENTRYPOINT [ "./hello" ]
ARG GO_VER
ARG OS_VER

FROM ${GO_VER} AS builder

WORKDIR /opt

COPY ./cmd/selfaddr ./cmd/selfaddr
COPY ./go.mod ./go.mod
COPY ./go.sum ./go.sum

RUN go build -o ./build/${APP_NAME}  ./cmd/selfaddr

FROM ${OS_VER}

COPY --from=builder /opt/build/${APP_NAME} /usr/local/bin/${APP_NAME}

CMD $APP_NAME
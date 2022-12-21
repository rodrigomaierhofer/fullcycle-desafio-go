FROM golang as build

WORKDIR /usr/src/app

COPY . .

RUN go build main.go

CMD ["tail", "-f", "/dev/null"]


FROM scratch

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/main .

ENTRYPOINT ["/usr/src/app/main" ]
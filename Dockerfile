FROM golang:latest as build
WORKDIR /app
COPY hello.go .
RUN go build hello.go

FROM scratch as release
WORKDIR /root/
COPY --from=build /app/hello .
CMD [ "./hello" ]

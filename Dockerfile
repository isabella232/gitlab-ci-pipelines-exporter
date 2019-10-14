FROM alpine:3.8 as alpine

RUN apk add -U --no-cache ca-certificates

FROM scratch
WORKDIR /
COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ADD release/gitlab-ci-exporter /bin/
EXPOSE 8080

ENTRYPOINT ["/bin/gitlab-ci-exporter"]
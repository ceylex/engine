FROM alpine AS build

RUN apk add --no-cache go make

WORKDIR /app

COPY . .

RUN make release-amd64

FROM scratch
COPY --from=build /app/ceylex /bin/ceylex
EXPOSE 8080/tcp
CMD [ "/bin/ceylex" ]
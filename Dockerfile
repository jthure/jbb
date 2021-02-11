FROM jthure/elixir-phoenix:latest AS builder

WORKDIR /app

ENV MIX_ENV prod

COPY mix.exs .
COPY mix.lock .
COPY config config

RUN mix do deps.get, deps.compile

RUN mkdir assets
COPY assets/package.json assets
COPY assets/package-lock.json assets

# Install / update  JavaScript dependencies
RUN npm --prefix ./assets ci --progress=false --no-audit --loglevel=error

COPY priv priv
COPY assets assets

# Compile assets
RUN npm run --prefix ./assets deploy
RUN mix phx.digest


COPY lib lib
RUN mix do compile, release

# RUN ./release.sh


FROM alpine:latest
RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app
# RUN chown nobody:nobody /app
# USER nobody:nobody
COPY --from=builder /app/_build/prod/rel/jbb/ .
ENV HOME=/app

# CMD ["/bin/sh"]

CMD ./bin/jbb start
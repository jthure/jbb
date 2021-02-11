FROM bitwalker/alpine-elixir-phoenix:latest AS builder

WORKDIR /app

ENV MIX_ENV prod

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get --only prod
RUN mix deps.compile

RUN mkdir assets

COPY assets/package.json assets
COPY assets/package-lock.json assets

RUN npm install --prefix ./assets

COPY . .

RUN ./release.sh


FROM bitwalker/alpine-elixir-phoenix:latest
WORKDIR /app
RUN pwd && ls
COPY --from=builder /app/_build/prod/rel/patent_watcher/ .
CMD ./bin/patent_watcher start
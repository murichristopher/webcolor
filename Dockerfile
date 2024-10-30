FROM elixir:1.16.0-alpine


RUN mix local.hex --force && \
    mix local.rebar --force

COPY . .

RUN mix do deps.get, deps.compile

EXPOSE 4000

CMD ["mix", "run", "--no-halt"]
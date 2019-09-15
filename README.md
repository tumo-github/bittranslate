### BIT TRANSLATE ###

App Open Source Bit Translate - Pequeno tradutor de línguas entre inglês e português.

## Ferramentas utilizadas:

- ruby 2.5.1-slim
- sinatra

## Executado utilizando Docker:

- Dockerfile
- docker-compose version 3

## Variáveis de ambiente necessária
```
export YANDEX_KEY=''
```

## Execução:

```
docker-compose build

docker-compose run --rm app bundle install

docker-compose up
```

# Rails webpacker docker (6.0.0.beta1)

## Environment

- Ruby 2.6.1
- Rails 6.0.0.beta1
- Node 11.3
- yarn 1.13.0
- postgres 9

## Initialize

```
docker-compose build
docker-compose run web scripts/wait-for-it.sh db:5432 -- 'rails db:create db:migrate'

# run
docker-compose up
```

## Refs

- [Running a Rails app with Webpacker and Docker – Soulmates.AI – Medium](https://medium.com/soulmates-ai/running-a-rails-app-with-webpacker-and-docker-8d29153d3446)
- [Rails 5.2 with webpacker, bootstrap, stimulus starter | DEVLOG of andyyou](https://andyyou.github.io/2018/05/02/rails-5-webpacker-stimulus-bootstrap-starter/)
- [Replacing Rails Asset Pipeline with Webpacker — Neon Tsunami](https://www.neontsunami.com/posts/replacing-rails-asset-pipeline-with-webpacker)
- [soulmates-ai/docker-rails-demo: Demo app for Rails, Docker and Webpack](https://github.com/soulmates-ai/docker-rails-demo)
- [distributions/README.md at master · nodesource/distributions](https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions)
- [Installation | Yarn](https://yarnpkg.com/lang/en/docs/install/#debian-stable)
- [postgresql - How to fix error on postgres install ubuntu - Stack Overflow](https://stackoverflow.com/questions/51033689/how-to-fix-error-on-postgres-install-ubuntu)

# communa - community impact tracker

full-stack web app for organizations to log and visualize the good they do in their communities.

## stack

- ruby on rails 8.1 (api mode)
- graphql (graphql-ruby)
- postgresql 16
- redis 7
- react + vite (frontend)
- minitest (backend tests)
- cypress (e2e tests)
- docker + docker compose

## what it does

- organizations register and manage their profile
- log community activities (events, donations, volunteering, partnerships)
- dashboard with impact summaries and aggregated metrics
- graphql api consumed by a react frontend
- redis caches dashboard queries for performance

## getting started

make sure you have docker and docker compose installed, then:

```bash
git clone git@github.com:vladrosant/communa.git
cd communa
touch Gemfile.lock
docker compose up --build -d
docker compose exec api rails db:create db:migrate db:seed
```

api runs at `http://localhost:3000`
frontend runs at `http://localhost:5173`

## project structure

```
communa/
├── api/          # rails backend
├── frontend/     # react + vite
└── docker-compose.yml
```

## running tests

```bash
# backend (minitest)
docker compose exec api rails test

# e2e (cypress)
cd frontend && npx cypress open
```
# Captsone Project API

## API Endpoints

| Verb | URI pattern | Controller#Action |
|--|--|--|
| POST | `/sign-up` |	`users#signup` |
| POST | `/sign-in` |	`users#signin` |
| DELETE | `/sign-out/:id` |	`users#signout` |
| PATCH |	`/change-password/:id` |	`users#changepw` |
| GET | `/datasets` | `datasets#index` |
| GET | `/datasets/:id` | `datasets#show` |

# Welcome to the Anythink Market repo

To start the app use: `./start.sh`, it'll start both the backend and the frontend.

Please find more info about each part in the relevant Readme file ([frontend](frontend/readme.md) and [backend](backend/README.md)).

## Development

When implementing a new feature or fixing a bug, please create a new pull request against `main` from a feature/bug branch and add `@vanessa-cooper` as reviewer.

## Installation instructions

### Database

1. First of all, you will need to install [PostgreSQL](https://www.postgresql.org) locally 

2. How to connect the DB: In our case, we have both config/database.yml and `ENV['DATABASE_URL']` present in the settings of the Rails app. So, you need to set up the env variable for DATABASE_URL:
  - Create a .env file with the following config:
    `DATABASE_URL=postgresql://localhost/<your_db>`

  - Execute the export of the env variable in a terminal:
    ```
    export DATABASE_URL="postgresql://localhost/<your_db>”
    echo $DATABASE_URL
    # => postgresql://localhost/<your_db>
    ```

3. Run the DB
- Create DB: `rails db:create`
- Run migrations: `rails db:migrate`

### Start the server

- Backend: 
```
cd backend
./start.sh
````

- Frontend:
```
cd frontend
./start.sh
```

*Note*: for the frontend, I have needed to change the node config in the package.json to avoid issues with other local projects:

```
"engines": {
    "node": ">=16"
  },
````

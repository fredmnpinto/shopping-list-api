# How do I get this up?

## Docker
Well the simplest way is to just use the docker configuration that is in this project to get it up and running (api + db).

However life is not that simple, there is a step 0.

### Step 0
Setup a .env file to configure some stuff regarding the database. There for sure is a simpler way to do this that wouldn't require manual intervention but I'm tired so this is what you get.
```
DB_HOST=localhost
DB_USERNAME=postgres
DB_PASSWORD=postgres
```

### Step 1
And with that, you can finally just run docker compose and be done with it. With this you'll have a shopping-list-api and shopping-list-db containers running.
```
docker compose up
```

### Step 2
We're actually done but just as a sanity check you can call the healthcheck endpoint in order to know 10000% that the api is up and running.
**Note:** this is courtesy of the 'rails-healthcheck' gem, awesome gem in my opinion.
```
curl localhost:3000/healthcheck
```

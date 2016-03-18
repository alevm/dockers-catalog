# PostgreSQL Docker Image

* [![](https://badge.imagelayers.io/envygeeks/postgresql:latest.svg)][latest] `latest`
[latest]:   https://imagelayers.io?images=envygeeks/postgresql:latest

The EnvyGeeks PostgreSQL docker image is a simple docker image that assumes
you want to get shit done rather than fight with horse shit, and it doesn't make
an ass of itself by assuming you don't know how to work PostgreSQL.

## Running

```shell
docker run --name postgresql \
  -v /srv/docker/volumes/postgresql/srv/postgresql:/srv/postgresql \
  -dit envygeeks/postgresql
```

When you first boot it, it will setup PostgreSQL and everything the way that
Debian does without need for your intervention, then once it's booted you can
start doing the real work.

## Creating Databases/Users

You create all that the same way you do on your own system. With `createdb`
and `createuser --interactive`, the reason I do it this way is because I don't
make the assumption you want one PostgreSQL per Docker instance, that and
that's bad for memory and bad for development.  We scale our PostgreSQL
and even use Docker to create snapshots.

```shell
docker exec -it postgresql chpst -u postgres createuser --interactive user
docker exec -it postgresql chpst -u postgres createdb   --owner=user  db
docker exec -it postgresql chpst -u postgres psql -c \
  "ALTER USER user WITH password 'password'"
```

# Creating users, databases and extensions.

To create a set of default users, passwords and databases or users/databases
then create mount the volume (file) to `/usr/share/postgresql/default/users` and
if we detect it we will parse it with the following syntax:

```
user:password:database
user::database
```

To create extensions on databases create
`/usr/share/postgresql/default/extensions` and in that file use the following
syntax:

```
database:extension
```

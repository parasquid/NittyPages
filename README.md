# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


### Building and running the docker image

    docker build -t nittypages .
    docker run --rm -it -p 3000:3000 nittypages

### Docker compose for development:

    USERID="$(id -u)" GROUPID="$(id -g)" docker compose up

This will mount the current directory into `/opt/app` inside the container, install gem dependencies to `./vendor/bundle`, and run the rails server and css watcher via `foreman`.

Since the gems are installed at `./vendor/bundle` (which is mapped into the host filesystem) subsequent bundle installs will be faster since the bundle location (usually) is persistent.

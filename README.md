# Bootcamp

## Installation

Install dependencies with Bundler

```bash
$> bundle install --path=.gems
```

Create database & run migration

```bash
$> bundle exec rake db:create
$> bundle exec rake db:migrate
```

Execute bootstrap_development script

```bash
$> bundle exec rails runner scripts/bootstrap_development.rb
```

And execute rails server to run your application

```bash
$> bin/rails server
```

## Tests

```bash
$> bundle exec rspec
```

## How you can test the endpoints

Using DHC.

I have created a DHC configuration file to be imported. The file is at `config/dhc/ironhack-bootcamp.json`.

You can download [DHC REST
Client](https://chrome.google.com/webstore/detail/dhc-rest-client/aejoelaoggembcahagimdiliamlcdmfm) and import file
described  below.

Bootstrap development script create a default user and token. With this token, you can access to all endpoints.

I you want to use OAuth 2 authentication in the project you have to

1 . obtain authorization code

```
GET http://localhost:3000/oauth/authorize?client_id=7580191c5fabf79c24c54d3ac94d6f78f555a5335d784dc185c04fdd98986924&redirect_uri=http://localhost:3000/oauth/callback&response_type=code
```

this endpoint redirect to `http://localhost:3000/oauth/callback` with a code.

Get this code and ...

2 . obtain access token using previous code

```
POST http://localhost:3000/oauth/token
{
  "client_id": "7580191c5fabf79c24c54d3ac94d6f78f555a5335d784dc185c04fdd98986924",
  "client_secret": "68b8b958c5df1f0f6c7ca1854d59d5c8330fe837197f75f88da162aa51dbcca9",
  "code": " ... previous code...",
  "grant_type": "authorization_code",
  "redirect_uri": "http://localhost:3000/oauth/callback"
}

```

With this request you obtain an access token. This is the access token that you need to provide in each request header because REST is stateless. That means that you need to send `Authorization` header in all requests.

```
Authorization=Bearer token
```

## Endpoints

### Subscribe to a course
`POST /couses/{id}/subscription`

### Complete exercise {number} in course {id}
```
PUT /courses/{id}/exercises/{number}
{
  data: {
    attributes: {
      url: '...'
    }
  }
}
```

### Retrieve the progress and exercises
`GET /courses/{id}/prework`


## Final remarks

### The API should be RESTful

RESTful implementation has been implemented using `rails-api` library. This library comes with Rails 5 version, but I
have use last stable version 4.2.6.

### The API sends and receives data in JSON format

To resolve JSON format responses, I have use [JSON API specification](http://jsonapi.org/).

To check if API responses was written in JSON API format, I have developed a RSpec matcher that match when a
`response.by` follow JSON API specification through `JSON::Validation`.

### Client

I don't have time to implement a client. I have thought to implement an little client using `React` and `Redux`, that
are the technologies that I am currently using.

### Must be placed in Github

If you are reading this, it ok ;)

### The API should be deployable on Heroku

I have never use heroku to deploy an application and I don't have to much time to study how to deploy in Heroku.

I usually use `capistrano` to deploy applications.

### Gems used
* `rails-api`
* `doorkeeper`. Used to implement OAuth 2 authentication.
* `devise`. User  management
* `active_model_serializers`. To serialize to JSON API format. You only can serialize ActiveModel objects. In `prework` model I have to serialize by hand.
* `virtus`. To build `forms`.
* `rspec`
* `factory_girl`
* `faker`
* `pry`
* `dotenv`

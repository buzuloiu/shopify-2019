# Shopify Summer 2019 Application

Welcome to my repo!

## Overview
- This project is a REST API built with Rails 5 and Ruby 2.6.0.
- It uses a Postgres database.
- It's secured with JWT and throttles requests by token.   
- It's hosted at: https://shopify-intern-api.herokuapp.com/api/v1/

## Getting Started

### Making requests
The API uses HTTP requests. You can use a CLI tool like curl,
 but I found it easier to use something like [Postman](https://www.getpostman.com/downloads/)

 You should make your requests to the /api/v1/ endpoints.

 Let's try getting all of the products sold by the store with a `GET` request with curl:
 ```shell
 curl https://shopify-intern-api.herokuapp.com/api/v1/products
 ```

you should get a response like this:

```
{"error":"Not Authorized"}
```

This is because you need to log in and get a token with which to make requests.


### Creating an account

### Making authorized requests
To make an authorized requests you can use your token.
To get your token, you can hit the `/authorize` endpoint with a `POST` request like this:
```shell
```
To use the token with curl, make a request like this:


## Docs
https://shopify-intern-api.herokuapp.com/api/v1/docs

## Demo

## Design

### Products

### Carts

### Line Items

### Securing The API

#### JWT

#### Throttling
- rack-defense

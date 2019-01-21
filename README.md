# Shopify Summer 2019 Application

Welcome to my repo!

## Overview
- This project is a REST API built with Rails 5 and Ruby 2.6.0.
- It uses a Postgres database.
- It's secured with JWT and throttles requests by token.   
- It's hosted at: https://shopify-intern-api.herokuapp.com/api/v1/

## Getting Started

#### Making requests
The API uses HTTP requests. You can use a CLI tool like curl,
 but I found it easier to use something like [Postman](https://www.getpostman.com/downloads/)

 You should make your requests to the /api/v1/ endpoints.

 Let's try getting all of the products sold by the store with a `GET` request with curl:
 ```shell
 curl https://shopify-intern-api.herokuapp.com/api/v1/products
 ```

you should get a response like this:

```json
{"error":"Not Authorized"}
```

This is because you need to log in and get a token with which to make requests.


#### Creating an account

To create a user with curl, `POST` to the `/users` endpoint like this:

```shell
curl -H "Content-Type: application/json" -X POST -d '{"user":{"name":"<your_name>", "email":"<your_email>","password":"<your_passsword>"}}' http://shopify-intern-api.herokuapp.com/users
```

and the API should repond with:

```json
{"name": "<your_name>", "email": "your_email"}
```

and now you're ready to start making authorized requests!

### Making authorized requests
To make an authorized requests you have add your auth token as `Authorization` in the header of your request.
To get your token, you can `POST` to the `/authenticate` endpoint with like this:
```shell
curl -H "Content-Type: application/json" -X POST -d '{"email":"<your_email>","password":"<your_passsword>"}' http://shopify-intern-api.herokuapp.com/authenticate
```

the api will respond with:
```json
{"auth_token":"<your_token_here>"}
```
To use the token with curl, make a request with your auth token as `Authorization` in the header of your request like this:

```shell
curl -H "Authorization: <your_token_here>" http://shopify-intern-api.herokuapp.com/api/v1/products
```
and the API should respond to your request by showing you all the products in the store.

## Docs
The API reference for this app is located here:
https://shopify-intern-api.herokuapp.com/api/v1/docs

## Demo

- can be used to fetch products either one at a time or all at once.
- Every product should have a title, price, and inventory_count.

request:
```shell
curl -H "Content-Type: application/json" -X POST -d '{"user":{"name":"test", "email":"test@test.com","password":"password"}}' http://shopify-intern-api.herokuapp.com/users
```
response:
```json
{"name":"test","email":"test@test.com"}
```

request:

```shell
curl -H "Content-Type: application/json" -X POST -d '{"email":"test@test.com","password":"password"}' http://shopify-intern-api.herokuapp.com/authenticate
```
response:
```json
{"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA"}
```

request:
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA" http://shopify-intern-api.herokuapp.com/api/v1/products
```

response

- Querying for all products should support passing an argument to only return products with available inventory.

- Products should be able to be "purchased" which should reduce the inventory by 1. Products with no inventory cannot be purchased.


### Design

#### Products

#### Carts

#### Line Items

### Securing The API

#### JWT

#### Throttling
- rack-defense

# Next Steps

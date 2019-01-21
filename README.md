# Shopify Summer 2019 Application

Welcome to my repo!

## Overview
- This project is a REST API built with Rails 5 and Ruby 2.6.0.
- It uses a Postgres database.
- It's a basic marketplace with products and carts
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
```json
{"name":"test","email":"test@test.com"}
```

request:

```shell
curl -H "Content-Type: application/json" -X POST -d '{"email":"test@test.com","password":"password"}' http://shopify-intern-api.herokuapp.com/authenticate
```
```json
{"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA"}
```

request:
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA" http://shopify-intern-api.herokuapp.com/api/v1/products
```
```json
[
    {
        "id": 1,
        "title": "Intelligent Wool Coat",
        "inventory_count": 74,
        "price_cents": 3468,
        "price_currency": "USD"
    },
    {
        "id": 2,
        "title": "Heavy Duty Leather Pants",
        "inventory_count": 76,
        "price_cents": 7502,
        "price_currency": "USD"
    },
    {
        "id": 3,
        "title": "Lightweight Concrete Bottle",
        "inventory_count": 31,
        "price_cents": 2025,
        "price_currency": "USD"
    },
    {
        "id": 4,
        "title": "Synergistic Steel Bench",
        "inventory_count": 0,
        "price_cents": 8861,
        "price_currency": "USD"
    }
]
```

one product at a time:
request:
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA" http://shopify-intern-api.herokuapp.com/api/v1/products/2
```
```json
{
    "id": 2,
    "title": "Heavy Duty Leather Pants",
    "inventory_count": 76,
    "price_cents": 7502,
    "price_currency": "USD"
}
```

- Querying for all products should support passing an argument to only return products with available inventory.

request:
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA" http://shopify-intern-api.herokuapp.com/api/v1/products?qty_available=1
```
```json
[
    {
        "id": 1,
        "title": "Intelligent Wool Coat",
        "inventory_count": 74,
        "price_cents": 3468,
        "price_currency": "USD"
    },
    {
        "id": 2,
        "title": "Heavy Duty Leather Pants",
        "inventory_count": 76,
        "price_cents": 7502,
        "price_currency": "USD"
    },
    {
        "id": 3,
        "title": "Lightweight Concrete Bottle",
        "inventory_count": 31,
        "price_cents": 2025,
        "price_currency": "USD"
    }
]
```

- Products should be able to be "purchased" which should reduce the inventory by 1.

request:
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA" http://shopify-intern-api.herokuapp.com/api/v1/products/2
```
```json
{
    "id": 2,
    "title": "Heavy Duty Leather Pants",
    "inventory_count": 76,
    "price_cents": 7502,
    "price_currency": "USD"
}
```

request:
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA" -X PUT http://shopify-intern-api.herokuapp.com/api/v1/products/2/purchase
```
```json
{
    "id": 2,
    "title": "Heavy Duty Leather Pants",
    "inventory_count": 75,
    "price_cents": 7502,
    "price_currency": "USD"
}
```
- Products with no inventory cannot be purchased.

request:
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA" http://shopify-intern-api.herokuapp.com/api/v1/products/4
```
```json
{
    "id": 4,
    "title": "Synergistic Steel Bench",
    "inventory_count": 0,
    "price_cents": 8861,
    "price_currency": "USD"
}
```

request:
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDgxMzczOTF9.FZ4XDEA9XrldO4KHQY19s-D4S-AWcoH_s9JhnW0iFPA" -X PUT http://shopify-intern-api.herokuapp.com/api/v1/products/4/purchase
```
```json
{
    "inventory_count": [
        "must be greater than -1"
    ]
}
```


## Fit these product purchases into the context of a simple shopping cart.

1. creating a cart

request:
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NDgxMzk2Njd9.Y4Fh2GPz0P40W31_tT6R4o9AtD_e9zJ0GCb_p50DAaE" -X POST http://shopify-intern-api.herokuapp.com/api/v1/carts
```
```json
{
    "id": 2,
    "total_cents": 0,
    "total_currency": "USD",
    "completed_at": null,
    "line_items": []
}
```
1. adding products to the cart, The cart should contain a list of all included products, a total dollar amount (the total value of all products), and product inventory shouldn't reduce until after a cart has been completed.

request:
```shell
curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NDgxMzk2Njd9.Y4Fh2GPz0P40W31_tT6R4o9AtD_e9zJ0GCb_p50DAaE" -X PUT -d '{"product_id":2,"quantity":5}' http://shopify-intern-api.herokuapp.com/api/v1/carts/2/add/
```
```json
{
    "id": 2,
    "total_cents": 37510,
    "total_currency": "USD",
    "completed_at": null,
    "line_items": [
        {
            "product_id": 2,
            "quantity": 5,
            "unit_price_cents": 7502,
            "unit_price_currency": "USD",
            "total_price_cents": 37510,
            "total_price_currency": "USD"
        }
    ]
}
```

- "completing" the cart

request:
(app checks if all line items are available before attempting to purchase them
)
```shell
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NDgxMzk2Njd9.Y4Fh2GPz0P40W31_tT6R4o9AtD_e9zJ0GCb_p50DAaE" -X PUT http://shopify-intern-api.herokuapp.com/api/v1/carts/2/complete
```

```json
{
    "id": 1,
    "total_cents": 37510,
    "total_currency": "USD",
    "completed_at": "2019-01-21T06:59:07.087Z",
    "line_items": [
        {
            "product_id": 2,
            "quantity": 5,
            "unit_price_cents": 7502,
            "unit_price_currency": "USD",
            "total_price_cents": 37510,
            "total_price_currency": "USD"
        }
    ]
}
```

### Design

#### Products


#### Carts

#### Line Items

### Securing The API

#### JWT
JSON web tokens are used to authenticate users. All endpoints require an auth token in their header to process the request except for the docs, the user creation endpoint, and the user authenication endpoint.

In a real production environment, users would be validated by email confirmation, so using JWT the way it's implemented here would help secure the API against farming and other similar abuse.

#### Throttling
The `rack-defense` gem allows for requests to be throttled to prevent DDOS attacks. in this case, tokens can only make 50 requests per second to any endpoint that starts with `/api`

Ideally, we would also be able to keep track of which user creations were successful, and only allow a fixed number of successful account creations per IP address to further prevent DDOS.
# Next Steps

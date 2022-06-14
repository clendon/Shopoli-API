# Shopoli-API
A microservice to handle requests to `/products`.

# Table of Contents
[Database Setup](#database-setup)<br>
[How to Use](#how-to-use)<br>
[Endpoints](#endpoints)<br>
[List Products](#list-products)<br>
[Product Information](#product-information)<br>
[Product Styles](#product-styles)<br>
[Related Products](#related-products)<br>

# Database Setup
Add schema to postgresQL database from root directory of repository, and copy the data into the database by typing the following two lines into the terminal:
```shell
psql clendon -d runway -h 127.0.0.1 -a -f ./database/schema.sql
```
```shell
psql clendon -d runway -h 127.0.0.1 -a -f ./database/copyDataToDatabase.sql
```

# How to Use
Type the following into the terminal from the root directory of repository:
```shell
npm start
```

# Endpoints
## List Products
Retrieves the list of products
```html
GET /products
```
### Parameters
| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `page` | `integer` | Selects the page of results to return. Default 1. |
| `count` | `integer` | Specifies how many results per page to return. Default 5. |
### Example Output:
```json
[
  {
    "id": 1,
    "name": "Camo Onesie",
    "slogan": "Blend in to your crowd",
    "description": "The So Fatigues will wake you up and fit you in. This high energy camo will have you blending in to even the wildest surroundings.",
    "category": "Jackets",
    "default_price": "140"
  },
  {
    "id": 2,
    "name": "Bright Future Sunglasses",
    "slogan": "You've got to wear shades",
    "description": "Where you're going you might not need roads, but you definitely need some shades. Give those baby blues a rest and let the future shine bright on these timeless lenses.",
    "category": "Accessories",
    "default_price": "69"
  },
  {
    "id": 3,
    "name": "Morning Joggers",
    "slogan": "Make yourself a morning person",
    "description": "Whether you're a morning person or not. Whether you're gym bound or not. Everyone looks good in joggers.",
    "category": "Pants",
    "default_price": "40"
  },
  // ...
]
```
## Product Information
Returns all product level information for a specified product id
```html
GET /products/:product_id
```
### Parameters
| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `product_id` | `integer` | **Required**. ID of the Product requested. |
### Example Output
```json
{
  "id": 11,
  "name": "Air Minis 250",
  "slogan": "Full court support",
  "description": "This optimized air cushion pocket reduces impact but keeps a perfect balance underfoot.",
  "category": "Basketball Shoes",
  "default_price": "0",
  "features": [
  {
    "feature": "Sole",
    "value": "Rubber"
  },
  {
    "feature": "Material",
    "value": "FullControlSkin"
  },
  // ...
  ],
}
```
## Product Styles
Returns all the styles available for the given product.
```html
GET /products/:product_id/styles
```
### Parameters
| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `product_id` | `integer` | **Required**. ID of the Product request. |
### Example Output
```json
{
  "product_id": "1",
  "results": [
    {
      "style_id": 1,
      "name": "Forest Green & Black",
      "original_price": "140",
      "sale_price": "0",
      "default?": true,
      "photos": [
        {
          "thumbnail_url": "urlplaceholder/style_1_photo_number_thumbnail.jpg",
          "url": "urlplaceholder/style_1_photo_number.jpg"
        },
  			{
          "thumbnail_url": "urlplaceholder/style_1_photo_number_thumbnail.jpg",
          "url": "urlplaceholder/style_1_photo_number.jpg"
        }
  			// ...
      ],
      "skus": {
        "37": {
          "quantity": 8,
          "size": "XS"
        },
        "38": {
          "quantity": 16,
          "size": "S"
        },
        "39": {
          "quantity": 17,
          "size": "M"
        },
        //...
      }
    },
  {
    "style_id": 2,
    "name": "Desert Brown & Tan",
    "original_price": "140",
    "sale_price": "0",
    "default?": false,
    "photos": [
      {
        "thumbnail_url": "urlplaceholder/style_2_photo_number_thumbnail.jpg",
        "url": "urlplaceholder/style_2_photo_number.jpg"
       }
      // ...
    ],
    "skus": {
      "37": {
        "quantity": 8,
        "size": "XS"
      },
      "38": {
        "quantity": 16,
        "size": "S"
      },
      "39": {
        "quantity": 17,
        "size": "M"
      },
      //...
    }
  },
  // ...
}
```
## Related Products
Returns the id's of products related to the product specified.
```html
GET /products/:product_id/related
```
### Parameters
| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `product_id` | `integer` | **Required**. ID of the Product requested. |
### Example Output
```json
[
  2,
  3,
  8,
  7
],
```
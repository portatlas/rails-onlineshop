### User stories

+. Shop owner can enter products into the system.
+. Shop owner can manage (edit characteristics) the products and view them.
+. Buyer can view all items and access their details on individual product pages.

### Stretch
- STRETCH ONLY: Advanced Tutorial with Redis & Sidekiq, as an alternative to Delayed Job.
- STRETCH ONLY: Consider using OAuth with Gmail/Facebook for your user model.
1. Buyer can filter products by price, category, reviews, features, etc.
2. Buyer can search for a product by key words.
3. Products are divided into categories.
4. Buyers must be authenticated.
5. Buyer can add items to a shopping cart.
6. Buyer can pay for products online.
7. Buyer can see number of items left on hand (in stock).
8. Buyer can create an account (profile page) of his own.
9. Buyers can review products.
10. Buyer can see reviews for products left by other buyers.
11. Buyer can contact shop owner by e-mail.

### Client Questionnaire
1. What kind of product?
2. Where (international, local)?
3. What is target audience?

### Product Characteristics
1. Name
2. Price
3. Brand
4. Description
5. Number of products on hand
6. Discount

### Fourth Iteration

SHOPPING CART
  Checkout
    - When the user clicks checkout, the number of items in stock should be reduced by the amount that was purchased.
    - When a user clicks checkout, they should receive an email detailing the purchase.

TESTING
- More testing if possible
- Add tests to ensure the behavior above e.g., when an item is out of stock, the ‘Add to cart’ button is disabled.
- Add feature tests for the shopping cart itself and tests for any new models you created

### Andrew
Inventory Management

### Mila
PROFILE PAGE

1.session - create migrations
2.create model relationships
3.updateseed file
4.




~~~~~~~~~~~~~~

### DB SCHEMA For First Iteration

![alt tag](/schema/db_schema_mvp.png)






# Schema for Blog Application
- Please find schema below which i assumed to be best suited. Please let me know if i assumed or miss interpreted anything wrong.
![meister-challenge-db-schema (1)](https://user-images.githubusercontent.com/30047443/126215313-7bfb2536-5ffe-4e1d-a6c8-8fed8216b250.png)

## Steps For Running Application
- Install Ruby 3.0.0 and Rails 6.1.4 in your system.(https://rvm.io/rvm/install)
- Clone this repository to run the application in local.
- Install Mysql and make sure Mysql Server is running in your system.(https://dev.mysql.com/downloads/mysql/)
- Please provide password of root user in .env with variable` ENV['PASSWORD']=`.
- Bundle the gems, It may take time initially.
- Create, migrate and populate seed data in database
```
  - rake db:create
  - rake db:migrate
  - rake db:seed
```
- Run rails server now on port 3000 with command `rails s`.
- I'm also attaching postman collection over here for your reference to check the api's.(https://www.getpostman.com/collections/2242e0d0334e6f2f0a5d)
- Added integration testcases for controllers and can run the specs with command `rspec spec`

## Implementation
- I like versioning of api's as it helps in keep them consistent and can be backward compatabible.
- So added new namespace v1 and added posts, comments and reactions controller.
- Added nested routes with **shallow: true** option so that deep nested routes can be avaoided.(https://guides.rubyonrails.org/routing.html#shallow-nesting)
- Inlcuded api_error_module for all the api's so that error notification mechanism will be consistent throught the api's.
- Used **Form object design pattern** for creating and updating different records.
- Added concerns accordingly for the posts, comments and reactions controller.
- Added model level validation for presence, uniqueness and email validation on models.
- Added 3 different channels for posts, comments and comment reaction for real time update.
- Broadcasted the updated record via different callbacks in each model.
- Added integration test cases for posts, comments and reactions controller.
- Implemented **counter cache** for posts and comments table, which can help for getting count of comments and reactions and can avoid sql queries.
- User has_one association with comment_reactions in the scope of customer. So User can only add one reaction to particular comment.

# Gems Used
- **dry-initializer** - https://github.com/dry-rb/dry-initializer
  - This gem is basically a DSL for declaring params and options in class initializer.
  - I prefer to use this gem instead of constucter to initialize the class.
  - I feel this gem gives us clean way to access params and to initialize different variables, methods, objects.
- **active_model_serializers** - https://github.com/rails-api/active_model_serializers/tree/0-10-stable
- **annotate** - https://github.com/ctran/annotate_models
- **factory_bot_rails** - https://github.com/thoughtbot/factory_bot_rails
- **faker** - https://github.com/faker-ruby/faker

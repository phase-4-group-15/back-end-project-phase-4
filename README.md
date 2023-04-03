# Phase 4 Project
# Article254 App Back-End


## Table of Content
1. [Requirements](#requirements)
2. [Project Guidelines](#project-guidelines)
    - [Models](#models)
    - [Validations](#validations)
    - [Routes](#routes)
3. [Pre-requisites](#pre-requisites)
    - [Creating a Rails App](#creating-a-rails-app)
    - [Creating Active Record Model](#creating-active-record-model)
    - [Creating a Route](#creating-a-route)
4. [Project Setup](#project-setup)
5. [Authors](#author)
6. [License](#license)



## Requirements
For this assessment, you'll be working on an API for tracking pizzas restaurants. You must:
    * Create a Rails API backend.
    * Have at least three resources (three DB tables).


## Project Guidelines
Your project should conform to the following set of guidelines:



### Models
You need to create the following relationships:

- A `Article` has many `reviews`s through `users`
- A `Pizza` has many `Restaurant`s through `RestaurantPizza`
- A `Review` belongs to a `user` and belongs to a `Author`

Add any code needed in the model files to establish the relationships. Then, run the migrations.

You are welcome to generate your own seed data to test the application.




### Routes
Set up the following routes. Make sure to return JSON data in the format
specified along with the appropriate HTTP verb.

```txt
GET /reviews
```

Return JSON data in the format below:

```txt
[
  {
    "id": 1,
    "rating": 5,
    "comment": "Great article!",
    "article_id": 1,
    "user_id": 2,
    "created_at": "2023-04-03T04:50:43.817Z",
    "updated_at": "2023-04-03T04:50:43.817Z"
  },
  {
    "id": 2,
    "rating": 4,
    "comment": "Good read.",
    "article_id": 2,
    "user_id": 1,
    "created_at": "2023-04-03T04:50:43.895Z",
    "updated_at": "2023-04-03T04:50:43.895Z"
  }
]
```

```txt
GET /articles
```

If the `ARticles` exists, return JSON data in the format below:

```txt
{
    "id": 1,
    "title": "How to Make a Perfect Cup of Coffee",
    "description": "Learn the secrets to making a delicious cup of coffee at home.",
    "image": "https://images.unsplash.com/photo-1511920170033-f8396924c348?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80",
    "category": "Food & Drink",
    "user_id": 1,
    "created_at": "2023-04-03T04:50:43.327Z",
    "updated_at": "2023-04-03T04:50:43.327Z",
    "likes": 44,
    "dislikes": 79
  },
  {
    "id": 2,
    "title": "The Benefits of Meditation",
    "description": "Discover how meditation can improve your mental health and well-being.",
    "image": "https://images.unsplash.com/photo-1512438248247-f0f2a5a8b7f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80",
    "category": "Self Improvement",
    "user_id": 2,
    "created_at": "2023-04-03T04:50:43.423Z",
    "updated_at": "2023-04-03T04:50:43.423Z",
    "likes": 54,
    "dislikes": 91
  },
```

If the `Articles` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```txt
{
  "error": "Articles not found"
}
```

```txt
DELETE /article/:id
```



If the `Article` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```txt
{
  "error": "Article not found"
}
```

```txt
GET /me
```

Return JSON data in the format below:

```txt
{
  "id": 3,
  "username": "muigai",
  "email": "muigai@gmail.com",
  "password_digest": "$2a$12$aPGd6ELhPyOnCjnR33FUT.v5Spz8JAYMwul3Xwlza3aYVuiOjtemy",
  "bio": "Is it not meningitis?",
  "created_at": "2023-04-03T04:50:42.706Z",
  "updated_at": "2023-04-03T04:50:42.706Z"
}
```





## Pre-requisites

In order to use this repository you will need the following:

- Operating System **(Windows `10+`, Linux `3.8+`, or MacOS X `10.7+`)**
- RAM >= 4GB
- Free Space >= 2GB

For an easier coding process, <code>Visual Studio Code</code> is a good free code editor to use. Follow the link to download https://code.visualstudio.com

Before you install Rails, you should check to make sure that your system has the proper prerequisites installed. These include:
    - Ruby
    - SQLite3

Follow this link https://guides.rubyonrails.org/getting_started.html for a guide on how to get started with rails

SQLite3 can be used as a VS code extentions

To ensure that the rails gem is installed on your computer or has the latest version of Rails, run:
    <code>gem install rails</code>
This command will install Rails globally, so you only have to run this once, and you'll be able to use Rails from the terminal.



### Creating a Rails App

1. A new rails app was generated using the following command
    - <code> rails new "your-app-name" --skip-javascript </code>
The skip-javascript is option. It tells Rails that we won't be using JavaScript for this project. Using this flag makes the installation significantly faster.

2. Rails will generate a new directory with all the code required to build your application
    - It will run <code>bundle install</code> to download all the required gems
    - It will also initialize <code>git</code> in the newly created directory

3. After generating a rails app navigate into the created Rails app directory using
    - <code>cd "your-app-name"</code>

4. When pushing the code to Github, create an empty github repository with the same name as the app then run:
    - <code>git remote add origin "url"</code>
    - <code>git push --set-upstream origin "branch" </code>



### Creating Active Record Model

1. <code>rails g model "model name" "attribute:data_type"</code>
    * This will set up a:
        - migration table
        - class model
        - a default test file

2. Run the migration using <code>rails db:migrate</code> to create this table for us and generate a schema file.

3. To add data to the database, you can use the faker gem by adding it on the Gemfile 
    - <code>gem 'faker'</code> 
    - run <code>bundle install</code> to activate the gem
            or 
    - hard coding the data that you need
e.g movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
Character.create(name: Faker::Name.name, movie: movies.first)


4. Run <code>rails db:seed</code> to execute all the code in the db/seeds.rb file

5. To test out the code on the Rails console, 
    - run <code>rails c</code> on the terminal.

    Running the console will load the entire Rails environment and give you command line access to the app and the database
    - For example run <code>Restaurant.all</code>. If all is set up properly, it should return all the restaurants created on the database.

    - You could also add the <code>SQLite</code> Visual Studio Code extension to explore and query SQLite databases



### Creating a Route

1. Using rails <code>resource</code> method in the routes file, we can create all the routes we need following REST conventions.

    NB// *Rails follows convention over configuration. When creating the models and controllers*, **_model names are always singular, and controller names are plural._** 

2. Set up the route method in the controller files

3. ActiveModel::Serializer (or AMS) provides an easy way to customize how the JSON rendered by our controllers is structured. It is not build in Rails and therefore have to add it to our Gemfile as <code>gem 'active_model_serializers'</code> 
run <code>bundle install</code> to activate the gem

4. After customizing our JSON in the serializer file, restart your server to adjust the changes made.
    <code>control + c</code>
    <code>rails s</code>

5. To start the server run 
<code>rails s</code> at the root of the application in the terminal
You can verify that it's working properly in the browser by navigating to http://localhost:3000/articles

This should display a list all the articles. You will need to login or signup first in order to view articles

6. In order to shut down your server, you will need to hit <code>control + c</code>



## Project Setup
You can setup this repository by following this manual

1. Clone the repository
    ```{shell}
   git clone https://github.com/phase-4-group-15/back-end-project-phase-4
   ```
2. Ensure the ruby gems are setup in your machine
    ```{shell}
   bundle install
   ```
3. Perform any pending database migrations
   ```{shell}
   rails db:migrate
   ```
4. Perform any pending seed data
   ```{shell}
   rails db:seed
   ```
5. Run the application
    ```{shell}
    rails s or rails server
    ```
6. Open the application from your browser
    ```
   http://localhost:3000/login or use "Thunder Client" VS Code Extension

      or follow the deployment link below
   ```


## Authors
This project was contributed to by: 
* [Nyokabi Kamau](https://github.com/NyokabiKamau/)
* [Abdishukri Mohamed](https://github.com/abdishukri-105)
* [Aisha Jufe](https://github.com/aisha-jufe)
* [Elvis Kericho](https://github.com/kericho)

## License
* This project is licensed under MIT License# back-end-project-phase-4

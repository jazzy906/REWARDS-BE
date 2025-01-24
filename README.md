Rewards App Backend
This is the backend for the Rewards Redemption Web App, built using Ruby on Rails. It provides a RESTful API that enables users to:

View their current reward points balance.
Browse available rewards.
Redeem rewards using their accumulated points.
View a history of their reward redemptions.
Tech Stack
Ruby on Rails (Backend)
MySQL (Database)
Puma (Web Server)

Prerequisites
Ensure the following are installed on your machine:

Ruby (version 3.2.0 or higher) - Install Ruby using rbenv or rvm.
Rails (version 8.0.1 or higher) - Install Rails using gem install rails.
MySQL (version 5.7 or higher) - Install MySQL locally or use a Docker container.
Setup Instructions
Unzip the Reward Application Extract the contents of the project archive.

Install Dependencies Run the following command to install the required gems:

bundle install --path vendor/bundle
Set Up the Database Ensure that MySQL is running and properly configured.

Update the database configuration in config/database.yml with your MySQL username and password.
Then, run the following commands to create the database and apply migrations:

rails db:create
rails db:migrate
Seed the Database Seed the database with initial data (e.g., sample rewards) using:

rails db:seed
Start the Rails Server Start the Rails development server with the following command:

rails server
The server will start at http://localhost:3000. If you need to specify a different port, use: rails server -p 3001

API Endpoints

GET /users: Retrieve all users.
POST /users: Create a new user.
Request Body:
{
  "user": {
    "name": "Jane Doe",
    "points": 2000
  }
}

GET /user/{id}: Retrieve a single user by ID.
PATCH /user/{id}: Update a user's information.
Request Body:
{
  "user": {
    "name": "Jane Doe",
    "points": 2000
  }
}

POST /redeem: Redeem a reward.
Request Body:
{
  "user_id": 1,
  "reward_id": 2
}

GET /users/{id}/history: Retrieve a user's reward redemption history.
GET /users/{id}/balance: Get a user's current points balance.

Additional Configuration

MySQL Configuration: If you are using MySQL, ensure that your credentials are correctly configured in config/database.yml. The username and password should match your local MySQL setup.

Example MySQL setup:

development:
  adapter: mysql2
  encoding: utf8mb4
  pool: 5
  username: your_mysql_username
  password: your_mysql_password
  host: localhost
  database: rewards_app_development

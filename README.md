# Recipe App

Welcome to the Recipe App! This web application allows users to store and view cooking recipes. Users can also calculate the nutritional information of recipes based on the ingredients used.

## Features

- **Recipe Listing:** View a list of cooking recipes on the main page.
- **Recipe Details:** Click on a recipe to view detailed information and instructions.
- **Nutritional Information:** Calculate calories, fats, and proteins based on ingredients.
- **Ingredient Management:** View a list of ingredients.

## Getting Started

### Prerequisites

- Ruby
- Ruby on Rails
- Database SQLite

### Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/recipe-app.git
```
2. Navigate to the application directory:

```bash
cd recipe-app
```

3. Install dependencies:

```bash
bundle install
```

4. Set up the database:

```bash
rails db:migrate
```

5. Start the Rails server:

```bash
rails s
```

## Docker run
1. Build image from the repo root
```bash
docker build -t recipe_app:0.1 .
```
2. Run container using new image
```bash
docker run -p 3000:3000 recipe_app:0.1
```
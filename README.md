# E-Commerce Web Application

## Overview
This project is a simplified e-commerce website modeled after hepsiburada. It is part of the SE 3355 Web Development course midterm assignment. The application features dynamic content presentation, a responsive design suitable for various devices, and supports basic e-commerce functionalities including searching, product listings, and campaign displays.

## Technical Specifications

### Frameworks and Technologies
- **Backend**: Flask
- **Database**: MySQL (via mysql-connector-python)
- **Frontend**: HTML, CSS, JavaScript (Responsive design)

### Features
- **Home Screen**: Displays at least 5 dynamic campaigns, each with relevant images and text.
- **Search Results**: Includes a free text search feature that displays categories related to the search term and filters results by location and the "Yarın Kapımda" feature.
- **Detail Page**: Supports at least 10 products, detailing product numbers, descriptions, prices, images, categories, and available colors.

### Database Model

#### `category` Table
- **Purpose**: Stores categories of products or campaigns.
- **Fields**:
  - `id`: INTEGER AUTO_INCREMENT, Primary Key, Unique identifier for each category.
  - `name`: VARCHAR(255) UNIQUE, The name of the category.

#### `campaign` Table
- **Purpose**: Contains details about different marketing or promotional campaigns.
- **Fields**:
  - `id`: INTEGER AUTO_INCREMENT, Primary Key, Unique identifier for each campaign.
  - `name`: VARCHAR(255) UNIQUE, The name of the campaign.
  - `image`: VARCHAR(255) UNIQUE, Filename or URL of an image for the campaign.
  - `category_id`: INTEGER, Foreign Key referencing `id` of `category` table, nullable on category deletion.
  - `description`: TEXT, A detailed description of the campaign.

#### `product` Table
- **Purpose**: Holds information about products.
- **Fields**:
  - `id`: INTEGER AUTO_INCREMENT, Primary Key, Unique identifier for each product.
  - `name`: VARCHAR(255) UNIQUE, The name of the product.
  - `description`: TEXT, Detailed description of the product.
  - `price`: DECIMAL(10,2), The price of the product.
  - `image`: VARCHAR(255), Filename or URL of the product's image.
  - `category_id`: INTEGER, Foreign Key referencing `id` of `category` table, nullable on category deletion.
  - `location`: VARCHAR(255), Location associated with the product.
  - `fastDelivery`: BOOLEAN, Indicates if the product is available for fast delivery.
  - `colors`: VARCHAR(255), Available colors of the product.

#### Relationships
- Both `campaign` and `product` tables include a `category_id` that establishes a many-to-one relationship with the `category` table, linking each campaign or product to a category. This allows a category to be associated with multiple campaigns and products.

### Example Data
- Categories like Electronics, Fashion, Home & Kitchen.
- Campaigns featuring various products like electronics and fashion items.
- Products such as "Samsung 65\" 4K Smart TV" and "Apple iPhone 13 Pro" with detailed attributes.

### Installation and Setup
1. Install Flask:
2. Install MySQL Connector for Python:
3. Configure your database connection settings in `app.py` or a separate configuration file.

### Running the Application
To run the application locally, navigate to the project directory and execute:
docker run -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3306:3306 mysql

### Deployment
The application is hosted on pythonanywhere.com, accessible via https://yagizito.pythonanywhere.com/.

## Contributors
- Yağız Gönen



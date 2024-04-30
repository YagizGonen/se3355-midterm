CREATE TABLE IF NOT EXISTS `category`
(
    `id`
    INTEGER
    AUTO_INCREMENT,
    `name`
    VARCHAR
(
    255
) UNIQUE,
    PRIMARY KEY
(
    `id`
)
    );
CREATE TABLE IF NOT EXISTS `campaign`
(
    `id`
    INTEGER
    AUTO_INCREMENT,
    `name`
    VARCHAR
(
    255
) UNIQUE,
    `image` VARCHAR
(
    255
) UNIQUE,
    `category_id` INTEGER,
    `description` TEXT,
    PRIMARY KEY
(
    `id`
),
    FOREIGN KEY
(
    `category_id`
) REFERENCES `category`
(
    `id`
) ON DELETE
    SET
    NULL
  ON UPDATE CASCADE
    );
CREATE TABLE IF NOT EXISTS `product`
(
    `id`
    INTEGER
    AUTO_INCREMENT,
    `name`
    VARCHAR
(
    255
) UNIQUE,
    `description` TEXT,
    `price` DECIMAL
(
    10,
    2
),
    `image` VARCHAR
(
    255
),
    `category_id` INTEGER,
    `location` VARCHAR
(
    255
),
    `fastDelivery` BOOLEAN,
    `colors` VARCHAR
(
    255
),
    PRIMARY KEY
(
    `id`
),
    FOREIGN KEY
(
    `category_id`
) REFERENCES `category`
(
    `id`
) ON DELETE
    SET
    NULL
  ON UPDATE CASCADE
    );
INSERT INTO `category` (`name`)
VALUES ('Electronics'),
       ('Moda'),
       ('Ev & Mutfak'),
       ('Güzellik & Kişisel Bakım'),
       ('Spor & Dış Mekan'),
       ('Bebek & Çocuk'),
       ('Evcil Hayvan'),
       ('Müzik Aletleri'),
       ('Dış Mekan Ekipmanları') ON DUPLICATE KEY
UPDATE
    `name` =
VALUES
    (`name`);
INSERT INTO `campaign` (`name`, `image`, `description`, `category_id`)
VALUES ('Elektronik', 'https://images.hepsiburada.net/banners/s/1/1344-756/bannerImage2131_20240417112919.png',
        'Yeni kampanyalar!', 1),
       ('Anneler Günü', 'https://images.hepsiburada.net/banners/s/1/1344-756/bannerImage2122_20240420202404.jpeg',
        'Peşin fiyatına 12 taksit!',
        2),
       ('Market', 'https://images.hepsiburada.net/banners/s/1/1344-756/bannerImage2127_20240416192215.jpeg',
        'Ofis ürünlerinde 600 tl ve üzerine 100 tl indirim',
        3),
       ('Ev ve Yaşam', 'https://images.hepsiburada.net/banners/s/1/1344-756/bannerImage2107_20240424171002.jpeg',
        'Sofra ve mutfak ürünlerinde 200tl ve üzerine %25e varan indirimler',
        4),
       ('Moda ve Güzellik', 'https://images.hepsiburada.net/banners/s/1/1344-756/bannerImage2073_20240401093333.jpeg',
        '1 numaralı markaların çok tavsiye edilen ürünleri', 5) ON DUPLICATE KEY
UPDATE
    `image` =
VALUES
    (`image`), `description` =
VALUES
    (`description`);
INSERT INTO `product` (`name`, `price`, `image`, `category_id`,
                       `location`, `fastDelivery`, `colors`)
VALUES ('Samsung 65 4K Smart TV', 799.99,
        'https://i.pinimg.com/564x/8c/69/99/8c699933250cd6e6834a302c05ffc05b.jpg',
        1, 'USA', 1, 'Black'),
       ('Apple iPhone 13 Pro', 999.99, 'https://i.pinimg.com/originals/07/af/b2/07afb23cdcc9593e149c82052e3bd4c5.jpg',
        1, 'China', 1, 'Gray'),
       ('Nike Air Force 1 Sneakers', 80.00,
        'https://i.ebayimg.com/images/g/R0kAAOSwkCVgenWt/s-l1600.png',
        2, 'USA', 0, 'Black, Red'),
       ('Instant Pot Duo 7-in-1 Electric Pressure Cooker',
        99.99, 'https://i.pinimg.com/564x/9a/cf/11/9acf11a7764ca97f4de344fecc95f651.jpg',
        3, 'China', 0, 'Black, Blue'),
       ('LOréal Paris True Match Super Blendable Foundation',
        15.99, 'https://i.pinimg.com/564x/9a/21/f4/9a21f4b329d8bcd173fc738817f1529b.jpg',
        4, 'USA', 1, 'Black'),
       ('Adidas Superstar Sneakers', 70.00,
        'https://i.pinimg.com/564x/d0/2d/b3/d02db3b3cc031d6d7d05dcb0a048cc08.jpg',
        2, 'USA', 1, 'Orange, Black'),
       ('Canon EOS Rebel T7 DSLR Camera',
        549.99, 'https://i.pinimg.com/564x/b8/fe/56/b8fe56777f82906033267007be3d70fd.jpg',
        1, 'Japan', 1, 'Black'),
       ('Ray-Ban Aviator Sunglasses', 150.00,
        'https://i.pinimg.com/564x/bb/5a/0e/bb5a0e797eca270917f858038fd5a132.jpg',
        2, 'Italy', 0, 'Black, Orange'),
       ('Fitbit Charge 3 Fitness Tracker',
        149.99, 'https://i.pinimg.com/564x/f5/bb/6c/f5bb6c1971a3d832733df68e9e6611ed.jpg',
        5, 'USA', 1, 'Black, Green'),
       ('Instant Pot Duo Crisp Air Fryer',
        149.99, 'https://i.pinimg.com/564x/13/07/cc/1307cc16885c6f72f7f4934bcf7d4209.jpg',
        3, 'China', 1, 'Black, Green'),
       ('Olay Regenerist Micro-Sculpting Cream',
        24.99, 'https://i.pinimg.com/564x/59/1d/97/591d97f131d839ac4b65d0b0274dbc41.jpg',
        4, 'USA', 0, 'White'),
       ('Vans Old Skool Sneakers', 55.00,
        'https://i.pinimg.com/564x/37/b9/cb/37b9cb4fb869598508d6aac8c55b9f88.jpg',
        2, 'USA', 1, 'Black, Red'),
       ('GoPro HERO8 Black Action Camera',
        399.99, 'https://i.pinimg.com/564x/8c/c9/1d/8cc91d62b6e199ba06877d5e5874862a.jpg',
        9, 'USA', 0, 'Black'),
       ('Bose QuietComfort 35 II Wireless Headphones',
        349.99, 'https://i.pinimg.com/564x/fe/11/2a/fe112a4bdc17f96c513c6387808576ea.jpg',
        1, 'USA', 1, 'Black, Blue'),
       ('Anker PowerCore 20000 Portable Power Bank',
        49.99, 'https://i.pinimg.com/564x/de/b3/d4/deb3d42f3b495f5165c8ed0e0da77fdc.jpg',
        1, 'China', 1, 'Black, Orange'),
       ('Nike Air Max 270 Sneakers', 120.00,
        'https://i.pinimg.com/564x/42/87/23/42872307d4deb41b7121f5e18ef29b16.jpg',
        2, 'USA', 1, 'Black, Green'),
       ('Polaroid Instant Film Camera',
        99.99, 'https://i.pinimg.com/564x/46/02/ba/4602badeba89e955a17a166b42d078d0.jpg',
        1, 'USA', 1, 'Black, Green'),
       ('Lego Creator Expert Millennium Falcon',
        349.99, 'https://i.pinimg.com/564x/8d/72/25/8d7225d0fa9408bfd3ab7a32fc99244f.jpg',
        6, 'Denmark', 0, 'Black, Orange'),
       ('Fitbit Ionic Smartwatch', 199.99,
        'https://i.pinimg.com/564x/a4/93/6c/a4936c6478a2f0df70626aad0595124d.jpg',
        5, 'USA', 1, 'Black, Red'),
       ('Samsung Galaxy Watch Active2',
        279.99, 'https://i.pinimg.com/564x/56/07/42/5607422731ddd807d12b11295b5905d3.jpg',
        1, 'South Korea', 1, 'Black, Green'),
       ('Coca-Cola Soda Maker', 99.99, 'https://i.pinimg.com/564x/98/bd/3c/98bd3c8232b4b7d14064fa4ccccc8b7b.jpg',
        1, 'USA', 1, 'Multiple Colors'),
       ('Shark Navigator Lift-Away Professional Vacuum',
        199.99, 'https://i.pinimg.com/564x/0d/19/29/0d192970814fe3b3908a8fc9b0425160.jpg',
        3, 'USA', 0, 'Black'),
       ('Anker Soundcore Space Q32 Wireless Headphones', 69.99,
        'https://i.pinimg.com/564x/fd/60/cd/fd60cdbc696c31fced99cf70366dc0e3.jpg',
        1, 'China', 1, 'Black, White'),
       ('Breville BDC600 Smart Oven', 249.99,
        'https://i.pinimg.com/564x/62/27/ec/6227ecc8392861b6358a6db21dc4fde7.jpg',
        3, 'USA', 1, 'Black'),
       ('Yamaha C30 Klasik Gitar', 399.99,
        'https://i.pinimg.com/564x/69/16/6c/69166c9741aa8e05360907c091fae03c.jpg',
        8, 'USA', 1, 'Red'),
       ('Bonnie Beef Dana Etli Yetişkin Kedi Maması 10 kg', 499.99,
        'https://productimages.hepsiburada.net/s/279/550/110000265499375.jpg/format:webp',
        7, 'USA', 0, 'Black') ON DUPLICATE KEY
UPDATE
    `name` =
VALUES
    (`name`);
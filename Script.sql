
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Publishers;
DROP TABLE IF EXISTS Readers CASCADE;

CREATE TABLE Publishers (
  Publisher_name VARCHAR(100) PRIMARY KEY,
  City VARCHAR(100)
);

CREATE TABLE Readers (
  card_number INT PRIMARY KEY,
  full_name VARCHAR(100),
  address VARCHAR(100),
  Phone VARCHAR(15)
);

CREATE TABLE Books (
  Сipher INT PRIMARY KEY,
  Book_name VARCHAR(100),
  Autor VARCHAR(100),
  Publication_year INT,
  Page_volume INT,
  Price DECIMAL(10,2),
  Copies_quantity INT,
  card_number INT,
  Publisher_name VARCHAR(100),
  CONSTRAINT fk_card_number FOREIGN KEY (card_number) REFERENCES Readers(card_number),
  CONSTRAINT fk_publisher_name FOREIGN KEY (Publisher_name) REFERENCES Publishers(Publisher_name)
);

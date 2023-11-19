DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Publishers;
DROP TABLE IF EXISTS Readers CASCADE;

CREATE TABLE Publishers (
  Publisher_id SERIAL PRIMARY KEY,
  Publisher_name VARCHAR(100),
  City VARCHAR(100)
);

CREATE TABLE Authors (
  Author_id SERIAL PRIMARY KEY,
  Author_name VARCHAR(100)
);

CREATE TABLE Readers (
  card_number INT PRIMARY KEY,
  full_name VARCHAR(100),
  address VARCHAR(100),
  Phone VARCHAR(15)
);

CREATE TABLE Books (
  Book_id SERIAL PRIMARY KEY,
  Cipher INT,
  Book_name VARCHAR(100),
  Publication_year INT,
  Page_volume INT,
  Price DECIMAL(10,2),
  Copies_quantity INT,
  Publisher_id INT,
  CONSTRAINT fk_publisher_id FOREIGN KEY (Publisher_id) REFERENCES Publishers(Publisher_id)
);

CREATE TABLE Books_Authors (
  Book_id INT,
  Author_id INT,
  CONSTRAINT fk_book_id FOREIGN KEY (Book_id) REFERENCES Books(Book_id),
  CONSTRAINT fk_author_id FOREIGN KEY (Author_id) REFERENCES Authors(Author_id)
);

CREATE TABLE Loans (
  Loan_id SERIAL PRIMARY KEY,
  Book_id INT,
  Reader_card_number INT,
  Loan_date DATE,
  Return_date DATE,
  CONSTRAINT fk_loan_book_id FOREIGN KEY (Book_id) REFERENCES Books(Book_id),
  CONSTRAINT fk_loan_reader_card_number FOREIGN KEY (Reader_card_number) REFERENCES Readers(card_number)
);

ALTER TABLE Publishers ADD CONSTRAINT unique_publisher_name_city UNIQUE (Publisher_name, City);
ALTER TABLE Books ADD CONSTRAINT unique_book_cipher UNIQUE (Cipher);
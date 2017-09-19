# Psql tutorial (postgres, postgresql)


```bash
$ rails db

# drop a column
$ ALTER TABLE <table-name> DROP COLUMN <column_name>;

# drop a table
$ DROP TABLE <table-name>;


# list, discribe tables
$ \d

# list, discribe a table
$ \d <table-name>
```


```postgresql
DROP TABLE items;

CREATE TABLE items(
    id SERIAL PRIMARY KEY,
    text CHAR(255) NOT NULL,
    is_done boolean NOT NULL
);


SELECT * FROM items;

INSERT INTO items (text, is_done) VALUES ('wash car again', false);
INSERT INTO items (text, is_done) VALUES ('wash dishes', false);
INSERT INTO items (text, is_done) VALUES ('wash house', false);
```

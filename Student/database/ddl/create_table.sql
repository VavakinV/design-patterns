CREATE TABLE student (
	id serial PRIMARY KEY, 
	surname varchar(40) NOT NULL,
	firstname varchar(40) NOT NULL,
	lastname varchar(40) NOT NULL,
	date_of_birth date NOT NULL,
	telegram varchar(40),
	email varchar(40),
	phone_number varchar(40),
	git varchar(40)
);
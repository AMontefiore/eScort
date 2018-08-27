CREATE DATABASE IF NOT EXISTS escortDB;
SHOW DATABASES;
USE escortDB;
CREATE TABLE IF NOT EXISTS contacts (
contact_id int not null auto_increment primary key,
f_Name VARCHAR(20),
l_Name VARCHAR(20),
phone_Number LONG
);
CREATE TABLE IF NOT EXISTS message (
message_id int not null auto_increment primary key,
sender_id int,
recipient_id int,
message_body text,
date_time date ,
FOREIGN KEY (sender_id) REFERENCES contacts(contact_id),
FOREIGN KEY (recipient_id) REFERENCES contacts(contact_id)
);
CREATE TABLE IF NOT EXISTS trip (
trip_id int not null auto_increment primary key,
current_location long,
destionation_time date,
distance_remaining long
);
CREATE TABLE IF NOT EXISTS goal (
goal_id int not null auto_increment primary key,
trip_id int,
destionation_location long,
destionation_time date,
isComplete boolean,
FOREIGN KEY (trip_id) REFERENCES trip(trip_id)
);
CREATE TABLE IF NOT EXISTS users (
user_id int not null auto_increment primary key,
u_name VARCHAR(20),
secret VARCHAR(20),
message_id int,
contact_id int,
goal_id int,
FOREIGN KEY (message_id) REFERENCES message(message_id),
FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
FOREIGN KEY (goal_id) REFERENCES goal(goal_id)
);
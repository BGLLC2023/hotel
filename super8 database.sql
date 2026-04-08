CREATE DATABASE hotel;

USE hotel;


CREATE TABLE hotel_data (
    date varchar(20),
    dow VARCHAR(4),
    revenue FLOAT,
    revenue_ly FLOAT,
    revenue_diff FLOAT,
    revpar FLOAT,
    revpar_ly FLOAT,
    adr FLOAT,
    adr_ly FLOAT,
    adr_diff FLOAT,
    of_bookings INT,
    of_bookings_ly INT,
    occupancy DECIMAL(5, 2),
    occupancy_ly DECIMAL(5, 2),
    dates datetime
);

select * from hotel_report;


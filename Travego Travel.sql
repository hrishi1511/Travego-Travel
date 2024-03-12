Drop database project;

Create Database Travego;
use Travego;

create table passenger(
passenger_id int,
passenger_name varchar(20),
category varchar(20),
Gender varchar(20),
Boarding_city varchar(20),
Destination_city varchar(20),
Distance int,
Bus_Type varchar(20)
);

Create table price(
id int,
Bus_type varchar(20),
Distance int,
Price int
);

insert into passenger 
    (passenger_id, passenger_name, category, Gender, Boarding_city, Destination_city, Distance, Bus_Type) 
values 
    (1, "sejal", "ac", "f", "bengaluru", "chennai", 350, "sleeper"),
    (2, "anmol", "non ac", "m", "mumbai", "hyderabad", 700, "sitting"),
    (3, "pallavi", "ac", "f", "panaji", "bengaluru", 600, "sleeper"),
    (4, "khushboo", "ac", "f", "chennai", "mumbai", 1500, "sleeper"),
    (5, "udit", "non ac", "m", "trivandrum", "panaji", 1000, "sleeper"),
    (6, "ankur", "ac", "m", "nagpur", "hyderabad", 500, "sitting"),
    (7, "hemanth", "non ac", "m", "panaji", "mumbai", 700, "sleeper"),
    (8, "manish", "non ac", "m", "hyderabad", "bengaluru", 500, "sitting"),
    (9, "piyush", "ac", "m", "pune", "nagpur", 700, "sitting");
    
insert into price
    (id,Bus_type,Distance,Price)
values
    (1,"sleeper",350,770),
    (2,"sleeper",500,1100),
    (3,"sleeper",600,1320),
    (4,"sleeper",700,1540),
    (5,"sleeper",1000,2200),
    (6,"sleeper",1200,2640),
    (7,"sleeper",1500,2700),
    (8,"sitting",500,620),
    (9,"sitting",600,744),
    (10,"sitting",700,868),
    (11,"sitting",1000,1240),
    (12,"sitting",1200,1488),
    (13,"sitting",1500,1860);


SELECT COUNT(*) AS FemalePassengerCount
FROM passenger
WHERE Gender = 'f' AND Distance >= 600;

SELECT *
FROM passenger
WHERE Distance > 500 AND Bus_Type = 'sleeper';

SELECT passenger_name
FROM passenger
WHERE LEFT(passenger_name, 1) = 'S';

SELECT 
    p.passenger_name,
    p.Boarding_city,
    p.Destination_city,
    p.Bus_Type,
    p.Distance,
    pr.Price AS Price
FROM 
    passenger p
JOIN 
    price pr ON p.Bus_Type = pr.Bus_Type; 
    
    SELECT 
    p.passenger_name,
    p.Distance,
    Price AS Ticket_Price
FROM 
    passenger p
JOIN 
    price pr ON p.Bus_Type = pr.Bus_Type
WHERE 
    p.Distance = 1000 AND p.Bus_Type = 'sitting'
LIMIT 0, 1000;

SELECT 
    p.passenger_name,
    p.Boarding_city,
    p.Destination_city,
    p.Bus_Type,
    p.Distance,
    Price AS Ticket_Price
FROM 
    passenger p
JOIN 
    price pr ON p.Bus_Type = pr.Bus_Type
WHERE 
    p.Boarding_city = 'Bangalore'
    AND p.Destination_city = 'Panaji';


SET SQL_SAFE_UPDATES = 0;

UPDATE passenger
SET category = 'Non-AC'
WHERE Bus_Type = 'sleeper' AND passenger_id > 0;

SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM passenger
WHERE passenger_name = 'Piyush';
COMMIT;

TRUNCATE TABLE passenger;
SELECT COUNT(*) AS RowCount FROM passenger;

DROP TABLE passenger;










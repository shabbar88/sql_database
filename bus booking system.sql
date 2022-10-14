show databases;
create DATABASE BUS_BOOKING_SYSTEM;
USE BUS_BOOKING_SYSTEM;
create table passengers(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
age INT  NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE
);
desc passengers;

create table seats(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
bus_row char(1) NOT NULL,
number INT NOT NULL CHECK(number BETWEEN 0 AND 5)
);
DESC seats;

create table reserved_seats(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
seat_id INT NOT NULL,
FOREIGN KEY(seat_id) REFERENCES seats(id)

);
desc reserved_seats;


show tables;

create table bookings(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
passenger_id INT NOT NULL,
reservedseat_id INT NOT NULL,
date_of_journey DATETIME NOT NULL,
FOREIGN KEY (passenger_id) references passengers(id),
FOREIGN KEY (reservedseat_id) REFERENCES reserved_seats(id)

);
desc bookings;

/*
its time to fill the data

*/
DESC PASSENGERS;
SELECT * FROM passengers;
INSERT INTO passengers(name,age,email)
values('shabbar',32,'tauquir.ahmed90'),('tauquir',31,'shabbar88@yahoo'),
('sumit',50,'sumit@gmail'),('Govind',32,'govind@gmail');

select * from seats;
INSERT INTO seats(bus_row,number)
values('A',1),('A',2),('A',3),('A',4),('B',1),('B',2),('B',3),('B',4),
('C',1),('C',2),('C',3),('C',4),('D',1),('D',2),('D',3),('D',4);


SELECT * from reserved_seats;
insert into reserved_seats(seat_id)
values(1),(2),(3),(4),(5),(6),(7),(8);


select * from bookings;
insert into bookings(passenger_id,reservedseat_id,date_of_journey)
values(6,3,'2022-11-12'),(7,5,'2022-11-15');
/*
doing complex query
*/

select  passengers.name,bookings.date_of_journey, seats.bus_row, seats.number FROM passengers
join bookings ON  bookings.passenger_id=passengers.id
join reserved_seats on bookings.reservedseat_id=reserved_seats.id
join seats on reserved_seats.seat_id=seats.id;



CREATE DATABASE RailwayReservationSystem;
USE RailwayReservationSystem;

-- Create Stations Table
CREATE TABLE Stations(
 StationID INT PRIMARY KEY auto_increment,
 StationCode VARCHAR(30) NOT NULL,
 StationName VARCHAR(20)
 );
 
 -- Create Trains Table
CREATE TABLE Trains(
 TrainID INT PRIMARY KEY auto_increment,
 TrainName VARCHAR(30) NOT NULL,
 TrainType VARCHAR(30),
 SourceStationID INT,
 DestinationStationID INT,
CONSTRAINT FK_SourceStationID FOREIGN KEY(SourceStationID) REFERENCES Stations(StationID),
CONSTRAINT FK_DestinationStationID FOREIGN KEY(DestinationStationID) REFERENCES Stations(StationID)
);

-- Create Routes Table
CREATE TABLE Routes(
 RouteID INT PRIMARY KEY,
 TrainID INT,
 StationID INT,
 DepartureTime TIME,
 ArrivalTime TIME, 
CONSTRAINT FK_TrainID FOREIGN KEY(TrainID) REFERENCES Trains(TrainID),
CONSTRAINT FK_StationID FOREIGN KEY(StationID) REFERENCES Stations(StationID)
);

-- Create Train Schedule Table
CREATE TABLE TrainSchedule(
 ScheduleID INT PRIMARY KEY,
 TrainID INT,
 StationID INT,
 DepartureTime DATETIME,
 ArrivalTime DATETIME,
FOREIGN KEY(TrainID) REFERENCES Trains(TrainID),
FOREIGN KEY(StationID) REFERENCES Stations(StationID)
 );
 
 -- Create Passengers Table
CREATE TABLE Passengers(
 PassengerID INT PRIMARY KEY,
 FullName VARCHAR(30) NOT NULL,
 PhoneNumber VARCHAR(15),
 Age INT,
 Gender VARCHAR(10)
 );
 
 -- Create Tickets Table
CREATE TABLE Tickets(
 TicketID INT PRIMARY KEY,
 PassengerID INT,
 TrainID INT,
 BookingDate DATE,
 TravelDate DATE,
 SourceStationID INT,
 DestinationStationID INT,
 SeatNumber VARCHAR(10),
 Class VARCHAR(50),
 Position VARCHAR(50),
 Fare Decimal(10,2),
CONSTRAINT FK_PassengerID FOREIGN KEY(PassengerID) REFERENCES Passengers(PassengerID),
FOREIGN KEY(TrainID) REFERENCES Trains(TrainID),
FOREIGN KEY(SourceStationID) REFERENCES Stations(StationID),
FOREIGN KEY(DestinationStationID) REFERENCES Stations(StationID)
);
 
 INSERT INTO Stations(StationCode, StationName) values("TEN", "TIRUNELVELI"),
("MDU", "MADURAI JN"),
("MDU", "MADURAI JN"),
("MDU", "MADURAI JN"),
("SCT", "SENGOTTAI"),
("CAPE", "KANYAKUMARI"),
("QLN", "KOLLAM JN"),
("GUV", "GURUVAYUR"),
("TEN", "TIRUNELVELI"),
("TN", "TUTICORIN");

INSERT INTO Trains(TrainName, TrainType, SourceStationID, DestinationStationID) values("VANDE BHARAT", "Shatabdi Express", 1, 2),
("TEJAS EXPRESS", "Shatabdi Express", 2, 3),
("VAIGAI SF EXP", "SUPERFAST Express", 3, 4),
("PANDIAN SF EXP", "SUPERFAST Express", 4, 5),
("POTHIGAI SF EXP", "SUPERFAST Express", 5,6),
("KANYAKUMARI EXP", "SUPERFAST Express", 6,7),
("ANANTAPURI EXP", "SUPERFAST Express", 7, 8),
("GUV CHENNAI EXP", "SUPERFAST Express", 8, 9),
("NELLAI SF EXP", "SUPERFAST Express", 9, 10),
("PEARL CITY EXP", "SUPERFAST Express", 10, 1);

INSERT INTO Routes values (1, 1, 1, '06:00:00', '13:50:00'),
(2, 2, 2, '15:00:00', '21:15:00'),
(3, 3, 3, '06:40:00', '13:08:00'),
(4, 4, 4, '21:20:00', '04:18:00'),
(5,5,5, '21:35:00', '04:48:00'),
(6, 6, 6, '22:10:00', '05:23:00'),
(7, 7, 7, '21:55:00', '05:13:00'),
(8, 8, 8, '12:15:00', '19:43:00'),
(9, 9, 9, '22:25:00', '05:53:00'),
(10, 10, 10, '23:05:00', '06:38:00');

INSERT INTO TrainSchedule values (1, 1, 1, '2024-06-01 06:00:00', '2024-08-01 13:50:00'),
(2, 2, 2, '2024-07-01 15:00:00', '2024-08-11 21:15:00'),
(3, 3, 3, '2024-08-01 06:40:00', '2024-08-12 13:08:00'),
(4, 4, 4, '2024-06-10 21:20:00', '2024-08-13 04:18:00'),
(5, 5, 5, '2024-06-12 21:35:00', '2024-08-11 04:48:00'),
(6, 6, 6, '2024-06-14 22:10:00', '2024-08-12 05:23:00'),
(7, 7, 7, '2024-07-01 21:55:00', '2024-07-10 05:13:00'),
(8, 8, 8, '2024-08-01 12:15:00', '2024-08-15 19:43:00'),
(9, 9, 9, '2024-06-11 22:25:00', '2024-07-20 05:53:00'),
(10, 10, 10, '2024-08-11 23:05:00', '2024-08-15 06:38:00');

INSERT INTO Passengers values(1, "Sheeli", "9715561719", 35, "Female"),
 (2, "Charles", "9615581716", 36, "Male"),
 (3, "Anitha", "9815461629", 20, "Female"),
 (4, "Pooja", "9765464739", 25, "Female"),
 (5, "John", "9715661819", 40, "Male"),
 (6, "Vijay", "9445562719", 50, "Male"),
 (7, "Shalini", "9665581916", 29, "Female"),
 (8, "Shanthi", "9995461629", 57, "Female"),
 (9, "Mayilraj", "7373464739", 65, "Male"),
 (10, "Dinesh", "9842661819", 35, "Male");
 
 INSERT INTO Tickets values(1, 1, 1, "2024-06-01", "2024-08-01", 1, 2, "SL1", "AC", "CONFIRMED", 1500.30),
 (2, 2, 2, "2024-07-01", "2024-08-11", 2, 3, "SL14", "Sleeper", "CONFIRMED", 500.20),
 (3, 3, 3, "2024-08-01", "2024-08-12", 3, 4, "SL4", "Sleeper", "Cancelled", 420.30),
 (4, 4, 4, "2024-06-10", "2024-08-13", 4, 5, "SL6", "AC", "CONFIRMED", 1200.80),
 (5, 5, 5, "2024-06-12", "2024-08-11", 5, 6, "SL5", "Sleeper", "CONFIRMED", 500.30),
 (6, 6, 6, "2024-06-14", "2024-08-12", 6, 7, "SL23", "Sleeper", "Cancelled", 430.00),
 (7, 7, 7, "2024-07-01", "2024-07-10", 7, 8, "Null", "Sleeper", "Waiting", 350.60),
 (8, 8, 8, "2024-08-01", "2024-08-15", 8, 9, "SL42", "Sleeper", "CONFIRMED", 450.90),
 (9, 9, 9, "2024-06-11", "2024-07-20", 9, 10, "A3", "AC", "CONFIRMED", 1590.95),
 (10, 10, 10, "2024-08-11", "2024-08-15", 10, 1, "Null", "Sleeper", "Waiting", 550.30);


 select * FROM stations;
 select * FROM trains;
 select * FROM routes;
 select * FROM passengers;
 select * FROM trainschedule;
 select * FROM tickets;
 
 SHOW TABLES;
  
  SELECT s.StationName,t.TrainName FROM Stations s INNER JOIN Trains t on s.StationID=t.SourcestationID where s.Stationid=2;
  SELECT * FROM Stations s INNER JOIN Trains t on s.StationID=t.SourcestationID;
  SELECT * FROM Routes r Inner join TrainSchedule ts on r.trainid=ts.trainid;
  SELECT * FROM Passengers p INNER JOIN Tickets tic ON p.passengerid=tic.passengerid where position= "confirmed";
  create view travel as
  SELECT p.passengerid,p.fullname,p.phonenumber,p.age,p.gender,tic.sourcestationid,tic.destinationstationid,tic.seatnumber,tic.class,tic.position,tic.fare 
  FROM Passengers p 
  INNER JOIN Tickets tic
  ON p.passengerid=tic.passengerid;
   select * FROM travel;
  SELECT PassengerName from passengers,tickets where position= "cancelled";
  SELECT gender,fullname from passengers p where p.Gender='male' group by age;
  SELECT * from passengers p where p.FullName like "%__li%";
  delimiter $$
  create procedure passengertravel(in id int)
  begin
  select * from passengers where passengerid=id;
  select * from tickets where ticketid=id;
  end $$
  delimiter ;
    call passengertravel(5);
  
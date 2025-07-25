create database Airline;

-- Drop tables if they already exist
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Seats;
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Flights;

-- 1. Flights Table
CREATE TABLE Flights (
    Flight_ID INT PRIMARY KEY, 
    Airline VARCHAR(50), 
    Source VARCHAR(50), 
    Destination VARCHAR(50), 
    Departure_Time DATETIME, 
    Arrival_Time DATETIME, 
    Total_Seats INT
);

-- 2. Passengers Table
CREATE TABLE Passengers (
    Passenger_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- 3. Seats Table
CREATE TABLE Seats (
    Seat_ID INT PRIMARY KEY,
    Flight_ID INT,
    Seat_Number VARCHAR(10) UNIQUE,
    Booking_Status VARCHAR(20) DEFAULT 'Available',
    FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID)
);

-- 4. Bookings Table
CREATE TABLE Bookings (
    Booking_ID INT PRIMARY KEY,
    Flight_ID INT,
    Passenger_ID INT,
    Seat_ID INT,
    Booking_Date DATE,
    Status VARCHAR(20) DEFAULT 'Booked',
    FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID),
    FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID),
    FOREIGN KEY (Seat_ID) REFERENCES Seats(Seat_ID)
);


INSERT INTO Flights VALUES
(1, 'Air India', 'Delhi', 'Mumbai', '2025-07-20 09:00:00', '2025-07-20 11:00:00', 150),
(2, 'IndiGo', 'Bangalore', 'Chennai', '2025-07-21 14:30:00', '2025-07-21 15:30:00', 180);


INSERT INTO Passengers VALUES
(101, 'Nayana', 'nayana@email.com', '9876543210'),
(102, 'Arshad', 'arshad@email.com', '9123456780'),
(103, 'Itachi', 'itachi@uchiha.com', '9998887776'),
(104, 'Esha', 'esha@email.com', '8887776665'),
(105, 'Farhan', 'farhan@email.com', '8123456789'),
(106, 'Aditi', 'aditi@email.com', '9812345670'),
(107, 'Yash', 'yash@email.com', '9845612370'),
(108, 'Sana', 'sana@email.com', '9345621780'),
(109, 'Ravi', 'ravi@email.com', '9876541200'),
(110, 'Meera', 'meera@email.com', '9821346780'),
(111, 'Kiran', 'kiran@email.com', '9898989898'),
(112, 'Anjali', 'anjali@email.com', '9765432187'),
(113, 'Shyam', 'shyam@email.com', '9988776655'),
(114, 'Pooja', 'pooja@email.com', '9123451234'),
(115, 'Rakesh', 'rakesh@email.com', '9234567890'),
(116, 'Tara', 'tara@email.com', '9876544321'),
(117, 'Aman', 'aman@email.com', '9765432100'),
(118, 'Vidya', 'vidya@email.com', '9000001234'),
(119, 'Sudeep', 'sudeep@email.com', '8998887776'),
(120, 'Maya', 'maya@email.com', '9887766554');


INSERT INTO Seats VALUES
-- Flight 1
(1, 1, 'A1', 'Available'), (2, 1, 'A2', 'Available'), (3, 1, 'A3', 'Available'),
(4, 1, 'A4', 'Available'), (5, 1, 'A5', 'Available'), (6, 1, 'A6', 'Available'),
(7, 1, 'A7', 'Available'), (8, 1, 'A8', 'Booked'), (9, 1, 'A9', 'Booked'), (10, 1, 'A10', 'Available'),

-- Flight 2
(11, 2, 'B1', 'Booked'), (12, 2, 'B2', 'Booked'), (13, 2, 'B3', 'Booked'),
(14, 2, 'B4', 'Available'), (15, 2, 'B5', 'Available'), (16, 2, 'B6', 'Available'),
(17, 2, 'B7', 'Booked'), (18, 2, 'B8', 'Available'), (19, 2, 'B9', 'Booked'), (20, 2, 'B10', 'Booked');


INSERT INTO Bookings VALUES
(301, 1, 101, 1, '2025-07-12', 'Booked'),
(302, 1, 102, 2, '2025-07-12', 'Booked'),
(303, 1, 103, 3, '2025-07-13', 'Booked'),
(304, 1, 104, 4, '2025-07-13', 'Booked'),
(305, 1, 105, 5, '2025-07-13', 'Booked'),
(306, 1, 106, 6, '2025-07-14', 'Booked'),
(307, 1, 107, 7, '2025-07-14', 'Booked'),
(308, 1, 108, 8, '2025-07-14', 'Booked'),
(309, 1, 109, 9, '2025-07-15', 'Booked'),
(310, 1, 110, 10, '2025-07-15', 'Booked'),

(311, 2, 111, 11, '2025-07-15', 'Booked'),
(312, 2, 112, 12, '2025-07-15', 'Booked'),
(313, 2, 113, 13, '2025-07-16', 'Booked'),
(314, 2, 114, 14, '2025-07-16', 'Booked'),
(315, 2, 115, 15, '2025-07-17', 'Booked'),
(316, 2, 116, 16, '2025-07-17', 'Booked'),
(317, 2, 117, 17, '2025-07-17', 'Booked'),
(318, 2, 118, 18, '2025-07-18', 'Booked'),
(319, 2, 119, 19, '2025-07-18', 'Booked'),
(320, 2, 120, 20, '2025-07-18', 'Booked');

-- ---------------------------------------------------------------------------
-- To find available seats
select Seat_Number from Seats where Flight_ID = 1 AND Booking_Status = "Available";

-- Search flights from a source to a destination
select * from flights where Source = 'Delhi' and Destination = 'Mumbai';

-- Show all bookings for a specific passenger
SELECT b.Booking_ID, f.Airline, s.Seat_Number, b.Booking_Date
FROM Bookings b
JOIN Flights f ON b.Flight_ID = f.Flight_ID
JOIN Seats s ON b.Seat_ID = s.Seat_ID
WHERE b.Passenger_ID = 101;

-- Create a View for Booking Summary
CREATE VIEW BookingSummary AS
SELECT 
    b.Booking_ID, p.Name AS Passenger, f.Airline, f.Source, f.Destination, 
    s.Seat_Number, b.Booking_Date, b.Status
FROM Bookings b
JOIN Passengers p ON b.Passenger_ID = p.Passenger_ID
JOIN Flights f ON b.Flight_ID = f.Flight_ID
JOIN Seats s ON b.Seat_ID = s.Seat_ID;


SELECT * FROM BookingSummary;

-- Show all available seats for a flight
SELECT Seat_Number FROM Seats WHERE Flight_ID = 1 AND Booking_Status = false;

-- View all bookings for a specific passenger
SELECT * FROM Bookings WHERE Passenger_ID = 101;

-- Cancel a booking (mark seat as available again)
UPDATE Seats SET Booking_Status = false WHERE Seat_ID = 8;
UPDATE Bookings SET Status = 'Cancelled' WHERE Booking_ID = 308;


-- Add a Trigger to Auto-Update Seat Status on Booking
DELIMITER //

CREATE TRIGGER update_seat_status_after_booking
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Seats 
    SET Booking_Status = 'Booked'
    WHERE Seat_ID = NEW.Seat_ID;
END;
//


create trigger update_seat_status_after_cancel
after delete on Bookings
for each row
begin
	update seats
    set Booking_Status = 'Available'
    where Seat_ID = old.Seat_ID;
end;
//

DELIMITER ;







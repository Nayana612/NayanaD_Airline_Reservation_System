# ✈️ Airline Reservation System – SQL Project

This project simulates a simple Airline Reservation System using **MySQL**. It is designed to manage flights, passengers, seat availability, and bookings efficiently through a relational database schema.

## 📌 Features
- Fully normalized database with 4 tables:
  - `Flights`, `Passengers`, `Seats`, and `Bookings`
- Enforced **foreign key relationships** to maintain data integrity
- Trigger to **automatically update seat status** upon booking cancellation
- Sample data for 2 flights, 20 passengers, and 20 bookings
- Useful SQL queries for flight summary, booking status, and seat tracking

## 📊 Schema Overview
- **Flights**: Details like airline, route, and timing
- **Passengers**: Passenger information
- **Seats**: Linked to flights, tracks booking status
- **Bookings**: Links flight, passenger, seat, and date

## 🔍 Example Queries
```sql
-- Get all bookings with passenger names
SELECT p.Name, f.Airline, s.Seat_Number, b.Booking_Date
FROM Bookings b
JOIN Passengers p ON b.Passenger_ID = p.Passenger_ID
JOIN Flights f ON b.Flight_ID = f.Flight_ID
JOIN Seats s ON b.Seat_ID = s.Seat_ID;

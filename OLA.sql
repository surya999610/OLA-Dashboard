CREATE database Ola;
Use Ola;

#1. Retrieve all successful bookings:
Create view successful_Bookings As
SELECT * FROM bookings
WHERE Booking_Status = 'Success';

SELECT * From Successful_Bookings

#2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, 
AVG(Ride_Distance) AS avg_distance 
FROM bookings
GROUP BY Vehicle_Type;

Select * From ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM cancelled_rides_by_customers;

#4. List the top 5 customer who booked the highest number of rides:
CREATE VIEW top_5_customer as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM top_5_customer;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW personal_and_car_related AS
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM personal_and_car_related;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW min_and_max AS
SElECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_raring
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM min_and_max

#7. Retrieve all rides where payment was made using UPi:
CREATE VIEW payments AS
SELECT * FROM bookings 
WHERE Payment_Method = 'UPI';

SElECT * FROM Payments

#8. Find the average customer rating per vehicle type:
CREATE VIEW average AS
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM average

#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total as
SELECT SUM(Booking_Value) as total_successful_value
FROM bookings
WHERE Booking_Status = 'Success'

SELECT * FROM total

#10. List all incomplete rides along with the reason:
CREATE VIEW incomplete AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE INcomplete_Rides = 'Yes'

SELECT * FROM incomplete

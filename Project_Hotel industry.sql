use v319_anand;
CREATE TABLE Guests(guest_id INT PRIMARY KEY,first_name VARCHAR(20),last_name VARCHAR(20),mobile_no VARCHAR(15),email VARCHAR(50),
address VARCHAR(250), age int);
CREATE TABLE Room_Types (room_type_id INT PRIMARY KEY,type_name VARCHAR(100),description TEXT);
CREATE TABLE Rooms (room_id INT PRIMARY KEY,room_number VARCHAR(10) UNIQUE, room_type_id INT, room_status VARCHAR(50), price double(10, 2),FOREIGN KEY (room_type_id) REFERENCES Room_Types(room_type_id)
);
CREATE TABLE Bookings (booking_id INT PRIMARY KEY AUTO_INCREMENT,guest_id INT,room_id INT,check_in_date DATE,check_out_date DATE,
booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,status VARCHAR(50), FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
FOREIGN KEY (room_id) REFERENCES Rooms(room_id));
CREATE TABLE Payments (payment_id INT PRIMARY KEY AUTO_INCREMENT,booking_id INT,payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
amount DECIMAL(10, 2), payment_method VARCHAR(50),status VARCHAR(50),FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
CREATE TABLE Employees (employee_id INT PRIMARY KEY AUTO_INCREMENT,first_name VARCHAR(100),last_name VARCHAR(100),
role VARCHAR(100),salary DECIMAL(10, 2),hire_date DATE);
CREATE TABLE Hotel_Services (service_id INT PRIMARY KEY AUTO_INCREMENT,service_name VARCHAR(100),description TEXT,
price DECIMAL(10, 2));
CREATE TABLE Service_Bookings (service_booking_id INT PRIMARY KEY AUTO_INCREMENT,guest_id INT,service_id INT,
booking_datestatus VARCHAR(50),FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
alter table Service_Bookings change column booking_datestatus booking_status varchar(50);
FOREIGN KEY (service_id) REFERENCES Hotel_Services(service_id));
use v319_anand;
INSERT INTO Guests (guest_id, first_name, last_name, mobile_no, email, address, age)
VALUES (101, 'Rohan', 'Kumar', '9876543210', 'Rohan.kumar@example.com', '123 Main St, City, Country', 25),
(102, 'Ajay', 'Singh', '9012345678', 'Ajay.Singh@example.com', '456 Another St, City, Country', 28);
INSERT INTO Guests (guest_id, first_name, last_name, mobile_no, email, address, age)
VALUES (103, 'Shyam', 'Lal', 9123456789, 'Shyam.Lal@example.com', '789 New, City, Country', 29);
INSERT INTO Room_Types (room_type_id, type_name, description)
VALUES 
('001', 'Single', 'A single room with one bed.'),
('002', 'Double', 'Double bed with dual occupancy'),
('003', 'Deluxe', 'Luxury room');
INSERT INTO Rooms (room_id, room_number, room_type_id, room_status, price)
VALUES 
(123, 'R001', 1, 'Single', 2000),
(456, 'R002', 2, 'Double', 3000),
(789, 'R003', 3, 'Deluxe', 4000);
UPDATE Rooms
SET room_status='Available' where room_id=123;
UPDATE Rooms
SET room_status='Occupied' where room_id=456;
UPDATE Rooms
SET room_status='Under maintenance'where room_id=789;
INSERT INTO Bookings (booking_id, guest_id, room_id, check_in_date, check_out_date, status)
VALUES 
    (111, 101, 123, '2025-08-15', '2025-08-18', 'Confirmed'),
    (222, 102, 456, '2025-08-16', '2025-08-19', 'Pending'),
    (333, 103, 789, '2025-08-17', '2025-08-19', 'Confirmed');
Update Guests set email='Rohan.kumar@ibm.com' where guest_id=101;
Update Guests set email='Ajay,Singh@hcl.com' where guest_id=102;
Update Guests set email='Shyam.Lal@tcs.com' where guest_id=103;
INSERT INTO Payments (booking_id, amount, payment_method, status)
VALUES (111,2000,'Credit Card','Paid'),(222,3000,'Debit Card','Paid'),(333,4000,'UPI','Paid');
alter table Employees modify column employee_id varchar(10);
INSERT INTO Employees (employee_id, first_name, last_name, role, salary, hire_date)
VALUES 
    ('E001', 'Radha', 'Kumari', 'Receptionist', 20000, '2020-01-01'),
    ('E002', 'Madan', 'Singh', 'Accountant', 22000, '2020-02-02'),
    ('E003', 'Sita', 'Kumari', 'Manager', 25000, '2020-01-01');
INSERT INTO Hotel_Services (service_id, service_name, description, price)
VALUES 
    (911, 'Laundry', 'Washing_services', 100),
    (912, 'Meal', 'Buffet', 500);
select * from Service_Bookings;
INSERT INTO Service_Bookings (service_booking_id, guest_id, service_id, booking_status)
VALUES 
    (9111, 101, 911, 'Accepted'),
    (9123, 102, 912, 'Rejected'),
    (9124, 103, 912, 'Accepted');
select * from Guests;
select * from Rooms;
select * from Room_Types;
select * from Bookings;
select * from Payments;
select * from Employees;
select * from Hotel_Services;
select * from Service_Bookings;
desc Guests;
desc Rooms;
desc Room_Types;
desc Bookings;
desc Payments;
desc Employees;
desc Hotel_Services;
desc Service_Bookings;
SELECT COUNT(*) AS total_guests FROM Guests;
SELECT COUNT(*) AS occupied_rooms
FROM Rooms r JOIN Bookings b ON r.room_id = b.room_id
WHERE b.check_in_date <= '2025-08-18' AND b.check_out_date >= '2025-08-15' AND r.room_status = 'Occupied';
SELECT * FROM Employees WHERE role = 'Receptionist';

	





-- Question 1
insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Bary Francklin','771 423 8623');

insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Mikaela Swigg','415 574 6848');

insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Dalston Schenfisch','266 673 1572');

insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Donalt Crown','510 940 4208');

insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Tabatha Plaid','206 238 1450');

insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Albertine Broxup','464 111 9563');

insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Shannen Gaskin','431 370 2355');

insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Weber Allebone','646 257 2363');

insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Lanie Arnould','821 589 4787');

insert into Customer (CustomerName, CustomerPhoneNumber)
values ('Dari Witcherley','337 548 5325');

-- Question 2
insert into Appointment
(ServiceName,AppointmentTime,Duration,Price,ServiceProviderId,CustomerId)
values
('Massage','2022-02-01 14:30:00',60,70.00,1,5);

insert into Appointment
(ServiceName,AppointmentTime,Duration,Price,ServiceProviderId,CustomerId)
values
('Facial','2022-02-01 16:30:00',60,100.00,2,8);

insert into Appointment
(ServiceName,AppointmentTime,Duration,Price,ServiceProviderId,CustomerId)
values
('Facial','2022-02-01 10:30:00',30,50.00,1,11);

insert into Appointment
(ServiceName,AppointmentTime,Duration,Price,ServiceProviderId,CustomerId)
values
('Massage','2022-02-01 13:30:00',90,150.00,1,12);

insert into Appointment
(ServiceName,AppointmentTime,Duration,Price,ServiceProviderId,CustomerId)
values
('Facial','2022-02-01 13:30:00',75,150.00,2,14);

-- Question 3
select sum(price) as amount
from Appointment a WHERE ServiceProviderId = 2
and AppointmentTime between '2022-02-01 1:00:00' and '2022-02-01 23:59:00'

-- Question 4
select sum(price) as amount
from Appointment a WHERE ServiceProviderId = 1
and AppointmentTime between '2022-02-01 1:00:00' and '2022-02-01 23:59:00'


-- Question 5
select sum(price) as amount
from Appointment a WHERE ServiceProviderId = 2
and AppointmentTime between '2022-02-01 1:00:00' and '2022-02-01 23:59:00'
and ServiceName = 'Facial'

-- Question 6
select sum(price) as amount
from Appointment a WHERE ServiceProviderId = 1
and AppointmentTime between '2022-02-01 1:00:00' and '2022-02-01 23:59:00'
and ServiceName = 'Massage'

-- Question 7
SELECT Customer.CustomerName
from Customer
inner join Appointment
on Customer.CustomerId =  Appointment.CustomerId
ORDER BY CustomerName ASC;

-- Question 8
-- Orders Table 
(
    OrderId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
);
-- OrdersDetails
CREATE TABLE OrdersDetails
 (
    ServiceName varchar(150),
    ServiceTime DATETIME,
    Duration INT,
    CompanyId INT,
    OrderId INT,
    FOREIGN KEY (OrderId) REFERENCES Company(OrderId),
    FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId)
);

-- Question 9
/*
To best answer this question I would look at the appointment table, 
but this wouldn't fully answer the question because all types of sevices might not be in this table. 
This method would also be long becuase I would have to look at the different cost, duration, and type of services by hand.
*/

-- Question 10
CREATE TABLE Service
 (
    ServiceId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ServiceName varchar(150),
    Cost decimal(6,2),
    Duration INT,
    CompanyId INT,
    FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId)
);

-- Question 11
CREATE TABLE Appointment
 (
    AppointmentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    AppointmentTime DATETIME,
    ServiceProviderId INT,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (ServiceProviderId) REFERENCES ServiceProvider(ServiceProviderId)    
);

-- Question 12
CREATE TABLE Appointment
 (
    AppointmentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    AppointmentTime DATETIME,
    ServiceProviderId INT,
    CustomerId INT,
    ServiceId INT,
    FOREIGN KEY (ServiceId) REFERENCES Service(ServiceId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (ServiceProviderId) REFERENCES ServiceProvider(ServiceProviderId)    
);

-- Question 13
insert into Service
(ServiceName, Cost, Duration, CompanyId)
values
('Massage',70.00,60,1);

insert into Service
(ServiceName, Cost, Duration, CompanyId)
values
('Facial',100.00,60,2);

insert into Service
(ServiceName, Cost, Duration, CompanyId)
values
('Facial',50.00,30,1);

insert into Service
(ServiceName, Cost, Duration, CompanyId)
values
('Massage',150.00,90,1);

insert into Service
(ServiceName, Cost, Duration, CompanyId)
values
('Massage',70.00,75,2);

-- Question 14
insert into Appointment
(AppointmentTime,ServiceProviderId,CustomerId,ServiceId)
values
('2022-02-01 14:30:00',1,5,1);

insert into Appointment
(AppointmentTime,ServiceProviderId,CustomerId,ServiceId)
values
('2022-02-01 16:30:00',2,8,2);

insert into Appointment
(AppointmentTime,ServiceProviderId,CustomerId,ServiceId)
values
('2022-02-01 10:30:00',1,11,3);

insert into Appointment
(AppointmentTime,ServiceProviderId,CustomerId,ServiceId)
values
('Massage','2022-02-01 13:30:00',1,12,4);

insert into Appointment
(AppointmentTime,ServiceProviderId,CustomerId,ServiceId)
values
('Facial','2022-02-01 13:30:00',2,14,5);
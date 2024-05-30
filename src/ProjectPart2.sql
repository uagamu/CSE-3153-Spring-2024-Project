CREATE TABLE VacuumModel
(
Model_Name varchar(250),
Model_Code int,
Color varchar(50),
Price float,
PRIMARY KEY (Model_Name)
);

CREATE TABLE Vacuum
(
Serial_Number int,
Date_of_Manufacture date,
Model_Name varchar(250),
PRIMARY KEY (Serial_Number),
FOREIGN KEY (Model_Name) REFERENCES VacuumModel(Model_Name),
);

CREATE TABLE Designer
(
Designer_Name varchar(250),
Email varchar(250),
Phone_Number int,
Street_Number int,
Street_Name varchar(250),
Resident_State varchar(50),
City varchar(50),
Zip_Code int,
PRIMARY KEY (Designer_Name)
);

CREATE TABLE VacuumDesign
(
Model_Name varchar(250),
Designer_Name varchar(250),
FOREIGN KEY (Model_Name) REFERENCES VacuumModel(Model_Name),
FOREIGN KEY (Designer_Name) REFERENCES Designer(Designer_Name),
);

CREATE TABLE Technician
(
Employee_ID int,
First_Name varchar(250),
Last_Name varchar(250),
Age int,
Date_Employed date,
Contact_Number1 int,
Contact_Number2 int,
Street_Number int,
Street_Name varchar(250),
Resident_State varchar(50),
City varchar(50),
Zip_Code int,
PRIMARY KEY(Employee_ID),
);
ALTER TABLE Technician
ADD Supervisor_ID int NULL,
FOREIGN KEY (Supervisor_ID) REFERENCES Technician(Employee_ID);

CREATE TABLE Supervisor
(
Supervisor_ID int,
Supervisor_Role varchar(250),
PRIMARY KEY (Supervisor_ID),
FOREIGN KEY (Supervisor_ID) REFERENCES Technician(Employee_ID),
)

CREATE TABLE Inspection
(
Serial_Number int,
Employee_ID int,
Quality_Status varchar(20),
Date_of_Inspection date,
FOREIGN KEY (Serial_Number) REFERENCES Vacuum(Serial_Number),
FOREIGN KEY (Employee_ID) REFERENCES Technician(Employee_ID),
);

INSERT INTO VacuumModel (Model_Name, Model_Code, Color, Price)
VALUES
    ('PowerVac 2000', 1001, 'Blue', 149.99),
    ('TurboSweep X5', 1002, 'Red', 189.99),
    ('MaxClean Pro', 1003, 'Silver', 219.99),
    ('EcoSweep Lite', 1004, 'Green', 99.99),
    ('EliteForce 3000', 1005, 'Black', 279.99),
    ('SmartVac 500', 1006, 'White', 199.99),
    ('SwiftClean 150', 1007, 'Yellow', 129.99),
    ('UltraVac Ultra', 1008, 'Purple', 239.99),
    ('PowerSuction Pro', 1009, 'Orange', 179.99),
    ('CompactClean Mini', 1010, 'Pink', 79.99);

INSERT INTO Vacuum (Serial_Number, Date_of_Manufacture, Model_Name)
VALUES
    (101, '2020-05-15', 'PowerVac 2000'),
    (102, '2005-06-20', 'TurboSweep X5'),
    (103, '2004-07-10', 'MaxClean Pro'),
    (104, '2008-08-05', 'EcoSweep Lite'),
    (105, '2012-09-18', 'EliteForce 3000'),
    (106, '2016-10-25', 'SmartVac 500'),
    (107, '2019-11-12', 'SwiftClean 150'),
    (108, '2003-12-30', 'UltraVac Ultra'),
    (109, '2022-01-08', 'PowerSuction Pro'),
    (110, '2024-02-20', 'CompactClean Mini');

INSERT INTO Designer (Designer_Name, Email, Phone_Number, Street_Number, Street_Name, Resident_State, City, Zip_Code)
VALUES
    ('John Smith', 'john.smith@example.com', 1234567890, 101, 'Oak Street', 'California', 'Los Angeles', 90001),
    ('Alice Johnson', 'alice.johnson@example.com', 1876543210, 202, 'Maple Avenue', 'New York', 'New York City', 10001),
    ('Mike Anderson', 'mike.anderson@example.com', 1112223333, 303, 'Pine Road', 'Texas', 'Houston', 77002),
    ('Sarah Williams', 'sarah.williams@example.com', 1445556666, 404, 'Cedar Lane', 'Florida', 'Miami', 33101),
    ('David Lee', 'david.lee@example.com', 1778889999, 505, 'Elm Boulevard', 'Illinois', 'Chicago', 60601),
    ('Emily Brown', 'emily.brown@example.com', 1223334444, 606, 'Birch Street', 'Washington', 'Seattle', 98101),
    ('Chris Taylor', 'chris.taylor@example.com', 1556667777, 707, 'Spruce Avenue', 'Massachusetts', 'Boston', 02101),
    ('Jessica Martinez', 'jessica.martinez@example.com', 1889990000, 808, 'Fir Lane', 'Colorado', 'Denver', 80201),
    ('Mark Wilson', 'mark.wilson@example.com', 1334445555, 909, 'Cypress Road', 'Arizona', 'Phoenix', 85001),
    ('Sophia Garcia', 'sophia.garcia@example.com', 1990001111, 1010, 'Willow Drive', 'Nevada', 'Las Vegas', 89101);

INSERT INTO VacuumDesign (Model_Name, Designer_Name)
VALUES
    ('PowerVac 2000', 'John Smith'),
    ('TurboSweep X5', 'Alice Johnson'),
    ('MaxClean Pro', 'Mike Anderson'),
    ('EcoSweep Lite', 'Sarah Williams'),
    ('EliteForce 3000', 'David Lee'),
    ('SmartVac 500', 'Emily Brown'),
    ('SwiftClean 150', 'Chris Taylor'),
    ('UltraVac Ultra', 'Jessica Martinez'),
    ('PowerSuction Pro', 'Mark Wilson'),
    ('CompactClean Mini', 'Sophia Garcia');

INSERT INTO Technician (Employee_ID, First_Name, Last_Name, Age, Date_Employed, Contact_Number1, Contact_Number2, Street_Number, Street_Name, Resident_State, City, Zip_Code, Supervisor_ID)
VALUES
    (1001, 'John', 'Smith', 30, '2022-01-15', 1234567890, 1876543210, 101, 'Oak Street', 'California', 'Los Angeles', 90001, NULL),
    (1002, 'Alice', 'Johnson', 28, '2022-02-20', 1112223333, 1445556666, 202, 'Maple Avenue', 'New York', 'New York City', 10001, 1007),
    (1003, 'Mike', 'Anderson', 35, '2021-12-10', 1556667777, 1889990000, 303, 'Pine Road', 'Texas', 'Houston', 77002, 1001),
    (1004, 'Sarah', 'Williams', 32, '2022-03-05', 1223334444, 1334445555, 404, 'Cedar Lane', 'Florida', 'Miami', 33101, 1003),
    (1005, 'David', 'Lee', 33, '2022-04-18', 1778889999, 1990001111, 505, 'Elm Boulevard', 'Illinois', 'Chicago', 60601, 1001),
    (1006, 'Emily', 'Brown', 29, '2022-05-25', 1889990000, 1112223333, 606, 'Birch Street', 'Washington', 'Seattle', 98101, 1005),
    (1007, 'Chris', 'Taylor', 34, '2022-06-12', 1556667777, 1223334444, 707, 'Spruce Avenue', 'Massachusetts', 'Boston', 02101, 1001),
    (1008, 'Jessica', 'Martinez', 31, '2022-07-30', 1990001111, 1445556666, 808, 'Fir Lane', 'Colorado', 'Denver', 80201, 1003),
    (1009, 'Mark', 'Wilson', 36, '2022-08-08', 1334445555, 1778889999, 909, 'Cypress Road', 'Arizona', 'Phoenix', 85001, 1005),
    (1010, 'Sophia', 'Garcia', 27, '2022-09-20', 1223334444, 1556667777, 1010, 'Willow Drive', 'Nevada', 'Las Vegas', 89101, 1007);

INSERT INTO Supervisor (Supervisor_ID, Supervisor_Role)
VALUES
    (1001, 'Team Lead'),
    (1003, 'Quality Control Supervisor'),
    (1005, 'Senior Technician'),
    (1007, 'Quality Assurance Manager');

INSERT INTO Inspection (Serial_Number, Employee_ID, Quality_Status, Date_of_Inspection)
VALUES
    (101, 1001, 'Pass', '2022-06-10'),
    (102, 1002, 'Fail', '2024-06-02'),
    (103, 1003, 'Pass', '2024-09-17'),
    (104, 1004, 'Pass', '2022-10-25'),
    (105, 1005, 'Fail', '2023-11-18'),
    (106, 1001, 'Pass', '2022-12-28'),
    (107, 1007, 'Pass', '2023-12-22'),
    (108, 1008, 'In Progress', '2024-03-30'),
    (109, 1009, 'Pass', '2022-09-08'),
    (110, 1001, 'In Progress', '2024-02-20');

SELECT * FROM Vacuum;

SELECT * FROM VacuumModel;

SELECT * FROM Designer;

SELECT * FROM VacuumDesign;

SELECT * FROM Technician;

SELECT * FROM Supervisor;

SELECT * FROM Inspection;

SELECT VacuumModel.Model_Code, VacuumModel.Model_Name, VacuumModel.Price
FROM VacuumModel;

SELECT Vacuum.Model_Name, Vacuum.Date_of_Manufacture 
FROM Vacuum
WHERE Date_of_Manufacture > '2010-12-31';

SELECT TOP 1 Technician.First_Name, Technician.Last_Name,COUNT(*) AS Total_Inspections 
FROM Technician
JOIN Inspection ON Technician.Employee_ID = Inspection.Employee_ID
GROUP BY Technician.First_Name, Technician.Last_Name
ORDER BY Total_Inspections DESC;

SELECT Vacuum.Model_Name AS Failed_Vacuums, Inspection.Date_of_Inspection AS Verification_Date, Technician.Employee_ID AS Technician_ID
FROM Inspection
JOIN Vacuum ON Vacuum.Serial_Number = Inspection.Serial_Number
JOIN Technician ON Technician.Employee_ID = Inspection.Employee_ID
WHERE Inspection.Quality_Status = 'Fail';

SELECT Vacuum.Serial_Number,VacuumDesign.Designer_Name, CONCAT (Technician.First_Name, ' ', Technician.Last_Name) AS Technician_Name
FROM Vacuum
JOIN VacuumDesign ON VacuumDesign.Model_Name = Vacuum.Model_Name
JOIN Designer ON VacuumDesign.Designer_Name = Designer.Designer_Name
JOIN Inspection ON Vacuum.Serial_Number = Inspection.Serial_Number
JOIN Technician ON Inspection.Employee_ID = Technician.Employee_ID;
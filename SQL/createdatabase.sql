-- CREATE DATABASE GymAnalytics;
USE GymAnalytics;
-- CREATE TABLE MembershipsPlans(
-- MembershipID INT PRIMARY KEY,
-- MembershipType VARCHAR(50),
-- DurationMonths INT,
-- Price DECIMAL(10,2)
-- );
-- DROP TABLE membershipsPlans;
-- CREATE TABLE MembershipPlans (
--     MembershipID INT PRIMARY KEY,
--     PlanName VARCHAR(50),
--     DurationMonths INT,
--     MonthlyFee DECIMAL(10,2),
--     JoiningFee DECIMAL(10,2),
--     RenewalFee DECIMAL(10,2),
--     PersonaltrainerIncluded VARCHAR(10)
-- );
-- SELECT *FROM membershipplans;
-- LOAD DATA LOCAL INFILE 'C:/Users/Rahul Yadav/OneDrive/Desktop/code/members.csv'
-- INTO TABLE Members
-- CHARACTER SET utf8mb4
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\r\n'
-- IGNORE 1 ROWS
-- (@MemberID,@FullName,@Gender,@DateOfBirth,@Age,@Phone,@Email,@City,@JoinDate,@MembershipID,@TrainerID,@FitnessGoal,@Occupation,@Status)
-- SET
-- MemberID=@MemberID,
-- FullName=@FullName,
-- Gender=@Gender,
-- DateOfBirth=STR_TO_DATE(@DateOfBirth,'%d-%b-%y'),
-- Age=@Age,
-- Phone=@Phone,
-- Email=@Email,
-- City=@City,
-- JoinDate=STR_TO_DATE(@JoinDate,'%d-%b-%y'),
-- MembershipID=@MembershipID,
-- TrainerID=@TrainerID,
-- FitnessGoal=@FitnessGoal,
-- Occupation=@Occupation,
-- Status=@Status;
-- SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'C:/Users/Rahul Yadav/OneDrive/Desktop/code/members.csv'
INTO TABLE Members
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@MemberID,@FullName,@Gender,@DateOfBirth,@Age,@Phone,@Email,@City,@JoinDate,@MembershipID,@TrainerID,@FitnessGoal,@Occupation,@Status)
SET
MemberID=@MemberID,
FullName=@FullName,
Gender=@Gender,
DateOfBirth=STR_TO_DATE(@DateOfBirth,'%d-%b-%y'),
Age=@Age,
Phone=@Phone,
Email=@Email,
City=@City,
JoinDate=STR_TO_DATE(@JoinDate,'%d-%b-%y'),
MembershipID=@MembershipID,
TrainerID=@TrainerID,
FitnessGoal=@FitnessGoal,
Occupation=@Occupation,
Status=@Status;
-- all queriess--
USE gymanalytics;
-- SELECT COUNT(*) AS TotalMemers
-- FROM Members;

-- how many members are active or inactive
-- SELECT 
-- 	Status,
-- 	COUNT(*) AS TotalMembers
-- FROM Members
-- GROUP BY Status;

-- find total revneue--
-- SELECT  SUM(FinalAmount) AS TotalRevenue
-- FROM Payments;

-- which membershipplan generates the highest revenue?
-- SELECT
--     mp.PlanName,
--     COUNT(p.PaymentID) AS TotalPayments,
--     SUM(p.FinalAmount) AS TotalRevenue
-- FROM Payments p
-- JOIN MembershipPlans mp
--     ON p.MembershipID = mp.MembershipID
-- GROUP BY mp.PlanName
-- ORDER BY TotalRevenue DESC;

-- which trainers has the highest number of memebers?
-- SELECT 
-- 	t.TrainerName,
--     COUNT(m.MemberID) AS TotalMembers
--     FROM Members m
--     JOIN Trainers t
-- 		ON m.TrainerID=t.TrainerID
-- GROUP BY t.TrainerName
-- ORDER BY TotalMembers DESC;

-- Which trainers are handling more than 50 members?

-- SELECT 
-- 	t.TrainerName,
--     COUNT(m.MemberID) AS TotalMembers
-- FROM  Trainers t
-- JOIN Members m
-- ON t.TrainerID=m.TrainerID
-- GROUP BY t.TrainerName
-- HAVING COUNT(m.MemberID)>50
-- ORDER BY TotalMembers DESC;  

-- show all active members?
-- SELECT FullName
-- FROM Members
-- where Status="Active";


-- Show All Female Members?
-- SELECT FullName
-- FROM Members
-- WHERE Gender='Female'


-- Show all members who joined after 1 January 2025
-- SELECT FullName, JoinDate
-- FROM Members
-- WHERE JoinDate > '2025-01-01';


-- Show All active female members?
-- SELECT FullName, Status
-- FROM Members
-- WHERE Status='Active'
-- AND Gender='Female';

-- case Example
-- SELECT
--     FullName,
--     Age,
--     CASE
--         WHEN Age < 25 THEN 'Young'
--         WHEN Age BETWEEN 25 AND 35 THEN 'Adult'
--         ELSE 'Senior'
--     END AS AgeCategory
-- FROM Members;
 
 -- case 2nd example
--  SELECT
--     PaymentID,
--     FinalAmount,
--     CASE
--         WHEN FinalAmount >= 3000 THEN 'Premium'
--         ELSE 'Standard'
--     END AS PaymentStatus
-- FROM Payments;

-- find average salary of all trainers?
-- SELECT AVG(Salary) AS AverageSalary
-- FROM Trainers;


-- find Highest Salary among trainers?
-- SELECT 
-- 	MAX(Salary)
-- FROM Trainers

-- SELECT TrainerName, Salary
-- FROM Trainers
-- WHERE Salary = (
--     SELECT MAX(Salary)
--     FROM Trainers
-- );


-- Find the averge BMI of all Members
-- SELECT AVG(BMI)
-- FROM Bodymeasurements;


-- Which fitness goal has the highest number of members?

-- SELECT 
-- 		FitnessGoal,
--         COUNT(MemberID) AS TotalMembers
-- FROM Members
-- GROUP BY FitnessGoal
-- ORDER BY TotalMembers DESC;        

-- Find the average payment received for each membership plan.?

-- SELECT mb.PlanName,
-- 	  --  COUNT(p.MemberID) AS TotalMembers,
--        AVG(p.FinalAmount) AS AveragePayment
-- FROM Payments p
-- JOIN Membershipplans mb
-- ON p.MembershipID= mb.MembershipID
-- GROUP BY PlanName
-- ORDER BY AveragePayment   DESC;    

-- Which city has the highest number of active members?
-- SELECT City, COUNT(MemberID) AS TotalMembers
-- FROM Members
-- WHERE Status='Active'
-- GROUP BY City
-- ORDER BY TotalMembers DESC;

-- SHOW each member along with their trainer's name?
-- SELECT 
-- 		m.FullName,
-- 	   t.TrainerName
-- FROM Members m
-- INNER JOIN Trainers t
-- ON m.TrainerID=t.TrainerID;       


-- Show all trainers, including those who have no members.?
-- SELECT
--     t.TrainerName,
--     m.FullName
-- FROM Trainers t
-- LEFT JOIN Members m
-- ON t.TrainerID = m.TrainerID;

-- Module 6 -- Subqueries   

-- SELECT TrainerName, Salary
-- FROM Trainers
-- WHERE Salary = (
--     SELECT MAX(Salary)
--     FROM Trainers
-- );

-- Find members whose BMI is greater than the average BMI.?

-- SELECT MemberID
-- FROM Bodymeasurements
-- WHERE BMI>(

-- SELECT AVG(BMI)
-- FROM Bodymeasurements
--  )

-- Find members who have either a Gold or Premium membership.?
-- SELECT 
-- 	FUllName,
--     MembershipID
-- FROM Members
-- WHERE MembershipID IN (
-- 	SELECT MembershipID
--     FROM MembershipPlans
--     Where PlanName IN ('Gold','Premium')
-- 	);  


-- Find all members who are assigned to trainers whose specialization is "Strength Training".?

-- SELECT 
-- 	FullName,
--     TrainerID
-- FROM Members 
-- WHERE  TrainerID IN(
-- 	SELECT TrainerID
--     FROM Trainers
--     WHERE Specialization='Strength Training'
--     
-- );


-- Show trainers who have at least one member assigned.?
-- SELECT  TrainerName
-- FROM Trainers t
-- WHERE EXISTS(
-- SELECT*
-- FROM Members m
-- WHERE m.TrainerID=t.TrainerID
-- )


-- Show all membership plans that have never been purchased by any member.?
SELECT 
	PlanName,
    MembershipId
    FROM MembershipPlans mp
Where NOT EXISTS(
SELECT * 
FROM Members m
WHERE mp.MembershipID=m.MembershipID
)    















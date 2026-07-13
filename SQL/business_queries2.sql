-- Window Functions
-- Function	Purpose	Interview Importance
-- ROW_NUMBER()	Gives a unique row number	⭐⭐⭐⭐⭐
-- RANK()	Gives a rank (ties share the same rank, gaps appear)	⭐⭐⭐⭐⭐
-- DENSE_RANK()	Gives a rank (ties share the same rank, no gaps)	⭐⭐⭐⭐⭐
-- LAG()	Previous row value	⭐⭐⭐⭐☆
-- LEAD()	Next row value

-- Give every trainer a rank based on salary (highest salary first).?
-- SELECT 
-- 	TrainerName,
--     Salary,
--     ROW_NUMBER() OVER(ORDER BY Salary DESC) AS Rowcolumn
-- FROM Trainers;    

-- SELECT
-- 		MemberID,
--         BMI,
--         ROW_NUMBER() OVER(ORDER BY BMI DESC) AS Rankcolumn
-- FROM BodyMeasurements;  
-- SELECT
-- 		MemberID,
--         BMI,
--         RANK() OVER(ORDER BY BMI DESC) AS Rankcolumn
-- FROM BodyMeasurements;  
--       
      
 --  SELECT
-- 		MemberID,
--         BMI,
--         DENSE_RANK() OVER(ORDER BY BMI DESC) AS Rankcolumn
-- FROM BodyMeasurements;  
--           
 -- Rank members by BMI within each city. ?
-- SELECT
--     m.MemberID,
--     m.City,
--     b.BMI,
--     RANK() OVER(
--         PARTITION BY m.City
--         ORDER BY b.BMI DESC
--     ) AS CityRank
-- FROM Members m
-- JOIN BodyMeasurements b
-- ON m.MemberID = b.MemberID;
--       
--       
--       
-- SELECT
--     PaymentID,
--     PaymentDate,
--     FinalAmount,
--     LAG(FinalAmount) OVER(
--         ORDER BY PaymentDate
--     ) AS PreviousPayment
-- FROM Payments;
--       
--       
   --    
--       SELECT
--     PaymentID,
--     PaymentDate,
--     FinalAmount,
--     LEAD(FinalAmount) OVER(
--         ORDER BY PaymentDate
--     ) AS NextPayment
-- FROM Payments;
    
    -- Common Table Expressions
    
--     WITH CityRanking AS
-- (
--     SELECT
--         m.MemberID,
--         m.City,
--         b.BMI,
--         RANK() OVER(
--             PARTITION BY m.City
--             ORDER BY b.BMI DESC
--         ) AS CityRank
--     FROM Members m
--     JOIN BodyMeasurements b
--     ON m.MemberID = b.MemberID
-- )

-- SELECT *
-- FROM CityRanking
-- WHERE CityRank = 1;
--     
--     
    
   --  Show the top 3 members (highest BMI) from each city.?
-- WITH CityRanking AS (
--     SELECT
--         m.MemberID,
--         m.City,
--         b.BMI,
--         RANK() OVER(
--             PARTITION BY m.City
--             ORDER BY b.BMI DESC
--         ) AS BMIRank
--     FROM Members m
--     JOIN BodyMeasurements b
--         ON m.MemberID = b.MemberID
-- )

-- SELECT *
-- FROM CityRanking
-- WHERE BMIRank <= 3;
--     
    
-- Show the highest-paid trainer from each specialization.?
-- WITH HighestPaid AS(
-- SELECT TrainerName,
-- 		Specialization,
--         Salary,
--         RANK() OVER( PARTITION BY Specialization
--         ORDER BY Salary DESC) AS Hipiadtrainer
--         FROM Trainers
-- )    
--  SELECT * 
--  FROM HighestPaid
--  WHERE  Hipiadtrainer=1
--  
--     
-- Show the latest payment made by each member.?
    
   --  WITH LatestPayments AS(
--     SELECT 
-- 		MemberID,
--         PaymentDate,
--         FinalAmount,
--         ROW_NUMBER() OVER(PARTITION BY MemberID
-- 						ORDER BY PaymentDate DESC) AS LATEST
-- 	FROM Payments
--     )
--     
--     SELECT *
--     FROM LatestPayments
--     WHERE LATEST=1
    
    
USE Gymanalytics;
-- CREATE VIEW MemberDetails AS
-- SELECT
--     m.FullName,
--     m.City,
--     b.BMI,
--     t.TrainerName
-- FROM Members m
-- JOIN BodyMeasurements b
-- ON m.MemberID = b.MemberID
-- JOIN Trainers t
-- ON m.TrainerID = t.TrainerID;
    
--  SELECT * 
--  FROM MemberDetails;
--     
--  CREATE VIEW FemaleMembers  AS
--  SELECT 
-- 		MemberID,
-- 		FullName,
--         City,
--         Gender
-- FROM Members   
-- WhERE Gender='Female'  ; 
--     
-- SELECT  *
-- FROM FemaleMembers;   
-- --     
-- CREATE OR REPLACE VIEW FemaleMembers AS
-- SELECT
--     MemberID,
--     FullName,
--     City,
--     Phone
-- FROM Members
-- WHERE Gender='Female';
    
-- CREATE VIEW TrainerSalry  AS
-- SELECT 
-- 		TrainerID,
--         TrainerName,
--         Specialization,
--         Salary
-- FROM Trainers;

-- SELECT *
-- FROM TrainerSalry
-- WHERE salary>50000
--         

-- SELECT
--     FullName,
--     UPPER(FullName) AS UpperName
-- FROM Members;


-- SELECT
--     FullName,
--     LENGTH(FullName) AS NameLength
-- FROM Members;

-- Show the member name along with their city in one column.?
-- SELECT 
-- CONCAT(FUllName,'-',city) AS MemberInfo
-- FROM Members;

-- SELECT
--     FullName,
--    --  SUBSTRING(FullName,1,5) AS FirstFive
--    LEFT(FullName,3)
-- FROM Members;    
--     
 --  SELECT
--     MemberID,
--     JoinDate,
--     YEAR(JoinDate) AS JoinYear
-- FROM Members;  
--     

-- How many days ago did each member join?
-- SELECT 
-- 	FUllName,
--     DATEDIFF(CURDATE(), JoinDate) AS DaysSinceJoining
-- FROM Members    ;


-- SELECT  *
-- FROM Members
-- WHERE YEAR(JoinDate)=2025

-- Numeric Functions


-- SELECT ROUND(AVG(BMI),2)
-- FROM BodyMeasurements;

-- CREATE TRIGGER TriggerName
-- AFTER INSERT
-- ON Members
-- FOR EACH ROW
-- BEGIN

-- 		INSERT INTO MemberLogs(MemberID, Action)
-- 		VALUES(NEW.MemberID,'New Member Added');

-- END;





      
        
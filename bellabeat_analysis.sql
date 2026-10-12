CREATE DATABASE bellabeat_analysis;
USE bellabeat_analysis;
##=====================================================##
##------------ DATA CLEANING & VALIDATION -------------##
##=====================================================##

##__________3.1 Record Count Check__________##
SELECT COUNT(*) FROM dailyactivity_merged;
SELECT COUNT(*) FROM sleepday_merged;
SELECT COUNT(*) FROM hourlysteps_merged;
SELECT COUNT(*) FROM heartrate_seconds_merged;

##__________3.2 Duplicate Detection__________##
##             Daily Activity
SELECT Id,
       ActivityDate,
       COUNT(*) AS DuplicateCount
FROM dailyactivity_merged
GROUP BY Id, ActivityDate
HAVING COUNT(*) > 1;

##             Sleep Data
SELECT Id,
       SleepDay,
       COUNT(*) AS DuplicateCount
FROM sleepday_merged
GROUP BY Id, SleepDay
HAVING COUNT(*) > 1;

##__________3.3 Missing Value Analysis__________##
SELECT
SUM(CASE WHEN TotalSteps IS NULL THEN 1 ELSE 0 END) AS MissingSteps,
SUM(CASE WHEN Calories IS NULL THEN 1 ELSE 0 END) AS MissingCalories
FROM dailyactivity_merged;

##__________3.4 Data Consistency Checks__________##
SELECT *
FROM dailyactivity_merged
WHERE TotalSteps < 0
OR Calories < 0;

##=====================================================##
##---------- EXPLORATORY DATA ANALYSIS (EDA) ----------##
##=====================================================##

##__________Analysis 1: Total Users__________##
##Business Question - How many unique users are represented?
SELECT COUNT(DISTINCT Id) AS TotalUsers
FROM dailyactivity_merged;

##__________Analysis 2: Total Records__________##
SELECT COUNT(*) AS TotalRecords
FROM dailyactivity_merged;

##__________Analysis 3: Average Daily Steps__________##
SELECT ROUND(AVG(TotalSteps),0) AS AvgDailySteps
FROM dailyactivity_merged;

##__________Analysis 4: Highest and Lowest Steps__________##
SELECT
MAX(TotalSteps) AS HighestSteps,
MIN(TotalSteps) AS LowestSteps
FROM dailyactivity_merged;

##__________Analysis 5: Average Distance Covered__________##
SELECT ROUND(AVG(TotalDistance),2) AS AvgDistance
FROM dailyactivity_merged;

##__________Analysis 6: Average Calories Burned__________##
SELECT ROUND(AVG(Calories),0) AS AvgCalories
FROM dailyactivity_merged;

##__________Analysis 7: Top Active Users__________##
SELECT Id,
       AVG(TotalSteps) AS AvgSteps
FROM dailyactivity_merged
GROUP BY Id
ORDER BY AvgSteps DESC
LIMIT 10;

##__________Analysis 8: Least Active Users__________##
SELECT Id,
       AVG(TotalSteps) AS AvgSteps
FROM dailyactivity_merged
GROUP BY Id
ORDER BY AvgSteps ASC
LIMIT 10;

##__________Analysis 9: Average Sleep Hours__________##
SELECT ROUND(AVG(TotalMinutesAsleep)/60,2) AS AvgSleepHours
FROM sleepday_merged;

##__________Analysis 10: Highest & Lowest Sleep Duration__________##
SELECT
ROUND(MAX(TotalMinutesAsleep)/60,2) AS MaxSleepHours,
ROUND(MIN(TotalMinutesAsleep)/60,2) AS MinSleepHours
FROM sleepday_merged;

##__________Analysis 11: Average Active Minutes__________##
SELECT ROUND(
AVG(
VeryActiveMinutes +
FairlyActiveMinutes +
LightlyActiveMinutes
),0) AS AvgActiveMinutes
FROM dailyactivity_merged;

##__________Analysis 12: Average Sedentary Minutes__________##
SELECT ROUND(AVG(SedentaryMinutes),0) AS AvgSedentaryMinutes
FROM dailyactivity_merged;

##=====================================================##
##------------ ADVANCED BUSINESS ANALYSIS -------------##
##=====================================================##

##__________User Activity Segmentation__________##
SELECT
CASE
WHEN TotalSteps < 5000 THEN 'Inactive'
WHEN TotalSteps BETWEEN 5000 AND 9999 THEN 'Moderately Active'
ELSE 'Highly Active'
END AS ActivityCategory,
COUNT(*) AS UserCount
FROM dailyactivity_merged
GROUP BY ActivityCategory;

##__________Sleep vs Steps Analysis__________##
SELECT
ROUND(AVG(d.TotalSteps),0) AS AvgSteps,
ROUND(AVG(s.TotalMinutesAsleep)/60,2) AS AvgSleepHours
FROM dailyactivity_merged d
JOIN sleepday_merged s
ON d.Id = s.Id;

##__________Steps vs Calories__________##
SELECT
ROUND(AVG(TotalSteps),0) AS AvgSteps,
ROUND(AVG(Calories),0) AS AvgCalories
FROM dailyactivity_merged;

##__________Active Minutes vs Calories__________##
SELECT
ROUND(
AVG(
VeryActiveMinutes +
FairlyActiveMinutes +
LightlyActiveMinutes
),0) AS ActiveMinutes,
ROUND(AVG(Calories),0) AS AvgCalories
FROM dailyactivity_merged;

##__________Sleep vs Calories__________##
SELECT
ROUND(AVG(s.TotalMinutesAsleep)/60,2) AS SleepHours,
ROUND(AVG(d.Calories),0) AS AvgCalories
FROM sleepday_merged s
JOIN dailyactivity_merged d
ON s.Id=d.Id;

##__________Most Engaged Users__________##
SELECT
Id,
COUNT(*) AS TrackingDays
FROM dailyactivity_merged
GROUP BY Id
ORDER BY TrackingDays DESC;

##__________Least Engaged Users__________##
SELECT
Id,
COUNT(*) AS TrackingDays
FROM dailyactivity_merged
GROUP BY Id
ORDER BY TrackingDays ASC;

##=====================================================##
##----------------- TIME-BASED ANALYSIS ---------------##
##=====================================================##

##__________Peak Activity Hours__________##
SELECT
HOUR(ActivityHour) AS HourOfDay,
SUM(StepTotal) AS TotalSteps
FROM hourlysteps_merged
GROUP BY HourOfDay
ORDER BY TotalSteps DESC;

##__________Peak Calorie Burn Hours__________##
SELECT
HOUR(ActivityHour) AS HourOfDay,
SUM(Calories) AS TotalCalories
FROM hourlycalories_merged
GROUP BY HourOfDay
ORDER BY TotalCalories DESC;

##__________Hourly Activity Trends__________##
SELECT
HOUR(ActivityHour) AS HourOfDay,
AVG(StepTotal) AS AvgSteps
FROM hourlysteps_merged
GROUP BY HourOfDay
ORDER BY HourOfDay;

##__________Hourly Intensity Trends__________##
SELECT
HOUR(ActivityHour) AS HourOfDay,
AVG(TotalIntensity) AS AvgIntensity
FROM hourlyintensities_merged
GROUP BY HourOfDay
ORDER BY HourOfDay;

##=====================================================##
##------------ FITNESS BEHAVIOR ANALYSIS --------------##
##=====================================================##

##__________User Lifestyle Classification__________##
##Business Question - How can Bellabeat users be categorized based on daily activity levels?
SELECT
    CASE
        WHEN AVG(TotalSteps) < 5000 THEN 'Sedentary'
        WHEN AVG(TotalSteps) BETWEEN 5000 AND 9999 THEN 'Moderately Active'
        ELSE 'Active'
    END AS Lifestyle_Category,
    COUNT(*) AS User_Count
FROM (
    SELECT Id,
           AVG(TotalSteps) AS Avg_Steps
    FROM dailyactivity_merged
    GROUP BY Id
) A
GROUP BY Lifestyle_Category;

##__________Active vs Sedentary User Analysis__________##
SELECT
ROUND(AVG(
VeryActiveMinutes +
FairlyActiveMinutes +
LightlyActiveMinutes
),0) AS Avg_Active_Minutes,

ROUND(AVG(SedentaryMinutes),0) AS Avg_Sedentary_Minutes
FROM dailyactivity_merged;

##__________Health Pattern Identification__________##
##Business Question - Do users with better sleep show higher activity levels?
SELECT
CASE
WHEN s.TotalMinutesAsleep < 360 THEN 'Low Sleep'
WHEN s.TotalMinutesAsleep BETWEEN 360 AND 480 THEN 'Normal Sleep'
ELSE 'High Sleep'
END AS Sleep_Category,

ROUND(AVG(d.TotalSteps),0) AS Avg_Steps

FROM sleepday_merged s
JOIN dailyactivity_merged d
ON s.Id = d.Id

GROUP BY Sleep_Category;

##__________Heart Rate Analysis__________##

##--Average Heart Rate
SELECT
ROUND(AVG(Value),2) AS Avg_Heart_Rate
FROM heartrate_seconds_merged;

##--Top Users by Heart Rate
SELECT
Id,
ROUND(AVG(Value),2) AS Avg_Heart_Rate
FROM heartrate_seconds_merged
GROUP BY Id
ORDER BY Avg_Heart_Rate DESC;

##__________Weight & BMI Analysis__________##
SELECT
ROUND(AVG(WeightKg),2) AS Avg_Weight,
ROUND(AVG(BMI),2) AS Avg_BMI
FROM weightloginfo_merged;
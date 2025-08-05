-- Table: Trips
/* 
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| client_id   | int      |
| driver_id   | int      |
| city_id     | int      |
| status      | enum     |
| request_at  | varchar  |     
+-------------+----------+
id is the primary key (column with unique values) for this table.
The table holds all taxi trips. Each trip has a unique id, while client_id and driver_id are foreign keys to the users_id at the Users table.
Status is an ENUM (category) type of ('completed', 'cancelled_by_driver', 'cancelled_by_client').

Table: Users

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| users_id    | int      |
| banned      | enum     |
| role        | enum     |
+-------------+----------+
users_id is the primary key (column with unique values) for this table.
The table holds all users. Each user has a unique users_id, and role is an ENUM type of ('client', 'driver', 'partner').
banned is an ENUM (category) type of ('Yes', 'No').

The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03" with at least one trip. Round Cancellation Rate to two decimal points.

*/


-- Title: Calculate Cancellation Rate per Day (2013-10-01 to 2013-10-03)
-- Description: For each day, calculate the cancellation rate of taxi trips
--              where both the client and driver are not banned.
--              Cancellation is defined as status in 
--              ('cancelled_by_driver', 'cancelled_by_client').

-- Tables Used:
-- 1. Trips
-- 2. Users

-- Assumptions:
-- - Only trips with unbanned clients and drivers are considered.
-- - Dates are between 2013-10-01 and 2013-10-03 inclusive.
-- - Output is rounded to 2 decimal places.

SELECT 
    t.request_at AS `Day`,  
    ROUND(
        SUM(t.status IN ('cancelled_by_driver', 'cancelled_by_client')) / COUNT(*), 
        2
    ) AS `Cancellation Rate`
FROM Users u
JOIN Trips t ON t.client_id = u.users_id AND u.banned = 'No'
JOIN Users u2 ON t.driver_id = u2.users_id AND u2.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 1
ORDER BY 1;

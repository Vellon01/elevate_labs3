-- displaying all the records
SELECT * FROM Customer_support_table;

-- Total number of support tickets
SELECT COUNT(*) AS total_tickets FROM Customer_support_table;

-- Tickets by Channel
SELECT channel_name, COUNT(*) AS ticket_count
FROM Customer_support_table GROUP BY channel_name
ORDER BY ticket_count DESC;

-- Averae CSAT Score by Agent
SELECT Agent_name, AVG("CSAT Score") AS avg_csat 
FROM Customer_support_table
GROUP BY Agent_name
ORDER BY avg_csat DESC
LIMIT 10;

-- Top 5 Cities with Most Issues Reported
SELECT Customer_City, COUNT(*) AS issue_count
FROM Customer_support_table
WHERE Customer_City IS NOT NULL
GROUP BY Customer_City
ORDER BY issue_count DESC
LIMIT 5;

-- Most Common Product Issues
SELECT Product_category, COUNT(*) AS issue_count
FROM Customer_support_table
WHERE Product_category IS NOT NULL
GROUP BY Product_category
ORDER BY issue_count DESC;

-- Average Handling Time by Agent
SELECT Agent_name, AVG(connected_handling_time) AS avg_handling_time
FROM Customer_support_table
WHERE connected_handling_time IS NOT NULL
GROUP BY Agent_name
ORDER BY avg_handling_time ASC
LIMIT 10;

-- CSAT Score Distribution
SELECT "CSAT Score", COUNT(*) AS count
FROM Customer_support_table
GROUP BY 'CSAT Score'
ORDER BY 'CSAT Score';

-- Issues by Category and Sub-category
SELECT category, "Sub-category", COUNT(*) AS count
FROM Customer_support_table
GROUP BY category, "Sub-category"
ORDER BY count DESC
LIMIT 10;

-- Tickets Handled by Agent Shift
SELECT "Agent Shift", COUNT(*) AS tickets_handled
FROM Customer_support_table
GROUP BY "Agent Shift"
ORDER BY tickets_handled DESC;
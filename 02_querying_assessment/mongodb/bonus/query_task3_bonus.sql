-- Task 3 Bonus: Stock Replenishment Check
-- Before placing the weekly supply order, the manager wants to avoid over-ordering ingredients
-- that are already well-stocked. They need a list of every ingredient with a stock level
-- of 100 or more so those can be deprioritised in this week's order.
--
-- The dataset is identical in PostgreSQL — the same business insight can be retrieved.
--
-- Hint: Write a query to find the name of all rows in the Ingredients table
-- where the stock_level is greater than or equal to 100.

-- ---------------------------------------------------------------
-- Your thinking process (required)
/*ทำความเข้าใจโจทย์ว่าต้องการให้แสดงข้อมูล ผลลัพธ์ อะไร*/
/*อ่าน Hint เพื่อช่วยให้เข้าใจโจทย์มากขึ้น*/
/*เขียน query*/
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking:
--
SELECT *                    /*เรียกดูข้อมูลทั้งหมด*/
FROM Ingredients            /*จากตาราง Ingredients*/
WHERE stock_level >= 100;   /*โดยมีเงื่อนไข stock_level มีค่ามากกว่า หรือเท่ากับ 100*/
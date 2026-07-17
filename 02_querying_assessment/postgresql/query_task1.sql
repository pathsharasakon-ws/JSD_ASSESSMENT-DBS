-- Task 1: Sides Menu Board
-- The owner wants to update the printed menu board that displays only the side dishes.
-- They need a list of every item in the 'Side' category along with its current price,
-- so the designer can produce an accurate board without having to check each item manually.
--
-- Hint: Write a query to find the name and price of all menu items that are in the 'Side' category.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task1_bonus.mongodb.js

-- ---------------------------------------------------------------
-- Your thinking process (required)
/* ทำความเข้าใจว่าโจทย์ต้องการให้ทำอะไร (อ่าน Hint เพื่อช่วยให้เข้าใจไวขึ้นด้วย)*/
/* เขียน query*/
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking:
--
SELECT name, price              /* เลือกหัวข้อที่ต้องการให้แสดงผล */
FROM MenuItems                  /* เลือกจากตาราง MenuItems */
WHERE category = 'Side';        /* กรองเฉพาะรายการที่อยู่ในหมวดหมู่ 'Side' */
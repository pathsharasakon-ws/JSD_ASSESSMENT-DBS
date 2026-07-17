-- Task 2 Bonus: Shift Activity Report
-- Jane Doe has an upcoming performance review and the manager wants to look at her order history
-- ahead of the meeting. They only need to see when each order was placed and what it was worth —
-- no other details are required for this particular review.
--
-- The dataset is identical in PostgreSQL — the same business insight can be retrieved.
--
-- Hint: Write a query to find the order_date and total_price from the Orders table
-- for all orders handled by Jane Doe. You will need to join with the Staff table
-- to filter by the staff member's name.

-- ---------------------------------------------------------------
-- Your thinking process (required)
/*ทำความเข้าใจโจทย์ว่าต้องการให้แสดงข้อมูล ผลลัพธ์ อะไร*/
/*อ่าน Hint เพื่อช่วยให้เข้าใจโจทย์มากขึ้น*/
/*รวมตาราง order เข้ากับ staff โดยใช้ staff_id เป็นตัวเชื่อม*/
/*ให้แสดงผลลัพธ์ เฉพาะ Jane Doe แบบมีเงื่อนไข*/
/*เขียน query*/
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking:
--
WITH staff_order AS (                       /*สร้างข้อมูลชั่วคราวเพื่อรวมข้อมูลจากตาราง orders และ staff*/
    SELECT *                                /* เลือกทุกคอลัมน์*/
    FROM orders                             /* เลือกจากตาราง orders */
    INNER JOIN staff                        /*รวมข้อมูลจากตาราง staff โดยใช้ INNER JOIN*/
    ON orders.staff_id = staff.staff_id     /*เชื่อมโยงข้อมูลโดยใช้ คอลัมน์ staff_id*/
)
SELECT order_date, total_price             /*เลือกข้อมูลที่ต้องการให้แสดงผล*/
FROM staff_order                           /*เลือกจากข้อมูลชั่วคราว staff_order ที่สร้างไว้*/
WHERE first_name = 'Jane' AND last_name = 'Doe';  /*โดยมีเ�ขื่อนไข ให้แสดงเฉพาะ first_name = 'Jane' และ last_name = 'Doe'*/
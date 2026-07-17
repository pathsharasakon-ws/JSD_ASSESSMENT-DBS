-- Task 3: Staff Performance Review
-- At the end of the month, the owner wants to reward the hardest-working cashiers.
-- To decide fairly, they want to see how many orders each staff member has processed,
-- with the busiest staff member appearing at the top of the list.
--
-- Hint: Write a query to find the total number of orders processed by each staff member.
-- The result should show the staff member's full name (concatenated) and their total order count,
-- ordered by the count in descending order.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task3_bonus.mongodb.js

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
WITH staff_order AS (                       /*สร้างข้อมูลชั่วคราวเพื่อรวมข้อมูลจากตาราง orders และ staff*/
    SELECT *                                /* เลือกทุกคอลัมน์*/
    FROM orders                             /* เลือกจากตาราง orders */
    INNER JOIN staff                        /*รวมข้อมูลจากตาราง staff โดยใช้ INNER JOIN*/
    ON orders.staff_id = staff.staff_id     /*เชื่อมโยงข้อมูลโดยใช้ คอลัมน์ staff_id*/
)
SELECT CONCAT(first_name, ' ', last_name) AS full_name,     /*รวมชื่อและนามสกุลเป็น full_name*/
        COUNT(order_id) AS total_orders                     /*นับจำนวน order_id เพื่อหาจำนวนคำสั่งซื้อทั้งหมด*/
FROM staff_order                                            /*เลือกจากข้อมูลชั่วคราว staff_order ที่สร้างไว้*/
WHERE role = 'Cashier'                                      /*กรองเฉพาะพนักงานที่เป็น Cashier*/
GROUP BY full_name                                          /*จัดกลุ่มข้อมูลตาม full_name ที่สร้างไว้*/
ORDER BY total_orders DESC;                                 /*เรียงลำดับผลลัพธ์ตาม total_orders ที่สร้างไว้ จากมากไปน้อย*/
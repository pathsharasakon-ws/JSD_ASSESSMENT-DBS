-- Task 4: Supplier Dependency Check
-- The manager has just heard that 'Freshest Farm Produce' may be delayed on their next delivery.
-- Before deciding whether to source from an alternative supplier, they need to know exactly
-- which ingredients depend on that supplier, so they can assess the impact on the menu.
--
-- Hint: Write a query to find the names of all ingredients supplied by 'Freshest Farm Produce'.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task4_bonus.mongodb.js

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
SELECT Ingredients.name                             /*เลือกดูข้อมูล name ของ Ingredients*/
FROM Ingredients                                    /*จากตาราง Ingredients*/
INNER JOIN Suppliers                                /*โดยให้ เชื่อมโยง nested กับตาราง Suppliers ด้วย*/
ON Ingredients.supplier_id = Suppliers.supplier_id  /*ซึ่ง เกี่ยวพันกันใน คอลัมน์หัวข้อ supplier_id*/
WHERE Suppliers.name = 'Freshest Farm Produce';     /*โดยให้แสดงผล เฉพาะ 'Freshest Farm Produce'*/
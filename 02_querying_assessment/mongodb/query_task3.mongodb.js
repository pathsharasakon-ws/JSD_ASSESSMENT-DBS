// Task 3: Stock Replenishment Check
// Before placing the weekly supply order, the manager wants to avoid over-ordering ingredients
// that are already well-stocked. They need a list of every ingredient with a stock level
// of 100 or more so those can be deprioritised in this week's order.
//
// Hint: Write a query to find all ingredients in the ingredients collection that have a stock_level of 100.00 or more.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task3_bonus.sql

// ---------------------------------------------------------------
// Your thinking process (required)
//* ทำความเข้าใจจุดประสงค์ของคำสั่งว่าต้องการเรียกข้อมูลไปเพื่อใช้ทำอะไร
//* ทำความเข้าใจเงื่อนไข ว่าต้องการให้แสดงผลแบบไหน
//* เช็คฐานข้อมูลว่ามีการเก็บข้อมูลไว้แบบไหน nested รึเปล่า
//* เขียน query เรียกข้อมูลจาก collection ingredients
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// Your thinking:
//
use("chrome-burger-db");
db.ingredients.find({stock_level: {$gte: 100}}); //มากกว่า หรือเท่ากับ 100
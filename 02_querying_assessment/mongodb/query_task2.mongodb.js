// Task 2: Shift Activity Report
// Jane Doe has an upcoming performance review and the manager wants to look at her order history
// ahead of the meeting. They only need to see when each order was placed and what it was worth —
// no other details are required for this particular review.
//
// Hint: Write a query to find all orders handled by the staff member "Jane Doe".
// Your query should only return the order_date and total_price fields for these orders.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task2_bonus.sql

// ---------------------------------------------------------------
// Your thinking process (required)
//* ทำความเข้าใจจุดประสงค์ของคำสั่งว่าต้องการเรียกข้อมูลไปเพื่อใช้ทำอะไร
//* ทำความเข้าใจเงื่อนไข ว่าต้องการให้แสดงผลแบบไหน
//* เช็คฐานข้อมูลว่ามีการเก็บข้อมูลไว้แบบไหน nested รึเปล่า
//* เขียน query เรียกข้อมูลจาก collection orders
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// Your thinking:
//
use("chrome-burger-db");
db.orders.find({ 
    "staff.first_name": "Jane",         //ดึงข้อมูล ที่ nest อยู่ใน staff (ชื่อจริง)
    "staff.last_name": "Doe"},          //ดึงข้อมูล ที่ nest อยู่ใน staff (นามสกุล)
    { order_date: 1, total_price: 1, _id: 0 }); //ให้แสดงเฉพาะ หัวข้อ order_date และ total_price เท่านั้น ไม่เอา _id
// Task 4: Total Revenue Summary
// At the end of the trading period, the owner wants a single figure that shows how much revenue
// the truck has generated across all recorded orders. This number will be used in their
// financial summary report, so the result should be returned as a single value named total_revenue.
//
// Hint: Write an aggregation query on the orders collection to calculate the total revenue from all orders combined.
// The result should be a single document with a field named total_revenue.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task4_bonus.sql

// ---------------------------------------------------------------
// Your thinking process (required)
//* ทำความเข้าใจจุดประสงค์ของคำสั่งว่าต้องการเรียกข้อมูลไปเพื่อใช้ทำอะไร
//* ทำความเข้าใจเงื่อนไข ว่าต้องการให้แสดงผลแบบไหน
//* เช็คฐานข้อมูลว่ามีการเก็บข้อมูลไว้แบบไหน nested รึเปล่า
//* เขียน query เรียกข้อมูลจาก collection orders
//* สร้างและจัดเก็บข้อมูลตามคำสั่ง
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// Your thinking:
//
use("chrome-burger-db");
db.orders.aggregate([ //ยุบรวมข้อมูลทุกตัวเข้าด้วยกัน เพื่อหาผลรวม
    { $group: {
        _id: null,                      //ใช้ null เพื่อรวบรวมข้อมูลจากทุก document เป็นก้อนเดียว
        totalAmount: { $sum: { $multiply: ["$items.price", "$quantity"]}},   //หาผลรวมของ field ที่ชื่อ price (ราคา คูณกับ จำนวน)
        totalCount: {$sum: 1}        //นับจำนวนรายการทั้งหมด
    }},{
        $out: "total_revenue"           //ให้สร้าง collection  ใหม่ชื่อ total_revenue แล้วบันทึกผลรวมลงไป
    }
]);
db.total_revenue.find();                //เพื่อเช็คคำตอบใน document

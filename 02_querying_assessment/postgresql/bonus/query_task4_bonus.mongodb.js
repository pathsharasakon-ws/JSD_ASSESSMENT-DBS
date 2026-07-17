// Task 4 Bonus: Supplier Dependency Check
// The manager has just heard that 'Freshest Farm Produce' may be delayed on their next delivery.
// Before deciding whether to source from an alternative supplier, they need to know exactly
// which ingredients depend on that supplier, so they can assess the impact on the menu.
//
// The dataset is identical in MongoDB — the same business insight can be retrieved.
//
// Hint: In the ingredients collection, supplier references are stored as ObjectIds rather than names.
// Use an aggregation pipeline with $lookup to join the ingredients collection with the suppliers
// collection, then filter where the supplier name is 'Freshest Farm Produce' and return
// only the ingredient names.

// ---------------------------------------------------------------
// Your thinking process (required)
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// Your thinking:
//
use("chrome-burger-db");
db.ingredients.aggregate([          //ดึงข้อมูล supplier ที่ตรงกัน เข้ามาใส่ใน supplier_info
    {$lookup: {
      from: "suppliers",            //เชื่อมไปยัง collection suppliers
      localField: "supplier_id",    //เลือกหัวข้อใน ingredients ที่ต้องการเชื่อม
      foreignField: "_id",          //เลือกหัวข้อใน suppliers ที่ต้องการเชื่อม
      as: "supplier_info"}          //ชื่อฟิลด์ใหม่ที่รวบรวมข้อมูลที่เชื่อมมา
    },{
        $match : {
            "supplier_info.name": "Freshest Farm Produce"} //กรองเอาเฉพาะข้อมูลที่ต้องการ
        },{
            $project: {                 //เลือกให้แสดงผลตามที่ต้องการ
            _id: 0,                     //ไม่ให้แสดง _id
            ingredient : "$name" }      //ให้แสดง name ของ ingredient เท่านั้น
        }
]);
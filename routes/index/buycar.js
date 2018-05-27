/**
 * Created by Administrator on 2018/5/21.
 */
var express = require("express");
var router = express.Router();
var query = require("../../mysqls/pool");


/* GET home page. */
router.get("/", function(req, res, next) {
    res.send("index", { title: "Express" });
});


router.post("/addbuycar", function (req, res) {
    let name = req.body.name;
    let count = req.body.count;
    let pid = req.body.pid;
    let img = req.body.img;
    let uid = req.body.uid;
    let price = req.body.price;
    query(`insert into buycar (goods,count,pid,img,uid,price) values ('${name}','${count}','${pid}','${img}','${uid}','${price}')`,function (err,sql) {
        if(err) throw err;
        if(sql.affectedRows==1){
            res.send('ok')
        }else{
            res.send('aaa')
        }
    } )

})


router.get("/display", function(req, res) {
    let uid = req.query.uid;
    query('select * from buycar where uid = '+uid,function (err,sql) {
        if(err) throw err;
        res.send(sql)
    })
});



module.exports = router;
/**
 * Created by ow on 2018/5/28.
 */
var express = require("express");
var router = express.Router();
var query = require("../../mysqls/pool");

router.post("/addlist", function (req, res) {
    // console.log(req.body);

    let arr = req.body
    // console.log(arr);
    let uid = arr[0].uid
    query(`insert into list (pid) values ('${uid}')`, function (err, sql) {
        if (err) throw err;
        // console.log(sql);
        // sql.insertId
        if (sql.affectedRows == 1) {
            arr.forEach(val => {
                let newid = sql.insertId
                // console.log(sql.insertId);
                query(`insert into listtwo (dingdanid,goodsid,count) values ('${newid}','${val.pid}','${val.count}')`, function (err, sql) {
                    if (err) throw err;
                    if (sql.affectedRows == 1) {
                        // console.log('ok')
                    } else {
                        // console.log('no')
                    }
                })
            })
            res.send('ok')
        } else {
            res.send('listno')
        }
    })


})

router.get("/delbuycar", function (req, res) {
    let id = req.query.id;
    query('delete from buycar where uid=' + id, function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});


// 订单页展示

router.get("/user", function (req, res) {
    let uid = req.query.uid;
    query('select * from list where pid = ' + uid, function (err, sql) {
        if (err) throw err;
        res.send(sql)
    })
});

router.get("/find", function (req, res) {
    let dingdanid = req.query.dingdanid;
    query('select * from listtwo where dingdanid = ' + dingdanid, function (err, sql) {
        if (err) throw err;
        res.send(sql)
    })
});


router.get("/display", function (req, res) {
    let dingdanid = req.query.dingdanid;
    query('select * from listtwo where dingdanid = ' + dingdanid, function (err, sql) {
        if (err) throw err;
        res.send(sql)
    })
});
router.get("/product", function (req, res) {
    let id = req.query.id;
    query('select * from product where id = ' + id, function (err, sql) {
        if (err) throw err;
        res.send(sql)
    })
});

module.exports = router;
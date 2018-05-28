/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();
var query = require('../../mysqls/pool')

/* GET home page. */



router.get('/discount', function (req, res) {
    let nub=req.query.nub
    let size=req.query.size
    let n=(nub-1)*size
    query('select * from product', function (err, sql) {
        if (err) throw err;
        let ridarr = [];
        sql.forEach(val => {
            let rid = JSON.parse(val.rid);
            let flag = rid.includes(2);
            if (flag) {
                ridarr.push(JSON.stringify(val))
            }
        });
        let arr=ridarr.slice(n,nub*size)
        // console.log(ridarr.length);
        res.send(arr)
    })


});


router.get('/count', function (req, res) {
    query('select * from product', function (err, sql) {
        if (err) throw err;
        let ridarr = [];
        sql.forEach(val => {
            let rid = JSON.parse(val.rid);
            let flag = rid.includes(2);
            if (flag) {
                ridarr.push(JSON.stringify(val))
            }
        });
        let total=ridarr.length
        // console.log(total);
        res.send({ total: total })
    })
});

router.get('/nut', function (req, res) {
    query('select * from product limit 11,4', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});

module.exports = router;
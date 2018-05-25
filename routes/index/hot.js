/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();
var query = require('../../mysqls/pool');

/* GET home page. */

router.get('/hot', function (req, res) {
    query('select * from product', function (err, sql) {
        if (err) throw err;
        let ridarr = []
        sql.forEach(val => {
            let rid = JSON.parse(val.rid)
            let flag = rid.includes(3)
            if (flag) {
                ridarr.push(JSON.stringify(val))
            }
        })
        res.send(ridarr)
    })

});

router.get('/new', function (req, res) {
    let id=req.query.id
    query('select * from product where id='+id, function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })

});

module.exports = router;
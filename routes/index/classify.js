/**
 * Created by Administrator on 2018/5/21.
 */

var express = require('express');
var router = express.Router();
var query = require('../../mysqls/pool')

/* GET home page. */



router.get('/show', function (req, res) {
    let id=req.query.id
    let nub=req.query.nub
    let size=req.query.size
    let n=(nub-1)*size
    query(`select * from product where fid=${id} limit ${n},${size}`, function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});

router.get('/count', function (req, res) {
    let id=req.query.id
    query(`select count(*) as total from product where fid=${id}`, function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })

});

router.get('/list', function (req, res) {
    query('select * from fenlei', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })

});

router.get('/nut', function (req, res) {
    query('select * from product limit 10,4', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});


module.exports = router;
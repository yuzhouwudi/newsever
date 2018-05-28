/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();
var query = require('../../mysqls/pool');

/* GET home page. */
router.get('/home', function (req, res) {
    query('select * from product limit 29,1', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});

router.get('/xinpin', function (req, res) {
    query('select * from product limit 0,3', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});


router.get('/rexiao', function (req, res) {
    query('select * from product limit 26,3', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});

router.get('/nuts', function (req, res) {
    query('select * from product limit 10,3', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});

router.get('/nutss', function (req, res) {
    query('select * from product limit 13,3', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});

router.get('/zhe', function (req, res) {
    query('select * from product limit 21,1', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});

router.get('/kou', function (req, res) {
    query('select * from product limit 24,1', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});


module.exports = router;
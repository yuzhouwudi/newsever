/**
 * Created by Administrator on 2018/5/21.
 */

var express = require('express');
var router = express.Router();
var query = require('../../mysqls/pool')

/* GET home page. */


router.get('/show', function (req, res) {
    let id=req.query.id
    query(`select * from product where fid=${id}`, function (err, sql) {
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


module.exports = router;
/**
 * Created by ow on 2018/5/27.
 */
var express = require('express');
var router = express.Router();
var query = require('../../mysqls/pool');


router.get('/nuts', function (req, res) {
    query('select * from product limit 12,3', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});


module.exports = router;
/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();
var query=require('../../mysqls/pool')

/* GET home page. */
router.get('/display', function(req, res) {
    query('select * from product',function (err,sql) {
        if(err) throw err;
        res.send(sql);
    })

});

module.exports = router;
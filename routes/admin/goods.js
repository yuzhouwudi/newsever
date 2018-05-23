/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();
var query=require('../../mysqls/pool')

/* GET home page. */
router.get('/nut', function(req, res) {
    query('select * from product where fid=2',function (err,sql) {
        if(err) throw err;
        res.send(sql);
    })

});

module.exports = router;
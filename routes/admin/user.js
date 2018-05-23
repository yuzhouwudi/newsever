/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var query=require('../../mysqls/pool')
var router = express.Router();

/* GET home page. */
router.get('/display', function(req, res,) {

    query('select * from user',function (err,sql) {
        if(err) throw err
        res.send(sql);
    })
});

router.get('/buycar', function(req, res,) {

    query('select * from buycar',function (err,sql) {
        if(err) throw err;
        res.send(sql);
    })
});


router.get('*',function (req,res) {
    console.log('获取错了');
    res.send('errrrrrr')
})

module.exports = router;
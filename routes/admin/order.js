var express = require('express');
var router = express.Router();
var query=require('../../mysqls/pool')


/* GET home page. */


router.get('/display', function(req, res) {
    query('select * from list',function (err,sql) {
        res.send(sql)
    })
});

router.get('/detail',function (req,res) {
    // let dingdanid = req.query.dingdanid;
    let pid = req.query.pid;
    query('select *  from user where id = '+pid,function (err,sql) {
        if(err) throw err;
       res.send(sql)
})

})

router.get('/goods',function (req,res) {
    let dingdanid = req.query.dingdanid;
    query('select *  from listtwo where dingdanid = '+dingdanid,function (err,sql) {
        if(err) throw err;
        res.send(sql)
    })
});


router.get('/find',function (req,res) {
    let id = req.query.id;
    query('select *  from product where id = '+id,function (err,sql) {
        if(err) throw err;

        res.send(sql)
    })
});

router.get('/alter',function (req,res) {
    let id = req.query.id;
    let status= req.query.status;
    query('update list  set status='+status+' where id = '+id,function (err,sql) {
        if(err) throw err;
        res.send(sql)
    })
})



module.exports = router;
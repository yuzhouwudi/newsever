/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();
var query=require('../../mysqls/pool')

router.get('/', function(req, res, next) {
    if(!req.session.login){
        res.send('no')
    }else{
        res.send(req.session.user)
    }

});

router.get('/clear', function(req, res, next) {
    if(req.session.login){
        res.send('edit')
    }

});

router.get('/display', function (req, res) {
    query('select * from manager', function (err, sql) {
        if (err) throw err
        res.send(sql)
    })
})




module.exports = router;
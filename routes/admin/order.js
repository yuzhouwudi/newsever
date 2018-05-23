var express = require('express');
var router = express.Router();
var query=require('../../mysqls/pool')


/* GET home page. */


router.get('/display', function(req, res) {
    query('select * from list',function (err,sql) {
        res.send(sql)
    })
});

router.get('/displaytwo', function(req, res) {
    query('select * from listtwo',function (err,sql) {
        res.send(sql)
    })
});


module.exports = router;
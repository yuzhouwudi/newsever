/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    if(!req.session.login){
        res.send('no')
    }

});

module.exports = router;
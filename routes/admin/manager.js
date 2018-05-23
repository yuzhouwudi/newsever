/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    if(!req.session.login){
        res.send('no')
    }else{
        res.send(req.session.user)
    }

});

router.get('/clear', function(req, res, next) {
    if(req.session.login){
        // delete req.session.user;
        // req.session.login='no'
        res.send('edit')
    }

});

module.exports = router;
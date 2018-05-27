/**
 * Created by ow on 2018/5/27.
 */
var express = require('express');
var router = express.Router();
var query = require('../../mysqls/pool')


router.get('/session', function(req, res) {
    console.log(req.session);
    if(!req.session.users){
        res.send('n')
    }else{
        res.send(req.session.users)
    }
});


router.post('/user', function (req, res) {
    let phone=req.body.phone
    let pass=req.body.pass
    query(`select * from user where phone=${phone}`, function (err, result) {
        if (err) throw err;
        // console.log(result);
        if(result.length!==0){
            if(pass===result[0].password){
                req.session.sign='yes'
                req.session.users=result[0].account
                res.send(result)
            }else{
                res.send('密码错误')
            }
        }else{
            res.send('账号不存在')
        }
    })

});



module.exports = router;
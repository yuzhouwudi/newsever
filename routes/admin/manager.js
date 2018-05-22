/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();
var multer=require('multer')
var svgCaptcha = require('svg-captcha');
var query=require('../../mysqls/pool')

router.get('/',function (req,res) {
    res.send('aa')
})



router.get('/code', function (req, res) {
    var captcha = svgCaptcha.createMathExpr({
        color: true,
        // background: '#fff'
    });
    req.session.code = captcha.text;

    res.type('svg'); // 使用ejs等模板时如果报错 res.type('html')
    res.status(200).send(captcha.data);
});

router.post('/check',function (req,res) {
    let zhanghao=req.body.user
    let pass=req.body.pass
    let code=req.body.code
    if(code.toUpperCase()!==req.session.code.toUpperCase()){
        res.send('验证码错误')
        return
    }
    query(`select * from manager where name='${zhanghao}'`,function (err,result) {
        if(err){
            throw err
        }
        if(result.length!==0){
            if(pass===result[0].password){
                req.session.login='yes'
                req.session.user=zhanghao
                res.send('ok')
                // res.redirect('/users/')
            }else{
                res.send('密码错误')
            }
        }else{
            res.send('账号不存在')
        }
    })
})

module.exports = router;
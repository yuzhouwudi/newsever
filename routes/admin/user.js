/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var query = require('../../mysqls/pool')
var router = express.Router();

/* GET home page. */
router.get('/display', function (req, res,) {

    query('select * from user', function (err, sql) {
        if (err) throw err
        res.send(sql);
    })
});

router.get('/buycar', function (req, res,) {

    query('select * from buycar', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});


router.post('/address', function (req, res) {
    let body = req.body
    if (!body.town) {
        query(`insert into address (provice,city,address,tel,uid)
        values ('${body.provice}','${body.city}','${body.address}',
        '${body.tel}','${body.uid}')`, function (err, data) {
            if (err) throw err
            if (data.affectedRows === 1) {
                res.send('ok')
            } else {
                res.send('no')
            }

        })
    } else {
        query(`insert into address (provice,city,town,address,tel,uid)
        values ('${body.provice}','${body.city}','${body.town}','${body.address}',
        '${body.tel}','${body.uid}')`, function (err, data) {
            if (err) throw err
            if (data.affectedRows === 1) {
                res.send('ok')
            } else {
                res.send('no')
            }

        })
    }
    // console.log(body);


});

router.get('*', function (req, res) {
    console.log('获取错了');
    res.send('errrrrrr')
})

module.exports = router;
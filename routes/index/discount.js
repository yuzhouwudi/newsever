/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();
var query = require('../../mysqls/pool')

/* GET home page. */
router.get('/discount', function (req, res) {
    query('select * from product', function (err, sql) {
        if (err) throw err;
        let ridarr = [];
        sql.forEach(val => {
            let rid = JSON.parse(val.rid);
            let flag = rid.includes(2);
            if (flag) {
                ridarr.push(JSON.stringify(val))
            }
        });
        res.send(ridarr)
    })

});


// router.get('/', function(req, res, next) {
//     res.send('index', { title: 'Express' });
// });

module.exports = router;
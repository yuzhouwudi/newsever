/**
 * Created by Administrator on 2018/5/21.
 */
var express = require('express');
var router = express.Router();
var query = require('../../mysqls/pool')
var multer = require('multer');
var fs = require('fs')
var os = require('os')

let upload = multer({
    dest: os.tmpdir()
})

/* GET home page. */
router.get('/nut', function (req, res) {
    query('select * from product where fid=2', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })

});

router.get('/nutmod', function (req, res) {
    let id = req.query.id
    query('select * from product where id=' + id, function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});


router.post('/upload', upload.single('file'), function (req, res, next) {
    res.send(req.file.path)
});

router.post('/form', function (req, res) {
    let body = req.body
    let img = JSON.parse(body.fileList)
    let str = []
    img.forEach(val => {
        if (val.response) {
            let newpath = "/" + Date.now() + val.name
            fs.renameSync(val.response, './public' + newpath)
            str.push({name: val.name, url: newpath})
        } else {
            str.push({name: val.name, url: val.url})
        }
    })
    console.log(str);
    res.send(str)

});

module.exports = router;
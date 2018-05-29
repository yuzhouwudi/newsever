/**
 * Created by ow on 2018/5/27.
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

router.post('/upload', upload.single('file'), function (req, res, next) {

    res.send(req.file.path)
});

router.get('/person', function (req, res) {
    let id = req.query.id
    query('select * from user where id=' + id, function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});




function uploading(pic) {
    let img = JSON.parse(pic)
    let str = []
    img.forEach(val => {
        if (val.response) {
            let newpath = "/" + Date.now() + val.name
            // fs.renameSync(val.response, './public' + newpath)
            // 跨盘转存
            let input = fs.createReadStream(val.response);
            let output = fs.createWriteStream('./public/img' + newpath);
            input.pipe(output, function () {
                fs.unlinkSync(val.response);
                // 删除临时文件
            });
            str.push({name: val.name, url: '/api/img' + newpath})
        } else {
            str.push({name: val.name, url: val.url})
        }
    })
    return JSON.stringify(str)
}
//
//
// // 修改
router.post('/upd', function (req, res) {
    let id = req.query.id
    let body = req.body
    // console.log(req.body);
    let imgstr = uploading(body.img)
    if(!req.body.pass){
        query(`update user set name='${body.name}',img='${imgstr}'
        where id=${id}`, function (err, data) {
            if (err) throw err
            if (data.affectedRows === 1) {
                res.send('ok')
            } else {
                res.send('no')
            }
        })
    }else{
        query(`update user set name='${body.name}',password='${body.pass}',img='${imgstr}'
        where id=${id}`, function (err, data) {
            if (err) throw err
            if (data.affectedRows === 1) {
                res.send('ok')
            } else {
                res.send('no')
            }
        })
    }


});

module.exports = router;
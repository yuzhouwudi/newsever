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

// 坚果分类
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

router.get('/del', function (req, res) {
    let id = req.query.id
    query('delete from product where id=' + id, function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});


router.post('/upload', upload.single('file'), function (req, res, next) {
    res.send(req.file.path)
});


// 转存
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
            str.push({name: val.name, url: '/api/img'+newpath})
        } else {
            str.push({name: val.name, url: val.url})
        }
    })
    return JSON.stringify(str)
}


// 修改
router.post('/upd', function (req, res) {
    let id = req.query.id
    let body = req.body
    let imgstr = uploading(body.img)
    query(`update product set name='${body.name}',fid='${body.fid}',rid='${body.rid}'
     ,price='${body.price}',count='${body.count}',contfree='${body.contfree}',des='${body.des}',
     img='${imgstr}',time='${body.time}' where id=${id}`, function (err, data) {
        if (err) throw err
        if (data.affectedRows === 1) {
            res.send('ok')
        } else {
            res.send('no')
        }
    })

});


router.get('/nutfenlei', function (req, res) {
    query('select * from fenlei', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});

router.get('/nutrecom', function (req, res) {
    query('select * from recom', function (err, sql) {
        if (err) throw err;
        res.send(sql);
    })
});

// 添加
router.post('/add', function (req, res) {
    let body = req.body

    let imgstr = uploading(body.img)


    query(`insert into product (name,fid,rid,price,count,contfree,des,img,time) 
        values ('${body.name}','${body.fid}','${body.rid}','${body.price}',
        '${body.count}','${body.contfree}','${body.des}','${imgstr}','${body.time}')`, function (err, data) {
        if (err) throw err
        if (data.affectedRows === 1) {
            res.send('ok')
        } else {
            res.send('no')
        }

    })


});


module.exports = router;
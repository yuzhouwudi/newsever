/**
 * Created by ow on 2018/4/28.
 */

let mysql=require('mysql')

let connet=mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    port:'3306',
    database:'blog'
})

connet.connect(function () {
    console.log('ok')
})

connet.query('select * from mess',function (err,result) {
    console.log(result);
});

connet.end(function () {
    console.log('close')
})
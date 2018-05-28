/**
 * Created by ow on 2018/4/28.
 */

let mysql=require('mysql')
const option={
    host:'localhost',
    port:'3306',
    user:'root',
    password:'',
    database:'penaut'
}

let pool=mysql.createPool(option)

// 获取空闲连接接口
function query(str,callback) {
    pool.getConnection(function (err,sql) {
        if(err){
            callback(err)
        }else{
            sql.query(str,function (err,res) {
                if(err){
                    callback(err)
                }else {
                    callback(null,res);
                    sql.release();
                }

            })
        }

    })

}



module.exports=query


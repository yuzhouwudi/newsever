
var express = require('express');
var path = require('path');
var bodyparse=require('body-parser');
var session = require('express-session');
var multer=require('multer');
var mysql=require('mysql');


// 登录
var login=require('./routes/admin/login')
//商品管理
var goods=require('./routes/admin/goods')
// 管理员信息管理
var manager=require('./routes/admin/manager')
//订单管理
var order=require('./routes/admin/order');
// 用户管理
var user=require('./routes/admin/user');
// 购物车
var buycar=require('./routes/index/buycar');
// 首页
var home=require('./routes/index/home');
//分类
var classify=require('./routes/index/classify');
//折扣
var discount=require('./routes/index/discount');
//热门
var hot=require('./routes/index/hot');
//新品
var news=require('./routes/index/new');

var app = express();

app.use(bodyparse.json());
app.use(bodyparse.urlencoded({extended:false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/admin/login',login);
app.use('/admin/goods',goods);
app.use('/admin/manager',manager);
app.use('/admin/user',user);
app.use('/admin/order',order);
app.use('/index/buycar',buycar);
app.use('/index/classify',classify);
app.use('/index/discount',discount);
app.use('/index/home',home);
app.use('/index/hot',hot);
app.use('/index/new',news);


app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};


  // render the error page
  res.status(err.status || 500);
  res.send('error');
});
app.listen(3000,function () {
  console.log('ok')
})

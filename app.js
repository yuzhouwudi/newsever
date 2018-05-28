
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
var list=require('./routes/index/list');

var sign=require('./routes/index/sign')
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

var detail=require('./routes/index/detail');

var person=require('./routes/index/person');

var app = express();

app.use(bodyparse.json());
app.use(bodyparse.urlencoded({extended:false}));

app.use(express.static(path.join(__dirname,'public')));
app.use('/api',express.static(path.join(__dirname,'public')));


app.use(session({
    secret: 'keyboard cat',
    resave: true,
    saveUninitialized: true,
}));



app.use('/api/admin/login',login);
app.use('/api/admin/goods',goods);
app.use('/api/admin/manager',manager);
app.use('/api/admin/user',user);
app.use('/api/admin/order',order);

app.use('/api/index/sign',sign);
app.use('/api/index/person',person);
app.use('/api/index/detail',detail);
app.use('/api/index/buycar',buycar);
app.use('/api/index/list',list);
app.use('/api/index/classify',classify);
app.use('/api/index/discount',discount);
app.use('/api/index/home',home);
app.use('/api/index/hot',hot);
app.use('/api/index/new',news);






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

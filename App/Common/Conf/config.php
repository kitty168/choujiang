<?php
return array(
	//'配置项'=>'配置值'
	'URL_MODEL'             =>  2,       // URL访问模式,可选参数0、1、2、3,代表以下四种模式：
	// 0 (普通模式); 1 (PATHINFO 模式); 2 (REWRITE  模式); 3 (兼容模式)  默认为PATHINFO 模式
	'URL_CASE_INSENSITIVE'  =>  false,   // 默认false 表示URL区分大小写 true则表示不区分大小写
	'URL_PATHINFO_DEPR'     =>  '/',    // PATHINFO模式下，各参数之间的分割符号
	'URL_PATHINFO_FETCH'    =>  'ORIG_PATH_INFO,REDIRECT_PATH_INFO,REDIRECT_URL', // 用于兼容判断PATH_INFO 参数的SERVER替代变量列表
	'URL_REQUEST_URI'       =>  'REQUEST_URI', // 获取当前页面地址的系统变量 默认为REQUEST_URI
	'URL_HTML_SUFFIX'       =>  'html',  // URL伪静态后缀设置
	// 允许访问的模块列表
	'MODULE_ALLOW_LIST'    =>    array('Home','Admin','User'),
	'DEFAULT_MODULE'       =>    'Home',  // 默认模块
);

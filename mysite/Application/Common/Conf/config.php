<?php
return array(
	//'配置项'=>'配置值'
	///* 数据库设置 */
    'DB_TYPE'               =>  'mysql',     // 数据库类型
    'DB_HOST'               =>  'localhost', // 服务器地址
    'DB_NAME'               =>  'db_youjia',          // 数据库名
    'DB_USER'               =>  'root',      // 用户名
    'DB_PWD'                =>  '',          // 密码
    'DB_PORT'               =>  '3306',        // 端口
    'DB_PREFIX'             =>  'site_',    // 数据库表前缀
    'DB_PARAMS'          	=>  array(), // 数据库连接参数    
    'DB_DEBUG'  			=>  TRUE, // 数据库调试模式 

    'MULTI_MODULE'          =>  true, // 是否允许多模块 如果为false 则必须设置 
    'MODULE_ALLOW_LIST'     =>   array('Home','Admin'),//模块管理
);
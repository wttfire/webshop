<?php
namespace Admin\Controller;
use Think\Controller;
class AdminController extends Controller {
    public function login(){
    	$act = I("post.act");
    	if($act && $act=="login"){
    		$name = I("post.name");
    		$pwd = I("post.pwd");
    		$pwd = substr(md5($pwd),8,16)
    		$admin = M("admin")->where("userName='{name}' and userPassword='{$pwd}'")->find();
    		if($admin){
    			session("name",$name);
    			session("uid",$admin['id']);
    			$this->success("登陆成功","index",2);exit;
    		}else{
    			$this->error("登陆失败","",2);exit;
    		}
    	}
    	$this->display();
    }

    public function index(){
        $this->display();    
    }

    public function updatePwd(){
    	$uid = session("uid");
    	$user = M("admin")->field("userPassword,uRealName")->where("id={$uid}")->find();
    	$this->assgin("user",$user);
    	$act = I("post.act");
    	if($act && $act=="updatePwd"){
    		$oldPwd = I("post.oldPwd");
    		$newPwd = I("post.newPwd");
    		$newPwd1 = I("post.newPwd1");

    		if(substr(md5($oldPwd),8,16)!=$user['userPassword']){
    			$this->error("旧密码填写错误","",1);exit;
    		}
    		if($newPwd!=$newPwd1){
    			$this->error("新密码填写不一致","",1);exit;
    		}

    		$res = M("admin")->where("id={$uid}")->setField("userPassword",substr(md5($newPwd),8,16));
    		if($res){
    			$this->success("修改成功","index",2);exit;
    		}else{
				$this->error("修改成功","",1);exit;
    		}
    	}
        $this->display();    
    }
}
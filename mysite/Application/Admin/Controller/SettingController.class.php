<?php
namespace Admin\Controller;
use Think\Controller;
class SettingController extends AdminController {
	private $model = null;
	public function  __constrct(){
		parent::__constrct();
		$this->model = M("setting");
	}
    public function index(){
        $setting = $this->model->find(1);
        $this->assgin("setting",$setting);
        $act = I("post.act");
        if($act && $act=="updateSetting"){
        	$title = I("title");
        	$company = I("company");
        	$keyword = I("keyword");
        	$description = I("description");
        	$url = I("url");

        	$data = array(
        		"id"=>1,
        		"title"=>$title,
        		"company"=>$company,
        		"keyword"=>$keyword,
        		"description"=>$description,
        		"url"=>$url,
        		);
        	$res = $this->model->save($data);
        	if($res){
        		$this->success("修改成功","",1);exit;
        	}else{
        		$this->error("修改失败","",1);exit;
        	}
        }
        $this->display();
        
    }
}
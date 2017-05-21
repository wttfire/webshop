<?php
namespace Admin\Controller;
use Think\Controller;
class SingleController extends AdminController {
	private $model = null;
	public function  __constrct(){
		parent::__constrct();
		$this->model = M("singlePage");
	}
    public function index(){
    	$count = $this->model->count();
    	$Page = new /Think/Page($count,20); 
        $singleList = $this->model->limit($Page->firstRow.",".$Page->listRows)->select();
        $this->assgin("singleList",$singleList);
        $this->display(); 
    }

    public function add(){
    	$title = I("post.title");
    	$content = I("post.content");

    	$data = array(
    		"title"=>$title,
    		"content"=>$content
    		);
    	$res = $this->model->add($data);
    	if($res){
    		$this->success("添加成功","index",1);
    	}else{
    		$this->error("添加失败");
    	}

    }

    public function update(){
    	$id = I("get.id");
    	$single = $this->model->find($id);
    	$this->assgin("single",$single);

    	$act = I("post.act");
    	if($act && $act=="updateSingle"){
    		$title = I("post.title");
	    	$content = I("post.content");

	    	$data = array(
	    		"title"=>$title,
	    		"content"=>$content
	    		);
	    	$res = $this->model->add($data);
	    	if($res){
	    		$this->success("添加成功","index",1);
	    	}else{
	    		$this->error("添加失败","",1);exit;
	    	}
    	}
    	$this->display();
    }
}
<?php
namespace Admin\Controller;
use Think\Controller;
class FeedbackController extends AdminController {
    private $model = null;
	public function  __constrct(){
		parent::__constrct();
		$this->model = M("feedback");
	}
    public function index(){
    	$count = $this->model->count();
    	$Page = new /Think/Page($count,20); 
        $feedList = $this->model->limit($Page->firstRow.",".$Page->listRows)->select();
        $this->assgin("feedList",$feedList);
        $this->display(); 
    }
}
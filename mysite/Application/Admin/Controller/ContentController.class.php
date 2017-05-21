<?php
namespace Admin\Controller;
use Think\Controller;
class ContentController extends AdminController {
    private $model = null;
	public function  __constrct(){
		parent::__constrct();
		$this->model = M("content");
	}
    public function index(){
        $user = M("admin")->find(1);
        
    }
}
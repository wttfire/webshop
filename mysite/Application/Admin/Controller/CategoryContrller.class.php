<?php
namespace Admin\Controller;
use Think\Controller;
class CategoryController extends AdminController {
    private $model = null;
	public function  __constrct(){
		parent::__constrct();
		$this->model = M("category");
	}
    public function index(){
        $user = M("admin")->find(1);
        
    }
}
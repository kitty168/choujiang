<?php
namespace Home\Controller;
use Think\Controller;
/**
 * 抽奖处理类
 */
class BaseController extends Controller {
    public function _initialize(){
        $token = session('token');
        if($token !== C('CJ_TOKEN')){
            $this->redirect('Login/index');
            exit();
        }
    }
}
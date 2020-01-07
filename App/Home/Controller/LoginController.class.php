<?php
namespace Home\Controller;
use Think\Controller;
/**
 * 授权管理
 */
class LoginController extends Controller {

    public function index(){
        if(session('token') === C('CJ_TOKEN')){
            $this->redirect('Index/index');
            exit();
        }
        
        if(IS_POST) {
            $token = I('post.token','');
            if($token === C('CJ_TOKEN')) {
                session('token',C('CJ_TOKEN'));
                $this->redirect('Index/index');
            }else{
                $this->error('授权失败',U('Login/index'));
            }
        }else{
            $this->display();
        }
    }

    public function logOut(){
        session(null);
        $this->redirect('Login/index');
    }
    
}
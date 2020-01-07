<?php
namespace Home\Controller;
use Think\Controller;
/**
 * 抽奖处理类
 */
class IndexController extends BaseController {
    public function index(){
        $awards = $this->getAwardAll();
        $this->assign('shengYuNum',  $this->getUserRemainCount());
        $this->assign('awards',$awards);
        $this->display();
    }
    
    public function del() {
        M('User')->where("1=1")->save(array(
            'awards_id' => 0,
            'awards_id2' => 0,
        ));
        
        M('Awards')->where("1=1")->save(array(
            'aw_count' => 0
        ));
        
        $this->success('清除成功',U('Index/index'));
    }
    
    public function lst() {
        $model = M('User');
        
        $where = array(
            'awards_id' => array('gt',0),
        );
        $where2 = array(
            'awards_id2' => array('gt',0),
        );
        
        $userData = $model->where($where)->select();
        $userData2 = $model->where($where2)->select();
        
        $userData = array_merge($userData, $userData2);

        if(empty($userData)) {
            $this->redirect("Index/index");
        }else {
        
            $awardsData = M('Awards')->select();

            $this->assign('userData',$userData)->assign("awardsData",$awardsData);

            $this->display();
        
        }
    }
    
    /**
     * 获取为中奖人数
     * @return type
     */
    public function getUserRemainCount() {
        if(IS_AJAX) {
            $this->ajaxReturn(M('User')->where("awards_id=0")->count());
        }  else {
            return M('User')->where("awards_id=0")->count();
        }
    }
    /**
     * 获取用户信息
     */
    public function getUser(){
        if(IS_AJAX) {
            $model = D('User');
            
            if(I('post.type') == 2) {
                $map = array(
                    'awards_id2'=>0,
                );
            }else if(I('post.type') == 1) {
                $map = array(
                    'awards_id'=>0,
                );
            }else{
                return false;
            }
            
            $data = $model->field('uid,username')->where($map)->select();
            
            $this->ajaxReturn($data);

        }else{
            header("Content-type: text/html; charset=utf-8");
            die("非法请求");
        }
    }
    /**
     * 更新用户中奖情况
     */
    public function updateUser () {
        if(IS_AJAX) {
            $uids = I('post.uids');

//            $uids = substr($uids, 0,  strlen($uids)-1);

            $model = D('User');
            $map = array(
            	'uid' => array('in',$uids)
            );
            
            if(I('post.type') == 2) {
                $data = array(
                    'awards_id2'=>I('post.awards_id'),
                );
            }else if(I('post.type') == 1) {
                $data = array(
                    'awards_id'=>I('post.awards_id'),
                );
            }else{
                return false;
            }
            
            $model->where($map)->save($data);
            
            //抽取次数+1
            M('Awards')->where("aid=".I('post.awards_id')." AND aw_count < aw_time")->setInc('aw_count', 1);
            //获取所有未抽取的奖项
            $awardAll = $this->getAwardAll();
            //剩余人数

            $this->ajaxReturn($awardAll);

        }else{
            header("Content-type: text/html; charset=utf-8");
            die("非法请求");
        }
    }
    /**
     * 增加奖项
     */
    public function addAward() {
        if(IS_AJAX) {
            
            $data = array(
                'aw_name' => I('post.aw_name'),
                'aw_num' => I('post.aw_num'),
                'aw_time' => I('post.aw_time'),
                'aw_info' => I('post.aw_info'),
                'hp_name' => I('post.hp_name'),
            );
            
            $model = D('Awards');
            if($model->where("aw_name='".$data['aw_name']."'")->find()){
                $this->ajaxReturn(2);
            }
            
            $result = $model->add($data);

            if($result != 'false'){
                $awardAll = $this->getAwardAll();
                $this->ajaxReturn($awardAll);
            }else{
                $this->ajaxReturn(0);
            }
            
        }else{
            header("Content-type: text/html; charset=utf-8");
            die("非法请求");
        }
    }
    /**
     * 获取奖项内容
     */
    public function getAwardAll() {
        $model = D('Awards');
        $data = $model->where("aw_count < aw_time")->select();
        
        return $data;
    }
    /**
     * 获取指定的奖项内容
     * @param type $id
     */
    public function getAwards($id) {
        return M('Awards')->find($id);
    }
    
}
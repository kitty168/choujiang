<?php
namespace Home\Controller;
use Think\Controller;
/**
 * 抽奖处理类
 */
class ApiController extends Controller {

    private $actions = ['str2xml'];

    public function index(){
        $action = I('get.action','');
        if(!in_array($action, $this->actions)) {
            $res['code'] = '300';
            $res['message'] = '非法请求';
            return $this->ajaxReturn($res);
        }
        $contents = file_get_contents("php://input");
        $data = json_decode($contents, true);
        $str = $this->$action(base64_decode($data['xml']));

        $res['code'] = 200;
        $res['msg'] = 'success';
        $res['xml'] = $str;
        echo json_encode($res,JSON_UNESCAPED_UNICODE);
    }
    
    private function str2xml($xml_str){
        $simpleXml = new \SimpleXMLElement($xml_str);
        $dom = new \DOMDocument('1.0', 'UTF-8');
        $dom->preserveWhiteSpace = false;
        $dom->formatOutput = true;
        $dom->loadXML($simpleXml->asXML());
        $xml_str = $dom->saveXML($dom->documentElement);
        $xml_doc = '<?xml version="1.0" encoding="UTF-8"?>'."\r\n";
	   return base64_encode($xml_doc.$xml_str);
    }
} 

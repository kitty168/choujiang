<?php

function p($arr) {
    header("Content-type: text/html; charset=utf-8");
    echo "<pre>";
    print_r($arr);
    echo "</pre>";
}

/**
 * 发送邮件
 * @param type $Account
 * @param type $password
 * @param type $subject
 * @param type $toAddress
 * @param type $content
 * @param type $attachs
 * @param type $sendName
 * @return int
 */
function send_mail($Account,$password,$subject,$toAddress,$content,$attachs,$sendName='') {
    
    $mail = new PHPMailer; //实例化 
    $mail->SetLanguage('zh_cn');
    $mail->IsSMTP(); // 启用SMTP 
    $mail->IsHTML(true);
    $mail->Host = "smtp.kuaidi.hk"; //SMTP服务器 以163邮箱为例子 
    $mail->Port = 25;  //邮件发送端口 
    $mail->SMTPAuth   = true;  //启用SMTP认证 

    $mail->CharSet  = "UTF-8"; //字符集 
    $mail->Encoding = "base64"; //编码方式 

    $mail->Username = $Account;  //你的邮箱 
    $mail->Password = $password;  //你的密码 
    $mail->Subject = $subject; //邮件标题 

    $mail->From = $Account;  //发件人地址（也就是你的邮箱） 
    $mail->addReplyTo($Account);
    $mail->FromName = $sendName;  //发件人姓名 
    
    if(is_array($attachs) || !empty($attachs) || isset($attachs['path']) || $attachs['fileName']) {
        $mail->AddAttachment('./Public/Uploads/'.$attachs['path'], $attachs['fileName']);
    }

//    $mail->AddAttachment('1.xlsx','销售报告.xlsx'); // 添加附件,并指定名称 
    $mail->IsHTML(true); //支持html格式内容 

    $content = str_replace('src="', 'src="http://www.51netlife.cn:81', $content);
    $mail->Body = $content."<br><br>Send Time：".  date('Y-m-d H:i:s', time()); //邮件主体内容 

    $mail->AddAddress($toAddress);
    
    //发送 
    if(!$mail->Send()) { 
//        die;
      return $mail->ErrorInfo; 
    } else { 
      return 1; 
    } 
}


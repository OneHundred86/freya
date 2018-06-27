<?php

namespace Lib;

use Lib\Core\Log;

class Mail{

	// $toEmails : string | [string()]
	    # => false | int() 成功发送的邮件数量
	    public static function send($toEmails, $title, $body){
	        try {
	            $admin_mail = "vanchen1@126.com";
	            $password = "vanchen123456";
	            $smtp_server = "smtp.126.com";
	            $port = 25;
	            $admin_name = "test发件人";
	            $ssl = null;
	            $transport = \Swift_SmtpTransport::newInstance($smtp_server, $port, $ssl)
	            ->setUsername($admin_mail)
	            ->setPassword($password);
	            $mailer = \Swift_Mailer::newInstance($transport);
	            $message = \Swift_Message::newInstance();
	            $message->setContentType('text/plain');
	            $message->setSubject($title)
	            ->setBody(
	            $body
	            );
	            $message->setTo($toEmails);
	            $message->setFrom(array($admin_mail => $admin_name));
	            $mailer->protocol='smtp';
	            $result = $mailer->send($message);

	            return $result; 
	        } catch (\Exception $e) {
	            Log::error("发送邮件错误", $e->getMessage());
	            return false;
	        }
	    }
}

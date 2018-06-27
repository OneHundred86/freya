<?php

namespace Lib;

use Lib\Core\Log;
use Lib\Core\Net;

class Sms{
    private static $apikey = 'b2f3c801173ff222f295e349aa13cf3a';

    // 发送验证码
    // => 1成功，2获取验证码过于频繁，3发送验证码失败
    public static function code($phone){
        $now = time();
//        if(!empty($_SESSION['sms_time']) && $now - $_SESSION['sms_time'] < 60){
//            return 2;
//        }
//
//        $code = self::gen_code();
//        $text = sprintf("【省府网】您的验证码是%s。如非本人操作，请忽略本短信", $code);
//        $data = [
//            'apikey'    => self::$apikey,
//            'mobile'    => $phone,
//            'text'      => $text,
//        ];
//
//        $json_data = Net::post('https://sms.yunpian.com/v2/sms/single_send.json', http_build_query($data));
//        $array = json_decode($json_data, true);
//
//        if($array['code'] != 0){
//            Log::debug('发送短信验证码错误', $array);
//            $_SESSION['sms_time'] = $now;
//            return 3;
//        }else{
            $_SESSION['sms_code'] = 1234;
            $_SESSION['sms_time'] = $now;
            // 记录获取验证码的手机号码
            $_SESSION['sms_phone_tmp'] = $phone;
            return 1;
//        }
    }

    // 校验验证码
    public static function check($phone, $code){
        if(empty($_SESSION['sms_code'])){
            return false;
        }elseif($_SESSION['sms_code'] != $code) {
            return false;
        }elseif($_SESSION['sms_phone_tmp'] != $phone){  // 手机号码不是获取验证码的号码
            return false;
        }

        // 记录验证通过的手机号码
        $_SESSION['sms_phone'] = $phone;
        return true;
    }

    // 使验证码无效
    public static function invalid(){
        unset($_SESSION['sms_code']);
    }

    // 获取验证码校验通过的手机号码
    public static function get_verified_phone(){
        if(empty($_SESSION['sms_phone'])){
            return false;
        }

        return $_SESSION['sms_phone'];
    }


    # 生成随机数
    public static function gen_code($len = 4){
        $s = '';
        for($i = 0; $i < $len; $i ++){
            $s .= self::gen_char();
        }
        return $s;
    }

    public static function gen_char(){
        $cs = ['0','1','2','3','4','5','6','7','8','9'];
        return $cs[rand(0, 9)];
    }


    // 通知留言受理
    public static function notice_letter_handled($mobile, $time){
        $date = date("Y年m月d日", $time);
        $text = sprintf("【省府网】您在%s的留言已受理。关注官方微信号：gdszfw，通过手机号码查询留言处理状态。", $date);
        $data = [
            'apikey'    => self::$apikey,
            'mobile'    => $mobile,
            'text'      => $text,
        ];
        
        $json_data = Net::post('https://sms.yunpian.com/v2/sms/single_send.json', http_build_query($data));
        $array = json_decode($json_data, true);

        if($array['code'] != 0){
            Log::debug('发送短信验证错误', $array);
            return false;
        }
        return true;
    }

    // 通知留言回复成功
    public static function notice_letter_audited($mobile, $time){
        $date = date("Y年m月d日", $time);
        $text = sprintf("【省府网】您在%s的留言已回复。关注官方微信号：gdszfw，通过手机号码查询回复内容。", $date);
        $data = [
            'apikey'    => self::$apikey,
            'mobile'    => $mobile,
            'text'      => $text,
        ];
        
        $json_data = Net::post('https://sms.yunpian.com/v2/sms/single_send.json', http_build_query($data));
        $array = json_decode($json_data, true);

        if($array['code'] != 0){
            Log::debug('发送短信验证错误', $array);
            return false;
        }
        return true;
    }



}
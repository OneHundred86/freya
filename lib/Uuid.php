<?php

namespace Lib;

class Uuid{
  // 唯一id的复杂程度
  const FLAG_SIMPLE = 1;
  const FLAG_COMPLEX = 2;

  // 生成唯一id
  # => string()
  public static function gen($flag = Uuid::FLAG_SIMPLE){
    if($flag == SELF::FLAG_SIMPLE){
      return self::rand_str();
    }elseif($flag == SELF::FLAG_COMPLEX){
      return self::gen_complex();
    }

    throw new \Exception("flag undefined", 1);
  }

  public static function rand_str($len = 32){
    $str = null;
    $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
    $max = strlen($strPol)-1;
    for($i = 0; $i < $len; $i++){
      $str .= $strPol[rand(0, $max)];
    }
    return $str;
  }

  public static function gen_complex() {
    return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        // 32 bits for "time_low"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),

        // 16 bits for "time_mid"
        mt_rand( 0, 0xffff ),

        // 16 bits for "time_hi_and_version",
        // four most significant bits holds version number 4
        mt_rand( 0, 0x0fff ) | 0x4000,

        // 16 bits, 8 bits for "clk_seq_hi_res",
        // 8 bits for "clk_seq_low",
        // two most significant bits holds zero and one for variant DCE1.1
        mt_rand( 0, 0x3fff ) | 0x8000,

        // 48 bits for "node"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
    );
  }
}

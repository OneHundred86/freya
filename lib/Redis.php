<?php


namespace Lib;


# 把Redis封装成单例

class Redis{

  public static $redis = false;

  public static function connect(){
    $redis = new \redis();
    if(!$redis->connect(REDIS_SVR, REDIS_PORT)){
      throw new \Exception("redis connect fail", 1);
    }
    $redis->select(REDIS_DB);

    self::$redis = $redis;
  }

  public static function getInstance(){
    if(!self::$redis){
      self::connect();
    }
    return self::$redis;
  }
}
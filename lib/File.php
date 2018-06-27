<?php
namespace Lib;

use Lib\Uuid;

class File{

  // 上传文件
  // allowExt = null | array()  允许上传文件的后缀名格式
  # => errno: int() | fileinfo: array('name', 'ext', 'size', 'type', 'path')
  public static function upload($fileKey, $storagePath = '.', $sizeLimit = null, $allowExt = null){
    if(empty($_FILES[$fileKey])){
      return -1;
    }

    $uploadFile = $_FILES[$fileKey];
    if($uploadFile['error'] > 0){
      return -2;
    }elseif($sizeLimit && $uploadFile['size'] > $sizeLimit){
      return -3;
    }

    $ext = self::get_ext($uploadFile['name']);
    if($allowExt){
      foreach($allowExt as &$v){
        $v = strtolower($v);
      }

      $ext_lower = strtolower($ext);
      if(!in_array($ext_lower, $allowExt))
        return -4;
    }

    if(substr($storagePath, -1) != '/'){
      $storagePath .= '/';
    }
    
    $storagePath = $storagePath.date('Ymd/');
    self::ensurePath($storagePath);
    $realFileName = $storagePath.Uuid::gen().'.'.$ext;

    if(!move_uploaded_file($uploadFile['tmp_name'], $realFileName)){
      return -5;
    }

    $uploadFile['path'] = $realFileName;
    $uploadFile['ext'] = $ext;
    return $uploadFile;
  }

  // 下载文件
  // $file：文件的相对路径或者绝对路径
  // $showFileName：浏览器下载的时候，显示的文件名
  public static function download($file, $showFileName = ""){
    $fileName = realpath($file);
    if(!file_exists($fileName)){
      return false;
    }

    if(!$showFileName){
      $showFileName = basename($fileName);
    }

    Header("Content-type: application/octet-stream");
    Header("Accept-Ranges: bytes");
    Header("Accept-Length: " .filesize($fileName));
    Header("Content-Disposition: attachment; filename=" .$showFileName);

    readfile($fileName);
    return true;
  }

  public static function ensurePath($pathname, $flag = 0777){
    if(file_exists($pathname)){
      return false;
    }elseif(!mkdir($pathname, $flag, true)){
      throw new \Exception("创建文件夹失败");
    }
  }

  public static function get_ext($fileName){
    $arr  = explode('.', $fileName);

    $nLen = count($arr);
    if($nLen <= 1){
      return "";
    }else{
      return $arr[$nLen-1];
    }
  }

}



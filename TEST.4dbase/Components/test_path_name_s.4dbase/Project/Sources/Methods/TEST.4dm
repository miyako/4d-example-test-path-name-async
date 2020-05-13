//%attributes = {"invisible":true,"preemptive":"capable"}
$path_manager:=path_manager   //singleton (component storage)

$path:=Structure file:C489

  //sync call
$returnValue:=$path_manager.test($path)

  //async call
$userInfo:=New object:C1471("path";$path)
$returnValue:=$path_manager.test($path;Formula:C1597(TEST_f );$userInfo)
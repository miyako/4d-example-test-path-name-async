//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$path)
C_OBJECT:C1216($2;$formula;$3;$this)
C_LONGINT:C283($0;$returnValue)

$path:=$1

$argc:=Count parameters:C259

ASSERT:C1129($argc#0)

If ($argc>1)
	$formula:=$2
End if 

If ($argc>2)
	$this:=$3
End if 

$returnValue:=-43  //not found

$signal:=New signal:C1641

$workerName:="test_path_name_p"+"@"+Generate UUID:C1066

CALL WORKER:C1389($workerName;"test_path_name_p";$signal;$path;$formula;$this)

C_LONGINT:C283($timeout)
$timeout:=60

$useFormula:=False:C215

If ($formula#Null:C1517)
	If (JSON Stringify:C1217($formula)="\"[object Formula]\"")
		$useFormula:=True:C214
	End if 
End if 

If ($useFormula)
	$returnValue:=-1  //indicate async call (deferred result)
Else 
	
	If ($signal.wait($timeout))
		$returnValue:=$signal.returnValue
	Else 
		  //default (-43)
	End if 
	
End if 

$0:=$returnValue
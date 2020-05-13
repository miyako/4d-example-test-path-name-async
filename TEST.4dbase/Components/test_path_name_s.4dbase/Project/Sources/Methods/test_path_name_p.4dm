//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$signal;$3;$formula;$4;$this)
C_TEXT:C284($2;$path)

$signal:=$1
$path:=$2
$formula:=$3
$this:=$4

$returnValue:=Test path name:C476($path)

$useFormula:=False:C215

If ($formula#Null:C1517)
	If (JSON Stringify:C1217($formula)="\"[object Formula]\"")
		$useFormula:=True:C214
	End if 
End if 

If (Not:C34(Process aborted:C672))
	
	If ($useFormula)
		$formula.call($this;$returnValue)
	Else 
		
		Use ($signal)
			$signal.returnValue:=$returnValue
		End use 
		
		$signal.trigger()
		
	End if 
	
End if 

KILL WORKER:C1390
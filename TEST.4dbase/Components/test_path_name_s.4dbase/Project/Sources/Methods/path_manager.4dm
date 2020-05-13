//%attributes = {"shared":true,"preemptive":"capable"}
C_OBJECT:C1216($0;$EXPORT)

If (Storage:C1525.EXPORT=Null:C1517)
	Use (Storage:C1525)
		$EXPORT:=New shared object:C1526
		Storage:C1525.EXPORT:=$EXPORT
	End use 
Else 
	$EXPORT:=Storage:C1525.EXPORT
End if 

$LAST_FORMULA_NAME:="test"

If ($EXPORT[$LAST_FORMULA_NAME]=Null:C1517)
	
	Use ($EXPORT)
		
		$EXPORT[$LAST_FORMULA_NAME]:=Formula:C1597(test_path_name )
		
	End use 
	
End if 

$0:=$EXPORT
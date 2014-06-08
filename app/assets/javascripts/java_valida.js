<!--
//BCI Fn


ie = (document.all)? true:false
n6 = (document.getElementById)? true:false

var keycode;
 		  

function enter_key_trap(e)
{
    var keyPressed;

    if (document.layers) {
        keyPressed = String.fromCharCode(e.which);
    } else if (document.all) {
        keyPressed = String.fromCharCode(window.event.keyCode);
    } else if (document.getElementById) {
        keyPressed = String.fromCharCode(e.keyCode);
    }

    if ((keyPressed == "\r" || keyPressed == "\n") && (submit_login())) {
        document.implogin.submit();
    }
}


function checkRutField(pin)
{
	var tmpstr = "";
	for ( i=0; i < pin.length ; i++ )
		if ( pin.charAt(i) != ' ' && pin.charAt(i) != '.' && pin.charAt(i) != '-' )
			tmpstr = tmpstr + pin.charAt(i);
	pin = tmpstr;
	largo = pin.length;
// [VARM+]
	tmpstr = "";
	for ( i=0; pin.charAt(i) == '0' ; i++ );
		for (; i < pin.length ; i++ )
			tmpstr = tmpstr + pin.charAt(i);
	pin = tmpstr;
	largo = pin.length;
// [VARM-]
	if ( largo < 2 )
	{
		alert("Debe ingresar el pin completo.");
		document.form1.rut.focus();
		document.form1.rut.select();
		return false;
	}
	for (i=0; i < largo ; i++ )
	{
		if ( pin.charAt(i) != "0" && pin.charAt(i) != "1" && pin.charAt(i) !="2" && pin.charAt(i) != "3" && pin.charAt(i) != "4" && pin.charAt(i) !="5" && pin.charAt(i) != "6" && pin.charAt(i) != "7" && pin.charAt(i) !="8" && pin.charAt(i) != "9" && pin.charAt(i) !="k" && pin.charAt(i) != "K" )
		{
			alert("El valor ingresado no corresponde a un R.U.T valido.");
			document.form1.rut.focus();
			document.form1.rut.select();
			return false;
		}
	}
	var invertido = "";
	for ( i=(largo-1),j=0; i>=0; i--,j++ )
		invertido = invertido + pin.charAt(i);
	var dpin = "";
	dpin = dpin + invertido.charAt(0);
	dpin = dpin + '-';
	cnt = 0;
	for ( i=1,j=2; i<largo; i++,j++ )
	{
		if ( cnt == 3 )
		{
			dpin = dpin + '.';
			j++;
			dpin = dpin + invertido.charAt(i);
			cnt = 1;
		}
		else
		{
			dpin = dpin + invertido.charAt(i);
			cnt++;
		}
	}
	invertido = "";
	for ( i=(dpin.length-1),j=0; i>=0; i--,j++ )
		invertido = invertido + dpin.charAt(i);
	document.form1.rut.value = invertido;
	if ( checkDV(pin) )
		return true;
	return false;
}

function checkDV( cpin )
{
	largo = cpin.length;
	if ( largo < 2 )
	{
		alert("Debe ingresar el rut completo.");
		document.form1.rut.focus();
		document.form1.rut.select();
		return false;
	}
	if ( largo > 2 )
		pin = cpin.substring(0, largo - 1);
	else
		pin = cpin.charAt(0);
	dv = cpin.charAt(largo-1);
	checkCDV( dv );
	if ( pin == null || dv == null )
		return 0;
	var dvr = '0';
	suma = 0;
	mul = 2;
	for (i= pin.length -1 ; i >= 0; i--)
	{
		suma = suma + pin.charAt(i) * mul;
		if (mul == 7)
			mul = 2;
		else
			mul++;
	}
	res = suma % 11;
	if (res==1)
		dvr = 'k';
	else if (res==0)
		dvr = '0';
	else
	{
		dvi = 11-res;
		dvr = dvi + "";
	}
	if ( dvr != dv.toLowerCase() )
	{
		alert("El rut es incorrecto.");
		document.form1.rut.focus();

		return false;
	}
		
	return true;
}
function checkCDV( dvr )
{
	dv = dvr + "";
	if ( dv != '0' && dv != '1' && dv != '2' && dv != '3' && dv != '4' && dv != '5' && dv != '6' && dv != '7' && dv != '8' && dv != '9' && dv != 'k'  && dv != 'K')
	{
		alert("Debe ingresar un digito verificador valido.");
		document.form1.rut.focus();
		document.form1.rut.select();
		return false;
	}
	return true;
}

function valida() {
	pin_val = document.form1.rut.value;
	if ( pin_val.length == 0 ) 
	{
		alert( "Ingrese su R.U.T.");
		document.form1.rut.focus();
		return;
	}
	if ( !checkRutField(document.form1.rut.value) )
	{	
		return;
	}
	var tmpstr = "";	
	for ( i=0; i < pin_val.length ; i++ )
		if ( pin_val.charAt(i) != ' ' && pin_val.charAt(i) != '.' && pin_val.charAt(i) != '-' )
			tmpstr = tmpstr + pin_val.charAt(i);
	pin_val = tmpstr;
	pin_valor = pin_val.substring(0,pin.length);

	document.form1.pin.value = pin_val.substring(0,pin.length);	
	document.form1.dv.value = pin_val.substring(pin.length,pin.length+1);
	//document.form1.rut.value = "";
	if(CheckFields(document.form1.clave.value))
	{document.form1.submit();}
	else
	{return;}
}

//end BCI Fn


function CheckFields(pw) {
  if ( pw == "" ) {
    alert("Por favor ingrese Clave");
    window.document.form1.clave.focus();
    return false;
    }
  return true;
}

function CheckRutDigito(pin, digito) {
  var dvr = '0'
  suma = 0
  mult = 2

  for ( i = pin.length - 1 ; i >= 0 ; i -- ) {
    suma = suma + pin.charAt(i) * mult
    if ( mult == 7 )
      mult = 2
    else
      mult ++
  }
  res = suma % 11
  if ( res == 1 )
    dvr = 'k'
  else {
    if ( res == 0 )
      dvr = '0'
    else {
      dvi = 11 - res
      dvr = dvi + ""
    }
  }
  if ( dvr != digito.toLowerCase() )
    return false;
  return true;
}


function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}



function keyDown(e) {
	
	if(ie){
	keycode = event.keyCode
	if(keycode == "13"){
	valida();
		//document.forms.fmr1.but_hidden.value = document.forms.fmr1.buscar.value
		//document.forms.fmr1.submit();
		}
	}else if(n6){
		keycode = e.which;
		if(keycode == "13"){
		valida();
		//document.forms.fmr1.but_hidden.value = document.forms.fmr1.buscar.value
		//document.forms.fmr1.submit();
		}
	
	}
		
}

document.onkeydown = keyDown;



//-->

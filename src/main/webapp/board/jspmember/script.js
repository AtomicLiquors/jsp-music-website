/*
 * 
 */
 
 function inputCheck(){
	f=document.regFrm;
    alert(f.id.value	); /*idâ�� �Է��� �� �����ϴ��� Ȯ�� �ϴ°�*/
	
	if(f.id.value==""){
		alert("���̵� �����̳׿�");
		f.id.focus();
		return;
	}
	if(f.pwd.value==""){
		alert("��й�ȣ�� �����̳׿�");
		f.pwd.focus();
		return;
}
 if(f.repwd.value==""){
		alert("����ٽ� Ȯ���ϼ�!!");
		f.repwd.focus();
		return;
		}
		
	if(f.pwd.value!=f.repwd.value){
		alert("�����ġ �ȳ׿�!!");
		f.repwd.value="";
		f.repwd.focus();
		return;
	}	
	
		if(f.name.value==""){
		alert("�̸��� �Է��� �ּ���.");
		f.name.focus();
		return;
	}
	if(f.birthday.value==""){
		alert("��������� �Է��� �ּ���.");
		f.birthday.focus();
		return;
	}
	if(f.email.value==""){
		alert("�̸����� �Է��� �ּ���.");
		f.email.focus();
		return;
	}
var str= f.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail�ּ� ������ �߸��Ǿ����ϴ�.\n\r�ٽ� �Է��� �ּ���!');
	      f.email.focus();
		  return;
    }	
	
		if(f.zipcode.value==""){
		alert("���ݹ�ȣ�� �Է��� �ּ���.");
		f.zipcode.focus();
		return;
			}
			
		if(f.job.value==""){
		alert("������ ������ �ּ���.");
		f.job.focus();
		return;
			}
			
			
			f.submit();
 }
 
 
 
 
 
 
 
 
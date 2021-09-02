<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
let nowDate = new Date();

//���� ������ ����ؾ��Ѵ�.
let year = nowDate.getFullYear();
let lastDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
let month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

//�Ʒ��� ���ǹ��� ������ ����ϴ� ����̴�.
if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
  lastDay[1] = 29;
} else {
  lastDay[1] = 28;
}

//�̹����� ���ؾ��Ѵ�. ���� -1�� �����µ� 0���� �����ϱ� �����̴�.
let thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth()).getMonth();
//�׸��� �������� ������ ���� �ε����� ������ �����Ѵ�.
let prevMonthDay = new Date(nowDate.getFullYear(), thisMonth).getDay();

let thisDate = month[thisMonth];
let date = lastDay[thisMonth];

//*���� �޷� ����� �ڵ�
//���ڿ��� ��ũ���� �����Ѵ�.
//���ڿ� ��ü�� �ݺ����� �̿��� ����� �ش�. 
let tag = "<tr>";

if(nextData===this.$proA.innerHTML){
  let count = 0;
  //�������� ������ ���� �ε������� ��迭�� �ݺ��� ����
  for (let j = 0; j < thisMonthDay; j++) {
      tag += `<td></td>`;
      count++;
  }
  
  //�������� ������ ���� ���ĺ��� �̹����� �������ϱ��� �ݺ�
  for (let i = 1; i <= date; i++) {
  	//7�Ͼ� tr�� ����
      if (count % 7 === 0) {
          tag += "<tr>";

      }
      //������ ���� ���� ����. ���� classname�� �ο�. count����
      if(((thisDate==="Jan"&& i===1)||(thisDate==="Feb"&& (i===11||i===12||i===13))||(thisDate==="Mar"&& i===1)||(thisDate==="May"&& (i===5||i===19))||(thisDate==="Aug"&& (i===20||i===21||i===22)))||(count % 7 === 0||count % 7 === 6)){
          tag += `<td class="xday"><p>${i}</p></td>`;
          count++;
      }else if(count%7===2||count%7===4){
          tag += `<td class="Ahalf"><p>${i}</p></td>`;
          count++;
      }
      else{
          tag += `<td class="pickday"><p>${i}</p></td>`;
          count++;
      }
      //7���� ������ tr�±� �ݱ�
      if (count % 7 === 0) {
          tag += "</tr>";
          }

  }

}
this.$info.innerHTML =""
	this.$defaultDay.classList.add('show')

	//�ش� ���� 1���� ���� �迭�� ����
	const arr = [this.$defaultDay];

	//pickDay�� �ش��ϴ� ��Ҹ� querySelectAll�� ���� ��� �����ͼ� �ݺ����� ������.
	for(let j = 0; j<this.$pickDay.length; j++){
	    this.$pickDay[j].addEventListener('click',(e)=>{ 
	    	//Ŭ�������� �ʿ��� �ȳ����� �߰��ϰ�, clssname�� �����Ѵ�
	        this.$info.innerHTML="����/���� ��� �����մϴ�."
	        this.$defaultDay.classList.remove('show')
	        this.$pickDay[j].classList.add('show');
	        //Ŭ���� �ش� �ϸ� show�� �ٰ� Ŭ���Ҷ����� ���� ��Ҵ� show�� remove ��Ų��
	        arr.push(this.$pickDay[j])
	        if(arr[arr.length-2]!==this.$pickDay[j]){
	            arr[arr.length-2].classList.remove('show')
	        }
	        this.Time.isAllDay($info.innerHTML)
	    })
	}

	for (let k = 0; k<this.$Ahalf.length; k++){
	    this.$Ahalf[k].addEventListener('click',(e) =>{
	        this.$defaultDay.classList.remove('show')
	        this.$Ahalf[k].classList.add('show')
	        arr.push(this.$Ahalf[k])
	        if(arr[arr.length-2]!==this.$Ahalf[k]){
	            arr[arr.length-2].classList.remove('show')
	        }
	        if(nextData===this.$proA.innerHTML){
	            this.$info.innerHTML="������ �����մϴ�."
	            this.Time.isAfterDay($info.innerHTML)
	        }else if(nextData===this.$proB.innerHTML){
	            this.$info.innerHTML="���ĸ� �����մϴ�."
	            this.Time.isBeforeDay($info.innerHTML)
	        }else if (nextData===this.$proC.innerHTML){
	            this.$info.innerHTML="������ �����մϴ�."
	            this.Time.isAfterDay($info.innerHTML)
	        }

	    })
	}
	//�������̳� �ָ��� �ƹ��� ȿ���� ������ �Ѵ�
	for (let y = 0; y<this.$xday.length; y++){
	    this.$xday[y].addEventListener('click', (e) =>{
	        this.$info.innerHTML=""
	    })
	}
</script>
</body>
</html>
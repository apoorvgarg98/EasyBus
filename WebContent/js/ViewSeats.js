function box(n){
		var mid,i,f=0;
		if(n%2==0){
			   mid=2;
			}
		else{
			   mid=1;
			}
		if(n%4==3)
			{
			   f=2;
			   n++;
			}
		  for(i=1;i<n/2;i+=2)
			  create(i);
		  nextLine();
		  for(i=2;i<=n/2;i+=2)
		      create(i);
		  nextLine();
		  i-=1;
		  if(n%4!=0)
		  {
			  f=1;
			  n-=mid;
		  }


		  var j=(n/2)+mid;
		  for(;i<=j;i++)
			  {
			     create(i);
			     nextLine();  
			  }
		  if(f==2)
		  {
		    n-=2;
		  }
		  if(f==0)
			  n-=mid;
		  for(i=n+mid-1;i>=j+1;i-=2)
			  {
			      create(i);
			  }
		      nextLine();
		  for(i=n+mid;i>=j+2;i-=2)
			  create(i);
		}
function nextLine()
		  {
			  ele=document.createElement("br");
			     var form=document.getElementById("box");
				 form.appendChild(ele);  
		  }
		  
		  
		  function create(i){
			  ele=document.createElement("div");
			  var str="seat";
			  if(i<10)
			    str+="0"+i;
			  else
			    str+=i;
			  ele.setAttribute("id",str);
			  ele.setAttribute("class","seats");
			  ele.onclick=function(){
                            select(this.id);
                       };
			  ele.innerHTML=i;
			  var form=document.getElementById("box");
			  form.appendChild(ele);
			  
		  }

function select(id){
				 var btn=document.getElementById(id).classList;
				 btn.toggle('selected');
				 if(btn.contains('selected'))
				 {
					 if(noSeats>=5)
					 {
						 btn.toggle('selected');
						 window.alert("Limit of 5 seats have been exceeded");
				     }
					 else {
						 if(noSeats==0)
					     {					 
				             var seat=document.createElement("input");
					         seat.setAttribute("id","noSeats");
						     seat.setAttribute("type","hidden");
					         seat.setAttribute("name","seat");
					         seat.setAttribute("value",id.substr(4,2)); 
				             document.getElementById("pass-form").appendChild(seat);
							 
							 var sbm=document.createElement("button");
					         sbm.innerHTML="Book Seats";
							 sbm.setAttribute("type","button");
							 sbm.onclick=function(){
								 document.getElementById('pass-form').style.display='block';
								 passForm();
							 };
							 sbm.setAttribute("id","submit");
							 sbm.setAttribute("class","book btn");
							 document.getElementById("btn-div").appendChild(sbm);
					     }
					     else
					     {
						     var seat=document.getElementById("noSeats");
						     var value=seat.getAttribute("value");
						     value+="&"+id.substr(4,2);
					         seat.setAttribute("value",value); 
				         }
						 noSeats++;
					 }
			    }
				else{ 
					     var seat=document.getElementById("noSeats");
						 var value=seat.getAttribute("value");
						
						 if(noSeats==1)
						    {
								seat.parentNode.removeChild(seat);
							    var sbm=document.getElementById("submit");
								sbm.parentNode.removeChild(sbm);
							}
						 else 
						 {  
						    var pos=value.indexOf(id.substr(4,2));
							if(pos==0)
						       value=value.replace(id.substr(4,2)+"&","");
						    else
							   value=value.replace("&"+id.substr(4,2),"");	
						    seat.setAttribute("value",value);	
						 }
  					noSeats--;
			    }
					 
			  }

function passForm(){
   var doc=document.getElementById("pass-detail");
	    for(var i=0;i<noSeats;i++)
		{
			var lab=document.createElement("label");
			   if(i==0)
			     lab.innerHTML="Primary Passenger";
			   else
			     lab.innerHTML="Co-Passenger "+i;
			var name=document.createElement("input");		
				name.setAttribute("type","text");
				name.setAttribute("class","text");
				name.setAttribute("name","name"+i);
				name.setAttribute("placeholder","Enter Name");
			var age=document.createElement("input");
                age.setAttribute("type","number");
                age.setAttribute("class","text");
                age.setAttribute("name","age"+i);
				age.setAttribute("placeholder","Enter Age");

            doc.appendChild(document.createElement("br"));
			doc.appendChild(lab);
			doc.appendChild(document.createElement("br"));
			doc.appendChild(name);
			doc.appendChild(document.createElement("br"));
			doc.appendChild(age);
			doc.appendChild(document.createElement("br"));
		}
		doc.appendChild(document.createElement("br"));
	  var sbmt=document.createElement("input");
	 sbmt.setAttribute("type","submit");
	 sbmt.setAttribute("class","book btn");
	  sbmt.setAttribute("value","Proceed to Pay");
	  doc.appendChild(sbmt);	
	  
	  var seat=document.createElement("input");
	  seat.setAttribute("type","hidden") ;
	  seat.setAttribute("name","noSeats");
	  seat.setAttribute("value",noSeats);
	  doc.appendChild(seat);
	  	}			  
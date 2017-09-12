function plusSlides(n){
  var slides=document.getElementsByClassName("mySlides");
  for(var i=0;i<slides.length;i++)
     slides[i].style.display="none";
	index+=n;
    if(index>slides.length){index=1;}	
	if(index<1){index=slides.length;}
	slides[index-1].style.display="block";
  }
  
  function showslides(){
  var slides=document.getElementsByClassName("mySlides");
  for(var i=0;i<slides.length;i++)
     slides[i].style.display="none";
  index++;
  if(index>slides.length){ index=1;}
  slides[index-1].style.display="block";
  setTimeout(showslides,3000);  
  }	
  
  function display(){
	  var ele=document.getElementById('sch-form').classList;
		   ele.toggle('sch-display');
  }
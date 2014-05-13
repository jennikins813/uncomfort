$(document).ready(function() 
{    $("#results").click(function() {                

if (!$("input[@name=q1]:checked").val() ||            
	!$("input[@name=q2]:checked").val() ||            
	!$("input[@name=q3]:checked").val() ||            
	!$("input[@name=q4]:checked").val() ||            
	!$("input[@name=q5]:checked").val() ||            
	!$("input[@name=q6]:checked").val() ||            
	!$("input[@name=q7]:checked").val() ||            
	!$("input[@name=q8]:checked").val() ||            
	!$("input[@name=q9]:checked").val() ||            
	!$("input[@name=q10]:checked").val()            
) {            
alert("You're not done yet!");        
});  
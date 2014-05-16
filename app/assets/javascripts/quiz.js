 $(document).ready(function() {      
 answers = new Object();
 $('.answers').change(function(){
   var answer = ($(this).attr('value'))
   var question = ($(this).attr('name'))
   answers[question] = answer
 })

var item1 = document.getElementById('question');

var totalQuestions = $('.question').size(15);
var currentQuestion = 0;
$questions = $('.question');
$questions.hide();
$($questions.get(currentQuestion)).fadeIn();
$('#next').click(function(){
    $($questions.get(currentQuestion)).fadeOut(function(){
        currentQuestion = currentQuestion + 1;
        if(currentQuestion == totalQuestions){
               var result = sum_values()
              

               //do stuff with the result
               return result;
        }else{
        $($questions.get(currentQuestion)).fadeIn();
        }
    });

 });
});  
$('.question').each(function(){
 var totalPoints = 0;
 $(this).find('input').each(function (){
  totalPoints += $(this).val();
});
alert(totalPoints);
});




  //var fid, elem;

    //fid = 'fruit'+i;
    //elem = document.getElementById(fid);
    //if (elem.checked == true) { sum += Number(elem.value); }
  
  //document.getElementById('totalcost').value = sum.toFixed(2)*1.05;
  //alert("Your Total Is:" + totalcost.value);
 





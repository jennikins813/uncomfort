$(document).ready(function () {

  $('#results').hide();
  


  answers = new Object();
  $('.answers').change(function () {
    var answer = ($(this).attr('value'));
    var question = ($(this).attr('name'));
    answers[question] = answer;
});

  var totalQuestions = $('.question').size();
  var currentQuestion = 0;
  $questions = $('.question');
  $questions.hide();
  $($questions.get(currentQuestion)).fadeIn();

  function sum_values() {
    var the_sum = 0;
    for (question in answers) {
        the_sum = the_sum + parseInt(answers[question]);
    }
    return the_sum;
}

$('#next').click(function () {
    $($questions.get(currentQuestion)).fadeOut(function () {
        currentQuestion = currentQuestion + 1;
        if (currentQuestion === totalQuestions ) {
            var result = sum_values();
            $('#result_score').val(result);
            $('#results').show() && $('#next').hide();  

        } else {
            $($questions.get(currentQuestion)).fadeIn();
            
        }
    });

    
});

});
$(document).ready(function () {

  $('#results').hide();
  


  answers = new Object();
  $('.answers').change(function () {
    var answer = ($(this).attr('value'));
    var question = ($(this).attr('name'));
    answers[question] = answer;
});

  emotional = new Object();
  $('.answers').change(function () {
    var e_a = ($(this).attr('value'));
    var e_q = ($('.emotional').attr('class'));
    emotional[e_q] = e_a;
});

  physical = new Object();
  $('.answers').change(function () {
    var p_a = ($(this).attr('value'));
    var p_q = ($('.physical').attr('class'));
    physical[p_q] = p_a;
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

  function emotional_sum_values() {
    var emotional_sum = 0;
    for (e_q in emotional) {
        emotional_sum = emotional_sum + parseInt(emotional[e_q]);
    }
    return emotional_sum;
}

  function physical_sum_values() {
    var physical_sum = 0;
    for (p_q in physical) {
        physical_sum = physical_sum + parseInt(physical[p_q]);
    }
    return physical_sum;
}

$('#next').click(function () {
    $($questions.get(currentQuestion)).fadeOut(function () {
        currentQuestion = currentQuestion + 1;
        if (currentQuestion === totalQuestions ) {
            var result = sum_values();
            var emotional_result = emotional_sum_values();
            var physical_result = physical_sum_values();
            $('#result_score').val(result);
            $('#result_emotional_result').val(emotional_result);
            $('#result_physical_result').val(physical_result);
            $('#results').show() && $('#next').hide();  

        } else {
            $($questions.get(currentQuestion)).fadeIn();
            
        }
    });

    
});

});
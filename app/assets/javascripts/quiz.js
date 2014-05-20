$(document).ready(function () {
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
            if (currentQuestion === totalQuestions) {
                var result = sum_values();
                //alert(result);
                // window.location.assign('/results/show')
                $.ajax({
                    url: '/results',
                    data: {result: {score: result}}
                    dataType: "html",
                    method: "POST",
                })
            } else {
                $($questions.get(currentQuestion)).fadeIn();
            }
        });
    });
});


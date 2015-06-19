$(document).ready(function() {
  createSurveyListener();
  createQuestionListener();
  createDoneListener();
  answerButtonListener();
  $('.form:nth-child(1)').removeClass('inactive')
});

var counter = 1
var answerButtonListener = function() {
  $('.answer_submit').on("click", function(event){
    event.preventDefault();

    var end = $('#array_length').val()

    $('.form:nth-child('+counter+')').addClass('inactive')
    counter++
    $('.form:nth-child('+counter+')').removeClass('inactive')

    if(counter > end){
      $('.finished').removeClass('inactive');
    };

    var item = $('form').serialize();
    console.log(item)
    $.ajax({
      url: $('form').attr("action"),
      method: "POST",
      data: {content: item},
      dataType: 'JSON'

    }).done(function(data){
      console.log(data)
    })
  })
}


var createSurveyListener = function() {
  $('#title').submit(function(event) {
    event.preventDefault();
    console.log('button pressed')

    var route = $('form').attr('action')
    var data = $('#title').serialize()
    var request = $.ajax({
      url: route,
      type: 'POST',
      data: data
    })

    request.done(function(response) {
      console.log("SUCCESS :D");
      console.log(response)

      $('.survey_form').append(response);
      $('.survey_title').remove();

    })

    request.fail(function(response) {
      console.log("FAIL :(");
      console.log(response)
    })

  })
}

var sendQuestionData = function () {
  var route = $('form').attr('action')
  var data = $('#question').serialize()
  var request = $.ajax({
    url: route,
    type: 'POST',
    data: data
  })

  request.done(function(response) {
    console.log("SUCCESS :D");
    console.log(response)

    $('#question input:text').val('')
    // $('#form-container').remove();
    // $('.survey_form').append(response);
  })

  request.fail(function(response) {
    console.log("FAIL :(");
    console.log(response)
  });

  return request;
};

var createQuestionListener = function() {
  $('.survey_form').on('click', '#add_new_question_BTN', function(event) {
    event.preventDefault();
    sendQuestionData().done(function () {
      console.log('did the question ajax stuff thingy')
    });
  });
}

var createDoneListener = function() {
  $('.form-container').on('click', '#question_submit_done_BTN', function(event) {
    event.preventDefault();
    sendQuestionData().done(function(){
      location.assign('/');
    });

  })
}
  //   var route = $('form').attr('action')
  //   var data = $('#question').serialize()

  //   var request = $.ajax({
  //     url: route,
  //     type: 'POST',
  //     data: data
  //   })

  //   request.done(function(response) {
  //     console.log("SUCCESS :D");
  //     console.log(response)

  //     // $('#question').remove();
  //     // $('.survey_form').append(response);
  //   })

  //   request.fail(function(response) {
  //     console.log("FAIL :(");
  //     console.log(response)
  //   })

  // })
// }



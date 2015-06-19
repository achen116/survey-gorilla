$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  createSurveyListener();
});

var createSurveyListener = function() {
  $('#title').submit(function(event) {
    event.preventDefault();

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

$(document).ready(function() {
  $('.answer_submit').on("click", function(event){
    event.preventDefault();

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

});

$(function(){
  $('#send_message').click(sendMessage);
});

function sendMessage() {
  var id = $('input[name=delivery]:checked').val()

  var message = $('#message').val();
  var address = $('#email').val();
  var twitter = $('#handle').val();
  var phone = $('#usrtel').val();

  if (id === "text") {
    $.ajax({
    type: "POST",
    url: "http://44h6.localtunnel.com/text",
    data: { to: phone, message: message }
  })
  };
  if (id === "twitter") {
    $.ajax({
    type: "POST",
    url: "http://44h6.localtunnel.com/twitter",
    data: { to: twitter, message: message }
  })

  };
  if (id === "email") {
    $.ajax({
    type: "POST",
    url: "http://44h6.localtunnel.com/email",
    data: { to: address, message: message }
  })
  };
  
}

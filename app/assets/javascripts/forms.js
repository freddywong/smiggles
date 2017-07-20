document.addEventListener("turbolinks:load", function() { 
  $("#logout").on("ajax:success", function(e, data, status, xhr) {
    return Turbolinks.visit("/")
  }).on("ajax:error", function(e, xhr, status, error) {
    return $("#logout").append("<p>ERROR</p>");
  });
})



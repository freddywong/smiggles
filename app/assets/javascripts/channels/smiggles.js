//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();  

App.smiggles = App.cable.subscriptions.create('SmigglesChannel', {  

  received: function(data) {
    $("#face").attr("src", data.default_face);
  }
});
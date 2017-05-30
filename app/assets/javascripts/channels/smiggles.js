//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();  

App.smiggles = App.cable.subscriptions.create('SmigglesChannel', {  

  received: function(data) {
    $(".smiggle").children().hide();
    $("#" + data.default_face).show();

    updateFoodProgress(data.food, foodProgress)
  }
});
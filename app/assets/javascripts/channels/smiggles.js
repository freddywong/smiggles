//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();  

App.smiggles = App.cable.subscriptions.create('SmigglesChannel', {  

  received: function(data) {

    $(".smiggle").children().hide();
    var face = $("#" + data.default_face)
    face.show().addClass('center');
    
    updateProgress(data.food, foodProgress)
    updateProgress(data.drink, drinkProgress)
    updateProgress(data.boredom, boredomProgress)
    updateProgress(data.happiness, happinessProgress)
  }
});
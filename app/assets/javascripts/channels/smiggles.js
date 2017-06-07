//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();  

App.smiggles = App.cable.subscriptions.create('SmigglesChannel', {  

  received: function(data) {

    $(".smiggle").children().hide();
    if(data.reaction.face) {
      showReactionFace(data.reaction.face, data.default_face)
    } else {
      showUpdatedFace(data.default_face)
    }

    updateProgress(data.food, foodProgress)
    updateProgress(data.drink, drinkProgress)
    updateProgress(data.happiness, happinessProgress)
    updateProgress(data.life, lifeProgress)

    showTrashCan(data.waste)
  }
});
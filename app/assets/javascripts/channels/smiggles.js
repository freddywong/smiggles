//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();  

App.smiggles = App.cable.subscriptions.create('SmigglesChannel', {  

  received: function(data) {

    $(".smiggle").children().hide();
    if(data.reaction && data.reaction.face) {
      showReactionFace(data.reaction.face, data.default_face)
    } else {
      showUpdatedFace(data.default_face)
    }

    updateProgressBar(data.food, foodProgress)
    updateProgressBar(data.drink, drinkProgress)
    updateProgressBar(data.happiness, happinessProgress)
    updateProgressBar(data.life, lifeProgress)

    clearWaste();
    showRestartButton(data.life);
    showWaste(data.waste, $('#life-progress').data('waste-image-path'));
    showTrashCan(data.waste, data.life);
  }
});
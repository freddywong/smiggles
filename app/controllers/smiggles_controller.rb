class SmigglesController < ApplicationController
  def show
    @smiggle = Smiggle.first.decorate
  end
end
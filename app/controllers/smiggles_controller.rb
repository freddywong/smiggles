class SmigglesController < ApplicationController
  def show
    @smiggle = Smiggle.first.attributes
  end
end
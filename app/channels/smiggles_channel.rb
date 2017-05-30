class SmigglesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'smiggles'
  end
end  
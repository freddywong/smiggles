class UpdateSmigglesWorker
  include Sidekiq::Worker

  def perform(*args)
    Smiggle.all.each do |smiggle|
      if smiggle.life
        update_time = calculate_update_time(smiggle.life)
        AutoUpdateSmiggleService.delay_for(update_time.minutes).update_attributes smiggle.id
      end
    end
  end

  private

  def calculate_update_time life
    now = Time.zone.now
    minute = minute_of_hour(life.created_at) - minute_of_hour(now)
    puts minute_of_hour(life.created_at)
    minute < 0 ? 0 : minute
  end

  def minute_of_hour time
    time.strftime('%M').to_i
  end
end

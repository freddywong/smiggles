namespace :smiggles do
  desc "Schedules the updates on all Smiggles' attributes depending on when their life started"
  task schedule_smiggles_update: :environment do
    UpdateSmigglesWorker.perform_async
  end
end
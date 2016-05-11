# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :oscon do
  desc "Clear log files"
  task :clear do
    `rm #{Rails.root}/log/*.log`
  end

  desc "Analyze log/production.log"
  task :analyze do
    timings = []
    File.open("log/production.log") do |f|
      f.each_line do |l|
        if match = /Completed 200 OK in (\d*)ms/.match(l)
          timings << match[1].to_i
        end
      end
    end
    puts "Count: #{timings.number}"
    puts "Mean: #{timings.mean}"
    puts "Median: #{timings.median}"
    puts "Stdev: #{timings.standard_deviation}"
    puts "90 pct: #{timings.percentile(90)}"
    puts "95 pct: #{timings.percentile(95)}"
  end
end

# name: discourse-reading-time-report
# about: Adds a reading time report
# version: 0.1
# authors: Simon Cossar, Joffrey Jaffeux
# url: https://github.com/jjaffeux/discourse-reading-time-report

enabled_site_setting :discourse_reading_time_report_enabled

PLUGIN_NAME ||= 'discourse_reading_time_report'.freeze

after_initialize do
  add_report(:reading_time) do |report|
    basic_report_about report, UserVisit, :by_day, report.start_date, report.end_date, report.group_id
    add_counts report, UserVisit, 'visited_at'
  end
end

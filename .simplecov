require "simplecov-console"

running_full_suite = RSpec.configuration.files_to_run.size > 1 && !RSpec.configuration.only_failures
use_console_formatter = running_full_suite

coverage_for = ENV['COVERAGE_FOR']

formatters = [SimpleCov::Formatter::HTMLFormatter]
if use_console_formatter
  formatters << SimpleCov::Formatter::Console
end

SimpleCov.start 'rails' do
  coverage_dir 'tmp/coverage'

  formatter SimpleCov::Formatter::MultiFormatter.new(formatters)

  # refuse_coverage_drop if ENV['CI'].present?

  add_filter do |source_file|
    # TODO: Should the next line technically have a 'if coverage_for.present?' at the end?
    (source_file.filename =~ /#{coverage_for}/i).nil?
  end
end

SimpleCov.at_exit do
  SimpleCov.result.format!

  puts "To view detailed code coverage, run this: open tmp/coverage/index.html"
  if use_console_formatter
    if coverage_for != nil && coverage_for != ""
      puts "Reporting test coverage ONLY for files matching /#{coverage_for}/"
    end
  end
end

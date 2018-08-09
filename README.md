# SidekiqLogAnalyser

SidekiqLogAnalyser gem allows to see summary of your sidekiq workers (based on log file). 

Main reports (for the last 30 days):

- summary of all workers (worker -> count of runs)
- average time per worker (worker -> avg in seconds)
- summary for each worker groupped by hour (datetime -> count of runs + avg time)

## Sample
[![Sample](https://raw.githubusercontent.com/igorkasyanchuk/sidekiq_log_analyzer/master/docs/sidekiq_log_analyser.png)](https://raw.githubusercontent.com/igorkasyanchuk/sidekiq_log_analyzer/master/docs/sidekiq_log_analyser.png)

## Installation

Install it yourself as:

    $ gem install sidekiq_log_analyser

## Usage

Just run `sidekiq_log_analyser` in any folder and specify path to sidekiq.log file. 

By default it's `log/sidekiq.log` or you can do `sidekiq_log_analyser path/to/file.log`.

## TODO

- specify range for dates in report
- show crashes and maybe some other info
- export to HTML/JS/CSS format
- export to PDF

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sidekiq_log_analyser.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


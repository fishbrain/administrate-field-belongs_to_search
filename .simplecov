SimpleCov.start 'rails' do
  add_group 'app', 'app'
  add_group 'lib', 'lib'

  minimum_coverage 90
  refuse_coverage_drop

  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ])
end

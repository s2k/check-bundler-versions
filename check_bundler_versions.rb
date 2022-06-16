#! env ruby
# frozen_string_literal: true

if ARGV.size != 1
  puts 'Need a folder name with Ruby projects as the (only) argument'
  exit 1
end

dev_folder     = ARGV.first
search_pattern = File.join(dev_folder, '**', 'Gemfile.lock')
fns            = Dir[search_pattern]

def used_bundler_version_for(filename)
  File.read(filename).scan(/BUNDLED WITH\n\s*(.+)/).last.last
rescue StandardError
  'NONE???'
end

if fns.empty?
  puts 'No Gemfile.lock files found'
else

  fns.each do |fn|
    puts "#{fn}: -> Bundler version: #{used_bundler_version_for(fn)}"
  end
end

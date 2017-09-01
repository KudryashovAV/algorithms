require "optparse"
require "ostruct"

class MakeBranchName
  def self.run(options)
    puts options.name.downcase.gsub(" ", "-")
  end
end

def parse_options
  options = OpenStruct.new
  OptionParser.new do |opts|
    opts.on("--name [name]", String, "Branch name") do |name|
      options.name = name
    end

    opts.on("-h", "--help", "Show this message") do
      puts opts
      exit
    end
  end.parse!
  options
end

options = parse_options

MakeBranchName.run(options)

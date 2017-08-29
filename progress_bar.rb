class ProgressBar
  def self.run
    start_time = Time.now
    puts "Start at #{start_time.strftime("%a, %e %b %Y %H:%M:%S")}"
    collection = (1..100000000)
    amount = collection.size.to_f
    progress_count, progress = 0, "ᗧ" + "" * 91
    collection.each do |i|
      progress_count += 1
      percent = progress_count / amount * 100
      if percent % 1 == 0
        progress[-1] = ""
        progress.insert(0, ".")
        print "\r" + progress + " #{percent} %"
      end
    end
    finish_time = Time.now
    puts "\rDone in #{finish_time - start_time} seconds!" + " " * 100
    puts "Finish at #{finish_time.strftime("%a, %e %b %Y %H:%M:%S")}"
  end
end

ProgressBar.run

def greeting
    greeting = ARGV.shift #shift method rm 1st item and returns altered array
    ARGV.each do |name|
        puts "#{greeting} #{name}"
    end
end

greeting #calls the method

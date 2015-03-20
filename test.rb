require 'pry'

puts "Hello World"

# Rails' #silence_stream
def silence_stream(stream)
  old_stream = stream.dup
  stream.reopen(IO::NULL)
  stream.sync = true
  yield
ensure
  stream.reopen(old_stream)
  old_stream.close
end

silence_stream $stdout do
  binding.pry
  puts "End!"
end

puts "Done!"

require 'logger'
require 'json'

module LogForObject
  # When sync mode is true, all output is immediately flushed to the
  # underlying operating system and is not buffered by Ruby internally.
  # See also http://ruby-doc.org/core-2.2.2/IO.html#method-i-fsync
  #
  def structured_log_file
    @structured_log_file ||= File.new('/tmp/structured_log', 'a+').tap do |log_file|
      log_file.sync = true
    end
  end

  def write_log(payload)
    self.structured_log_file.puts payload
  end

  def log_wall(**args)
    now = Time.now
    json = {
      '@timestamp': now.utc.iso8601,
      '@fields': args
    }

    self.write_log json.to_json
  end
end

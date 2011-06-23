require 'em-synchrony'
begin
  require 'fraggle'
rescue LoadError => error
  raise 'Missing fraggle-synchrony dependency: gem install fraggle'
end

require 'fraggle-synchrony/fraggle'
require 'fraggle-synchrony/fraggle/client'


module Fraggle

  class << self
    alias :aconnect :connect
  end

  def self.connect(uri = nil)
    f = Fiber.current

    cb = proc { |client, err|
      f.resume client || err
    }
    self.aconnect(uri, &cb)

    response = Fiber.yield
    raise response if response.is_a?(StandardError)
    response
  end
end

module Fraggle

  class << self
    alias :aconnect :connect
  end

  def self.connect(uri = nil)
    f = Fiber.current

    cb = proc { |client, err|
      f.resume client
    }
    self.aconnect(uri, &cb)

    Fiber.yield
  end
end

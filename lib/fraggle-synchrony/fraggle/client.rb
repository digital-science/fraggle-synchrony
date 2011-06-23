module Fraggle
  class Client

    alias :aget :get
    alias :aset :set
    alias :arev :rev

    def set(rev, path, value)
      puts "Calling Fiber-aware set"
      f = Fiber.current
      cb = proc { |e, err|
        f.resume(e)
      }
      aset(rev, path, value, &cb)

      Fiber.yield
    end

    def get(rev, path)
      puts "Calling Fiber-aware get"
      f = Fiber.current
      cb = proc { |e, err|
        f.resume(e)
      }
      aget(rev, path, &cb)

      Fiber.yield
    end

    def rev
      puts "Calling Fiber-aware rev"
      f = Fiber.current
      cb = proc { |e, err|
        f.resume(e)
      }
      arev(&cb)

      Fiber.yield
    end
  end
end

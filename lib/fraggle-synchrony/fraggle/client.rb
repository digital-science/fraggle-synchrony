module Fraggle
  class Client

    %w{rev set get del stat getdir walk}.each do |cmd|
      class_eval <<-CODE
        alias :a#{cmd} :#{cmd}

        def #{cmd}(*args, &blk)
          f = Fiber.current
          blk = proc{ |v| v } if !block_given?
          cb = proc { |e, err|
            if err
              f.resume err
            else
              f.resume blk.call(e)
            end
          }
          a#{cmd}(*args, &cb)

          response = Fiber.yield
          raise response if response.is_a?(StandardError)
          response
        end
      CODE
    end

  end
end

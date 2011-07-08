module Fraggle
  class Client

    %w{rev set get del stat}.each do |cmd|
      class_eval <<-CODE
        alias :a#{cmd} :#{cmd}

        def #{cmd}(*args)
          f = Fiber.current
          cb = proc { |e, err|
            f.resume e || err
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

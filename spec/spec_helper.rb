$:.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'fraggle-synchrony'
require 'eventmachine'

class DoozerConnection < EM::Connection
  def receive_data(data)
    request = Fraggle::Request.decode(data)
    response = Fraggle::Response.new
    response.tag = request.tag
    __send__ :"__#{verb_to_s(request.verb)}__", request, response
  end
  def __ACCESS__(request, response)
    send_response(response)
  end
  def __REV__(request, response)
    response.rev = 2
    send_response(response)
  end
  def __SET__(request, response)
    response.rev = 4
    send_response(response)
  end
  def __GET__(request, response)
    response.rev = 6
    response.value = "VALUE"
    send_response(response)
  end
  def __DEL__(request, response)
    response.rev = 8
    send_response(response)
  end
  def send_response(response)
    data = response.encode
    head = [data.length].pack("N")
    send_data("#{head}#{data}")
  end
  def verb_to_s(verb)
    {
      1 => "GET",
      2 => "SET",
      3 => "DEL",
      5 => "REV",
      6 => "WAIT",
      7 => "NOP",
      9 => "WALK",
      14 => "GETDIR",
      16 => "STAT",
      99 => "ACCESS"
    }[verb]
  end
end

class BadDoozerConnection < DoozerConnection
  def __REV__(request, response)
    response.rev = 2
    response.err_code = Fraggle::Response::Err::OTHER
    send_response(response)
  end
  def __SET__(request, response)
    response.rev = 4
    response.err_code = Fraggle::Response::Err::OTHER
    send_response(response)
  end
  def __GET__(request, response)
    response.rev = 6
    response.err_code = Fraggle::Response::Err::OTHER
    send_response(response)
  end
  def __DEL__(request, response)
    response.rev = 8
    response.err_code = Fraggle::Response::Err::OTHER
    send_response(response)
  end
end


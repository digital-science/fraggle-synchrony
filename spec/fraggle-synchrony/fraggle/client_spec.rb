require 'spec_helper'

describe Fraggle::Client do

  it "should retrieve rev" do
    EM.synchrony {
      initialize_server(DoozerConnection)
      client = Fraggle.connect("doozer:?ca=127.0.0.1:9876")
      response = client.rev
      response.should == 2
      EM.stop
    }
  end

  it "should trap an error from rev" do
     EM.synchrony {
      initialize_server(BadDoozerConnection)
      client = Fraggle.connect("doozer:?ca=127.0.0.1:9876")
      expect {client.rev}.to raise_error(Fraggle::Connection::ResponseError)
      EM.stop
    }
  end

  it "should set a value" do
    EM.synchrony {
      initialize_server(DoozerConnection)
      client = Fraggle.connect("doozer:?ca=127.0.0.1:9876")
      response = client.set(3, "/path", "value")
      response.rev.should == 4
      EM.stop
    }
  end

  it "should get a value" do
    EM.synchrony {
      initialize_server(DoozerConnection)
      client = Fraggle.connect("doozer:?ca=127.0.0.1:9876")
      response = client.get(2, "/path")
      response.rev.should == 6
      EM.stop
    }
  end

  def initialize_server(connection_class)
    EM::start_server "127.0.0.1", 9876, connection_class
  end
end

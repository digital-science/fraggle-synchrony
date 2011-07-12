### Fraggle-synchrony

This is a Fiber-aware wrapper for the Fraggle EM library, which provides
an evented Ruby interface to [Doozer](https://github.com/ha/doozerd).

**NOTE:** This only runs on Ruby 1.9.2 due to the underlying use of Fibers.

Fraggle code can often become a bit of a spaghetti mess due to the
reliance on callbacks - wrapping with Synchrony allows you to replace:

    Fraggle.connect do |client|
      client.rev do |rev|
        client.get rev, "/path/to/thing" do |value|
          # do stuff with value
        end
      end
    end

with

    client = Fraggle.connect
    rev = client.rev
    value = client.get rev, "/path/to/thing"
    # do stuff with value

The full list of supported commands is: rev, set, get, del, stat

wait is not supported - just use the standard aynch callback mechanism
provided by Fraggle (a pseudo-blocking wait command makes no sense).

All using Fibers ensuring the code is still fully asynchronous. Pretty
awesome huh? (bear in mind 99% of the awesomeness is clearly due to Ilya
Grigorik and his wonderful [em-synchrony](https://github.com/igrigorik/em-synchrony), not me :)


h1. Fraggle-synchrony

This is a Fiber-aware wrapper for the Fraggle EM library, which provides
an evented Ruby interface to Doozer

Fraggle code can often become a bit of a spaghetti mess due to the
reliance on callbacks - wrapping with Synchrony allows you to replace:

code.
Fraggle.connect do |client|
  client.rev do |rev|
    client.get rev, "/path/to/thing"
  end
end

with

client = Fraggle.connect
rev = client.rev
client.get rev, "/path/to/thing"

All using Fibers ensuring the code is still fully asynchronous. Pretty
awesome huh? (bear in mind 99% of the awesomeness is clearly due to Ilya
Grigorik, not me :)

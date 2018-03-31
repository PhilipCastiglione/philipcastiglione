class CounterChannel < ApplicationCable::Channel
  def subscribed
    stream_for Counter.singleton
  end
end

# Actions relating to the counter singleton.
class CounterController < ApplicationController
  before_action :counter
  skip_before_action :verify_authenticity_token, only: [:increment]

  def index; end

  def increment
    if me?
      counter.increment
      CounterChannel.broadcast_to(counter, counter.count)
    end
  end

  private

  def counter
    @counter ||= Counter.singleton
  end

  def me?
    # TODO: check auth header/token
    true
  end
end

# Actions relating to the counter singleton.
class CounterController < ApplicationController
  before_action :get_counter
  skip_before_action :verify_authenticity_token, only: [:increment]

  def index; end

  def increment
    @counter.increment if me?
  end

  private

  def get_counter
    @counter = Counter.singleton
  end

  def me?
    # TODO: check auth header/token
    true
  end
end

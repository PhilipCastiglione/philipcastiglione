# Actions relating to the counter singleton.
class CounterController < ApplicationController
  before_action :get_counter

  def index; end

  def increment
    @counter.increment
  end

  private

  def get_counter
    @counter = Counter.singleton
  end
end

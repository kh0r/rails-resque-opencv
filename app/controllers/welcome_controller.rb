class WelcomeController < ApplicationController
  def index
    Resque.enqueue RawImageJob
  end
end

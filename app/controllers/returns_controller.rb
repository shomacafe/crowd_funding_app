class ReturnsController < ApplicationController
  def index
    @returns = Return.all
  end
end

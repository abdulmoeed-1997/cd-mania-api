class TestController < ApplicationController
  before_action :authenticate_user!
  def test_action
    render json: {
        messages: 'Sucessfully test passed'},status: :ok
  end
end

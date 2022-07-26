require 'rails_helper'

RSpec.describe "Homes", type: :request do
  it "200レスポンスを返すこと" do
    get homes_index_path
    expect(response).to have_http_status 200
  end
end

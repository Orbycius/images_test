require "spec_helper"

describe ImagesController do
  include RSpec::Rails::ControllerExampleGroup
  before :each do
    extend ActionDispatch::TestProcess
    @file = fixture_file_upload('/test.jpg', 'image/jpg')
    @path = File.join('public/img', 'my_test')
  end


  it 'should return 404' do
    get :show, {id: 'not_existing_image'}
    expect(response.status).to eq(404)
  end

  it 'should return 200' do
    post :create, {name: 'mytest', image: @file}
    expect(response.status).to eq(200)

    get :show, {id: 'mytest'}
    expect(response.status).to eq(200)
  end

end
require "spec_helper"

describe Image do

  before :each do
    extend ActionDispatch::TestProcess
    @file = fixture_file_upload('/test.jpg', 'image/jpg')
    @path = File.join('public/img', 'my_test')
  end

  it 'should create a new image' do
    Image.save_photo(@file, 'my_test').should == true
    File.exists?(@path).should == true
  end

  it 'should return 404' do
    get :show, {controller: 'pages', id: 'not_existing_page_321'}
    expect(response.status).to eq(404)
  end

end
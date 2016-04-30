require_relative '../index_page_generator'

RSpec.describe IndexPageGenerator do
  it 'is a class' do
    expect( IndexPageGenerator ).to be_a Class
  end

  name = "my website"
  
  it 'generates without css or js' do
    actual_output = IndexPageGenerator.new(name).generate
    expected_output = "<!DOCTYPE html><head></head><body><div id='title-block'><h1 id='title'>#{name}</h1></div></body>"
    expect( actual_output ).to eq expected_output
  end

  it 'generates with css and js' do
    actual_output = IndexPageGenerator.new(name, true, true).generate
    expect( actual_output ).to include "src='js/script.js'"
  end
end
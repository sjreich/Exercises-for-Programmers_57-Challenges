require_relative '../index_page_generator'

RSpec.describe IndexPageGenerator do
  let(:name) { "my website" }
  
  context 'no js or css demanded' do
    it 'generates the basic html' do
      actual_output = IndexPageGenerator.new(name).generate
      expected_output = "<!DOCTYPE html><head></head><body><div id='title-block'><h1 id='title'>#{name}</h1></div></body>"
      expect(actual_output).to eq expected_output
    end
  end

  context 'with js demanded' do
    it 'includes js' do
      actual_output = IndexPageGenerator.new(name, false, true).generate
      expect(actual_output).to include "<script type='text/javascript' src='js/script.js'></script>"
    end
  end

  context 'with css demanded' do
    it 'includes css' do
      actual_output = IndexPageGenerator.new(name, true, false).generate
      expect(actual_output).to include "<link rel='stylesheet' type='text/css' href='css/stylesheet.css'>"
    end
  end

end
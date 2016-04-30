require 'fileutils'
require_relative 'index_page_generator'

class WebsiteGenerator
  def run
    get_input
    make_directory(@dir_name)
    Dir.chdir(@dir_name)
    prep_index
    @user_wants_css ? prep_css : destroy_dir("css")
    @user_wants_js ? prep_js : destroy_dir("js")
  end

  def get_input
    print "What should the name of your website be? "
    @dir_name = gets.chomp
    @user_wants_css = yes? ("Do you want CSS? (y/n) ")
    @user_wants_js = yes? ("Do you want JS? (y/n) ")
  end

  def yes?(message)
    loop do
      print message
      input = gets.chomp.downcase
      if /^y/ === input
        return true
      elsif /^n/ === input
        return false
      end
    end
  end

  def prep_index
    index = File.open( "index.html", "w" )
    index.write( IndexPageGenerator.new(@dir_name, @user_wants_css, @user_wants_js).generate )
  end

  def prep_css
    make_directory('css')
    FileUtils.cp('../stylesheet.css', 'css/stylesheet.css')
  end

  def prep_js
    make_directory("js")
    @js_file = File.open( "js/script.js", "w" )
    @js_file.write( js_content )
  end

  def js_content
'(function(){
  var title = document.getElementById("title");
  console.log(title.innerHTML);
})();'
  end

  def destroy_dir(dir_name)
    FileUtils.rm_r(dir_name) if Dir.exists?(dir_name)
  end

  def make_directory(dir_name)
    destroy_dir(dir_name)
    Dir.mkdir(dir_name)
  end
end

if __FILE__ == "website_generator.rb"
  WebsiteGenerator.new.run
end




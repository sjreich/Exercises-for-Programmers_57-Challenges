class IndexPageGenerator
  def initialize(name, user_wants_css=false, user_wants_js=false)
    @name = name
    @user_wants_css = user_wants_css
    @user_wants_js = user_wants_js
  end

  def generate
    header + body
  end

  private

  def header
    "<!DOCTYPE html><head>" + css_line + "</head>"
  end

  def css_line
    if @user_wants_css
      "<link rel='stylesheet' type='text/css' href='css/stylesheet.css'>"
    else
      ""
    end
  end

  def body
    "<body><div id='title-block'><h1 id='title'>" +
    @name +
    "</h1></div>" +
    js_line +
    "</body>"
  end

  def js_line
    if @user_wants_js
      "<script type='text/javascript' src='js/script.js'></script>"
    else
      ""
    end
  end
end
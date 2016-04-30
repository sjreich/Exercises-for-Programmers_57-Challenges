require 'httparty'
require 'pry'
# look for octocat

class ContentGetter
  attr_reader :repo_list, :files_per_repo

  def initialize
    @files_per_repo = {}
  end

  API_BASE = 'https://api.github.com'
  RAW_BASE = 'https://raw.githubusercontent.com/'

  def repos_for(user)
    url = "/users/#{user}/repos"
    response = HTTParty.get(  API_BASE + url ).body
    repos = JSON.parse(response)
    @repo_list = repos.map{ |repo| repo["full_name"] }
    @repo_list
  end

  def files_in(repo)
    url = "/repos/#{repo}/git/trees/"
    response = HTTParty.get( API_BASE + url + sha(repo) + "?recursive=1" ).body
    response_json = JSON.parse(response)
    files = response_json["tree"].map {|i| i["path"]}
    actual_files = files.select {|f| f.include? '.' }
    @files_per_repo[repo] = actual_files
    actual_files
  end

  def sha(repo)
    url = "/repos/#{repo}/git/refs"
    response = HTTParty.get( API_BASE + url ).body
    repo_info = JSON.parse(response).first
    repo_info["object"]["sha"]
  end

  def contents_of(repo, file)
    response = HTTParty.get( RAW_BASE + repo + '/master/' + file ).body
  end

  def search(repo, expression)
    extension = "/search/code?q=#{expression}+repo:#{repo}"
    response = HTTParty.get( API_BASE + extension ).body
    matching_files = JSON.parse(response)["items"].map{|i| i["path"]}
  end

end

if __FILE__ == "github_api.rb"
  cg = ContentGetter.new
  # puts repos = cg.repos_for("sjreich")
  # puts files = cg.files_in("sjreich/A-Twitter-Clone")
  # puts contents = cg.contents_of("sjreich/A-Twitter-Clone", "Gemfile.lock")
  puts cg.search("cartoloupe/dotfiles", "log")
end
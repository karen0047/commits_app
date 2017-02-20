class Commit < ApplicationRecord
  attr_accessor :author, :repo
  def initialise(author,repo)
    @author = author
    @repo = repo
  end
  def api(author,repo)

    response = HTTParty.get('https://api.github.com/repos/octocat/Hello-World/commits')
    commits_data = JSON.parse(response.body)
    commits_data.each do |element|
      name = element["commit"]["author"]["name"]
      email = element["commit"]["author"]["email"]
      date = element["commit"]["author"]["date"]
      sha = element["sha"]
      Commit.create(name: name, email: email, date: date, sha: sha)
    end
  end 
end
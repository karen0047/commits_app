class Commit < ApplicationRecord
  def get_from_api
    Commit.destroy_all
    uri = URI("https://api.github.com/repos/#{author}/#{repo}/commits")
    response = HTTP.get(uri)
    commits_data = JSON.parse(response.body)
    commits_data.each do |element|
      name = element["commit"]["author"]["name"]
      email = element["commit"]["author"]["email"]
      date = element["commit"]["author"]["date"]
      sha = element["sha"]
      base = Commit.create(name: name, email: email, date: date, sha: sha)
    end
  end 
end
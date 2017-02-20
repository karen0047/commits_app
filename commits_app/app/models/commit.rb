class Commit < ApplicationRecord
  def author
   puts "#{"otocat"}"
  end
  
  def repo
  puts  "#{"Hello-World"}"
  end

  def api_data
    response = HTTParty.get('https://api.github.com/repos/:author/:repo/commits')
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

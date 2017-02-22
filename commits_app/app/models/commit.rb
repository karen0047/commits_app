class Commit < ApplicationRecord

  def get_from_api(author,repo)
    puts "Argument: #{author}"
    puts "Argument: #{repo}"

    uri = URI("https://api.github.com/repos/#{author}/#{repo}/commits")
    response = HTTP.get(uri)
    commits_data = JSON.parse(response.body)
    puts commits_data
  end 
end
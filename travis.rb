require 'curb'
require 'json'
require 'dotenv/load'

class Travis
  def self.call(branch)
    curl({ request: { branch: branch } }.to_json)
  end

  def self.curl(payload)
    Curl::Easy.http_post('https://api.travis-ci.org/repo/saberespoder%2Fcontenido/requests', payload) do |curl|
      curl.headers['Content-Type'] = 'application/json'
      curl.headers['Accept'] = 'application/json'
      curl.headers['Travis-API-Version'] = '3'
      curl.headers['Authorization'] = "token #{ENV['TRAVIS_TOKEN']}"
      curl.verbose = true
    end
    
    return 'OK'
  end
end


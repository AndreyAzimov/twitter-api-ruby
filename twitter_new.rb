class TwitterNew
  # 1 file to programmatically post to twitter using new api v2 (2024)
  # 
  # How to use:
  # 1. Get tokens: https://developer.twitter.com/en/portal/dashboard
  # 2. Change tokens in the code bellow
  # 3. Install these 2 gems: http, simple_oauth
  # 4. Save this file to as twitter_new.rb
  # 5. Usage: Twitter.post_tweet("hello world \n\n elon")
  
  require 'http'
  require 'simple_oauth'
  require 'json'


  def self.post_tweet(tweet_text)
    url = "https://api.twitter.com/2/tweets"
    headers = {
      "Authorization" => SimpleOAuth::Header.new("POST", url, {}, {
                                                   consumer_key: "CHANGE",
                                                   consumer_secret: "CHANGE",
                                                   token: "CHANGE",
                                                   token_secret: "CHANGE"
      }).to_s,
      "Content-Type" => "application/json"
    }

    body = { "text" => tweet_text }.to_json

    puts "Headers: #{headers}"
    puts "Body: #{body}"

    response = HTTP.headers(headers).post(url, body: body)

    if response.code == 201
      puts "Tweet posted successfully!"
      return response.parse(:json)
    else
      err = "Failed to post tweet. Error: #{response.parse(:json)['detail']}"
      puts err
      return err
    end
  end

end

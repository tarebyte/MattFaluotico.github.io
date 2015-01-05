require 'twitter'
require 'json'

def configure_twitter 
  $client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "YUf6KXPxEO8QfgPD16DtoRCwu"
    config.consumer_secret     = "DNChtn3x6xBgA7iKA2Bs582dCSTh2ntviP8t51VQQQVRU4A9mO"
    config.access_token        = "201872823-9GCYtO3LM0iFhcqWh131Lq0WVIqSWRK7dbjoTh4o"
    config.access_token_secret = "DFV406L9aWwOeeQRbjr6rkG01uRTpVGamAqudR4GoijOc"
  end
  puts "twitter initialzed"
end

def to_nat_lang (time)
  now = Time.new.to_i
  lapse = (now - time.to_i) / 60
  puts lapse

  if (lapse <= 5) 
    return "just now";
  elsif (lapse <= 20) 
    return "a moment ago";
  elsif (lapse <= 45) 
    return "a half hour ago";
  elsif (lapse <= 75)
    return "an hour ago";
  elsif (lapse <= 240)
    return "earlier today";
  elsif (lapse <= 1440)
    return "a day ago";
  elsif (lapse <= 10800)
    return "a week ago";
  elsif (lapse <= 43200)
    return "a few weeks ago";
  elsif (lapse <= 56160)
    return "a month ago";
  elsif (lapse <= 129600)
    return "a few months ago";
  else
    return "a bit ago";
  end
end

def tweet_back_days(index)
  $client.user_timeline("gem")
  tweet = $client.user_timeline(201872823)[index]
  tweet_text = tweet.full_text
  tweet_time = to_nat_lang tweet.created_at.to_i
  tweet_link = tweet.uri
  return {:tweet => tweet_text,
    :time => tweet_time,
    :link => tweet_link}.to_json
end
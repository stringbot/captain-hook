class CommitReceiver
  def initialize(payload)
    payload = JSON.parse(payload)

    $new_posts = []

    payload["commits"].each do |commit|
      process_commit(commit["message"])
    end
  end

  def process_commit(message)
    if message =~ /NEW POST/
      $new_posts << message
    end
  end

  def self.send_tweets
    $new_posts.each do |title|
      tweet = TwitterPost.new(title)
      tweet.post
    end
  end

end

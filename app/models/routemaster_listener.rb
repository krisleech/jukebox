require 'routemaster/client'

# Handler for events which need to be propergated to Routemaster

class RoutemasterListener
  def on_vote_cast(song_id)
    publish_created('songs', song_url(song_id))
  end

  private

  def publish_created(topic, url)
    Rails.logger.debug("-------------------------> create #{topic} #{url} #{routemaster_url} #{routemaster_uuid}")
    client.created(topic, url)
  end

  def client
    @client ||= Routemaster::Client.new(url: routemaster_url, uuid: routemaster_uuid)
  end

  def song_url(song_id)
    "#{jukebox_url}/songs/#{song_id}"
  end

  def jukebox_url
    "https://192.168.1.1:#{ENV.fetch('JUKEBOX_PORT')}"
  end

  def routemaster_url
    ENV.fetch('ROUTEMASTER_URL')
  end

  def routemaster_uuid
    ENV.fetch('ROUTEMASTER_UUID')
  end
end

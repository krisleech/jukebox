require 'routemaster/client'

# Handler for events which need to be propergated to Routemaster

class RoutemasterListener
  # will not work until setup IP's for VM's to communicate
  def on_vote_cast(song_id)
    client.created('songs', "http://localhost:9000/songs/#{song_id}") # this needs to be HTTPS
  end

  private

  # TODO: get URL and UUID from env
  def client
    @client ||= Routemaster::Client.new(url: 'https://localhost:4434', uuid: 'demo')
  end
end

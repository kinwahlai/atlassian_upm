

class UPMClient

  def initialize(url, user, password)
    @rest_client = RestClient::Resource.new(url, user, password)
  end

  def token
    @rest_client.head.headers[:upm_token]
  end

  def uploadPlugin(filename)
    @rest_client.post({:plugin => File.new(filename), :multipart => true},:params => {:token => token()})
  end
end

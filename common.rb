require "json"

class Event
  def initialize(payload)
    @payload = payload
  end

  def json_payload
    JSON.dump(@payload)
  end
end

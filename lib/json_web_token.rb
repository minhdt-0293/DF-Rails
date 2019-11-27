require "jwt"

class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, ENV["SECRET_KEY"])
  end

  def self.decode(token)
    JWT.decode(token, ENV["SECRET_KEY"])
  rescue
    nil
  end
end

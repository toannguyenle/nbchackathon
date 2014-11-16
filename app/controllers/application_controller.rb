class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # FANDANGO API
  def fandango_api
        # SHA ENCODING
      def Sha256Encode(stringToEncode)
          sha256 = OpenSSL::Digest::SHA256.new
          result = sha256.hexdigest(stringToEncode)
          return result
      end

      my_API_key = "8gbpkfedfeumuk357cbf4nwf"
      my_API_secret = "XfxxUxtfqcXQqrWCE69b79rr"

      # my_sig = my_API_key + my_API_secret + DateTime.to_i
      # BUILD MY FIRST SHA
      paramsToEncode = "%s%s%s" % [my_API_key, my_API_secret, Time.now.to_i]
      encodedParams = self.Sha256Encode(paramsToEncode)
      security_key = "apikey=%s&sig=%s" % [my_API_key, encodedParams] 

      return security_key                                                                        
    end
end

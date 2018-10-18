module QrToOtp
 
	class OTP
		
  	attr_reader :qr_image, :device_auth_failure, :otpauth		
    REFRESH_PERIOD = 30
    DIGIT_LENGTH = 6
    DIGEST_TYPE = "SHA1"
    PADDING_LENGTH = 8

    # @param [String] image either base64 encoded string or QR image in png format. 
    # @option Various options are accepted as REFRESH_PERIOD, DIGIT_LENGTH, PADDING_LENGTH, DIGEST_TYPE
    # @returns Auth Code instantiation 
    def initialize(image, options = {})
      @qr_image = image
      @refresh_period = options[:refresh_period] || REFRESH_PERIOD
      @digits_length = options[:digits] || DIGIT_LENGTH
      @padding_length = options[:padding_length] || PADDING_LENGTH
      @digest_type = options[:digest_type] || DIGEST_TYPE
      @image_path = 
      @device_auth_failure = false
      @device_identity = nil
    	@otpauth = qr_image_to_otpauth()
      if options[:device_identity]
      	@device_identity = options[:device_identity]
    		if @otpauth[:device_id] != @device_identity    			
    			@device_auth_failure = true
    			@otpauth = {}
    			return "FAILURE"
    		end
      end
    end

	  def get(time = unix_time())
	  	if (!@device_identity) or (@device_identity and !@device_auth_failure)
		    hash_mac = OpenSSL::HMAC.digest(
		      OpenSSL::Digest.new(@digest_type),
		      Base32.decode(@otpauth[:secret]),
		      time_to_string(time)
		    )
		   	data_offset = hash_mac.bytes.last & 0xf
		    data = hash_mac.bytes[data_offset..data_offset + 3]
  			data[0] = data[0] & 0x7f
			  has_mac_code = (data[0] << 24) + 
			  		(data[1] << 16) + 
				  	(data[2] << 8) + 
				  	data[3]
        return (has_mac_code % 10 ** @digits_length).to_s.rjust(@digits_length, '0')
	    else
    		return 'FAILURE'
	    end
	  end
	  
		def auth_at(time)
			if time.class != Time
        time = Time.at(time.to_i)
      end
		  get(unix_time(time))
		end	
				 
	  private	 

		def unix_time(time = Time.now)
		  (time.utc).to_i / @refresh_period
		end

		def image_type()
			File.extname(@qr_image) == '.png' ? true : false
		end

		def qr_code_to_qr_image()
			if !image_type
		    image = "/tmp/image_#{Time.now.to_i}.png"
		    File.open("#{image}", 'wb') do |f|
		      f.write(Base64.decode64(@qr_image))
		    end
		    @qr_image = image
		  end
		end

		def qr_image_to_otpauth()
		  qr_code_to_qr_image()
		  otpauth = Hash.new("")
		  otpauth_url = Qrio::Qr.load("#{@qr_image}").qr.text
		  base_name = File.basename("#{@qr_image}")
		  File.delete("/tmp/#{base_name}") if File.exist?("/tmp/#{base_name}")
		  otpauth[:url] = otpauth_url
		  otpauth[:device_id] = ''
		  otpauth[:secret] = otpauth_url[/secret=(.*?)&issuer/m, 1]
		  otpauth[:issuer] = otpauth_url[/issuer=(.*)/m, 1]
		  device_id = otpauth_url[/totp\/(.*)?/m, 1].split(':')
		  if device_id.length == 2
		  	otpauth[:device_id] = device_id[1].split('?')[0]
		  end
		  return otpauth
		end

		def time_to_string(time_val)
		  data_byte = []
		  until time_val == 0
		    data_byte << (0xFF & time_val).chr
		    time_val >>=  8
		  end
		  data_byte.reverse.join.rjust(@padding_length, 0.chr)
		end
	end
end

require_relative '../spec_helper'

describe 'Verify image to auth code with and without encryption' do
  let(:time)   { Time.utc 2018,1,1 }
  let(:auth_code_1) { '766409' }
  let(:auth_code_2) { '396435' }

  context 'without device identity check' do	
	  it 'verify auth code with QR image' do
    	image = File.join(File.dirname(__FILE__), '../fixtures/qrcode.png')
	    auth = QrToOtp::OTP.new(image)
	    expect(auth.auth_at(time).to_s).to eq(auth_code_1)
	  end

	  it 'verify auth code with base64 encoded image' do
    	image = 'iVBORw0KGgoAAAANSUhEUgAAAUgAAAFIAQAAAAAab1qeAAAAJHRFWHRTb2Z0d2FyZQBRUi1QTkcgaHR0cDovL3FyLnN3dGNoLmNvbS9nj329AAAGiUlEQVR4AWP4TywYVTmqclTlqMpRlcgqGf7///+fgYGBgYGB4f9/hv//GRgYGP7//////38Ghv//GRgYGBgYGP7///9/VCUxKhn+////n+H//////zP8//+fgYHhPwMDAwMDA8P//wwM/xn+/////z/D/////4+qJEYlw/////8z/GdgYPjP8J+BgeE/w///DAz/GRgY/v////8/w38GBob/DP////8/qpIYlQz/////z/CfgYHhP8P//wwMDP//MzD8Z2BgYPjPwPD/P8N/BgaG/wz/////P6qSGJUM/////8/wn4GB4T/D////Gf7/Z2Bg+P//PwPD//8M//8z/GdgYPjP8P////+jKolRyfD/////DP//////n+H/f4b///8zMDD8Z2Bg+P//PwPDf4b//////8/w/////6MqiVHJ8P////8MDAwMDAwM/xn+M/xn+M/wn+E/w3+G/wz/Gf4zMDAwMDAw/P////+oSmJUMvz///////////////8/AwPDfwYGhv//GRj+/2f4/////////////////////4+qJEYlw/////8zMDD8Z2BgYGD4z8Dwn+H///////9nYPj//z8Dw////xn+////////UZXEqGT4////f4b/DP//////n+E/A8N/Bob/DAwMDAwM//8z/P////////8Z/v///39UJTEqGf7/////P8N/hv8MDP8ZGP7///+f4f9/Bob/////////PwPDfwYGBob/////H1VJjEqG/////2f4z8Dwn+E/w////xn+M/xn+M/AwMDAwPCf4f///wz///////////+jKolRyfD//////xkY/jMwMPxn+P//PwPD/////////5/hP8N/Bob//xn+/2f4/////1GVxKhk+P///////xkY/jP8Z2Bg+M/AwPCfgYGBgYGBgeH///8MDP///2dg+P////9RlcSoZPj///9/Bob//xkYGBj+///PwPCf4f///wz/Gf7/////P8N/hv8MDAz/////P6qSGJUM////////////DAz/////z/CfgYGBgYHhPwMDw3+G/wwMDP///2f4//////+jKolRyfD/////////////P8P/////M/xn+M/w/////wwMDAz/GRgY/v///5/h/////0dVEqOS4f////8Z/v9nYGD4z8DA8J/h/////////8/A8J/hPwMDw///DAz/Gf7///9/VCUxKhn+////n4HhP8P//wz/Gf4z/P/P8P8/AwPDf4b///8z/Gf4z/CfgYHh/////0dVEqOS4f////8Z/jMwMDD8Z/j//z/Df4b///8z/P//n4HhP8N/hv//Gf4z/P//////UZXEqGT4//////8M/xkY/jMwMDAw/Gdg+P//PwPD//8MDAwMDAwM/xn+MzD8/////6hKYlQy/P///////wwMDP//MzAw/Gdg+M/wn4Hh////DAz/GRgY/v9nYPjP8P////+jKolRyfD/////DP8ZGBj+M/xnYGBgYPjP8P8/w////xkY/v9n+M/w//9/Bob/////H1VJjEqG///////PwPCfgeE/w38Ghv8MDAwMDAz//zMwMDD8/8/wn4Hh/3+G/////x9VSYxKhv////9n+M/A8J+BgYHh/3+G//8Z/jMw/P/P8P//fwYGBgaG//8Z/v//////qEpiVDL8////////////////PwPDf4b/////Z/j/n4GB4T8Dw////xn+MzAw/P////+oSmJUMvz///8/AwMDAwMDw38GBob//xn+////n+E/AwMDA8N/hv8MDP8ZGP7///9/VCUxKhn+////n+H//////zP8Z2D4z/D//38GBgaG//8ZGP4z/P//n4Hh/////////z+qkhiVDP/////P8J+BgeE/w38GBob/DP/////P8P8/w////xkYGBgY/v//z/D/////oyqJUcnw/////wz/GRgY/jP8//+fgYGB4f9/BgYGBgaG/wz///9nYPjPwPD//////0dVEqOS4f////8Z/jMwMPxn+M/A8J+B4T/D//8MDP8ZGP7/Z/j/n4GB4T8Dw/////+PqiRGJcP/////M/z/////f4b/DAwM/xkYGP7/Z2D4/5+B4T/DfwaG////M/z//////1GVxKhk+P///38GBgYGBgaG/wwM/xn+/2f4/5/h/3+G//8ZGBgYGBgY/jMw/P////+oSmJUMvwnFoyqHFU5qnJU5ahKZJUAGMWHV1g2rXQAAAAASUVORK5CYII='
	    auth = QrToOtp::OTP.new(image)
	    expect(auth.auth_at(time).to_s).to eq(auth_code_2)
	  end	
	end

  context 'with device identity check' do	
	  it 'correct device ID - png' do
    	image = File.join(File.dirname(__FILE__), '../fixtures/qrcode-with-id.png')
	    auth = QrToOtp::OTP.new(image, {:device_identity => 'b26590cf066b'})
	    expect(auth.auth_at(time).to_s).to eq(auth_code_1)
	  end

	  it 'incorrect device ID - png' do
    	image = File.join(File.dirname(__FILE__), '../fixtures/qrcode-with-id.png')
	    auth = QrToOtp::OTP.new(image, {:device_identity => 'a66590cf066b'})
	    expect(auth.auth_at(time).to_s).to eq("FAILURE")
	  end

	  it 'correct device ID - base64 encoded image' do
    	image = 'iVBORw0KGgoAAAANSUhEUgAAAUgAAAFIAQAAAAAab1qeAAAAJHRFWHRTb2Z0d2FyZQBRUi1QTkcgaHR0cDovL3FyLnN3dGNoLmNvbS9nj329AAAGjElEQVR4AWP4TywYVTmqclTlqMpRlcgqGf7///+fgYGBgYGB4f///wz///9nYGD4////f4b/DAz/GRgYGBgYGP7///9/VCUxKhn+////n+H//////zP8/8/w/////wwMDAz/GRgY/jMw/Gf4//////8M/////z+qkhiVDP/////P8J+BgeE/w3+G//8Z/v9n+M/wn+H/////////z/CfgYHhP8P/////j6okRiXD/////zP8Z2Bg+M/w/z/D/////zP8/////3+G//8ZGP4z/GdgYPjP8P////+jKolRyfD/////DP8ZGBj+M/z/z/D/PwMDw/////8zMPz/z8Dwn+E/AwPDf4b/////H1VJjEqG/////2f4//////8M////Z2BgYPjPwPD/P8N/hv8M//8z/P////9/hv////8fVUmMSob/////Z2BgYGBgYPjP8J/hP8N/hv8M/xn+M/xn+M/wn4GBgYGBgeH/////R1USo5Lh/////////////////xn+/2f4z8Dwn4GBgYGB4f9/hv////////////////8fVUmMSob/////Z2Bg+M/AwMDA8P8/w3+G/////////z/D////GRj+///P8P///////4+qJEYlw/////8z/GdgYGD4z8DA8P8/AwPD//////9nYPj//z/D////////z/D/////oyqJUcnw//////8Z/jP8/8/w//9/hv8MDAz///////8/A8N/hv8MDP8ZGBgY/v///39UJTEqGf7/////PwPD//8M/xkYGBj+MzAw/P/PwMDAwMDw//9/hv8M////////////oyqJUcnw/////wwM/////8/AwPCfgYGB4f///////2dg+P//PwPD//8M//8z/P////+oSmJUMvz/////////Gf4z/P//n4HhPwMDAwMDA8N/Bob///8zMDD8//+fgeH/////R1USo5Lh////////Z/j/n4GBgYHh////DAz//////5+B4f9/Bob//xn+MzAw/P////+oSmJUMvz///8/w/////8z/GdgYPjP8J+BgeE/A8P//wz/////z8Dw//9/hv//////P6qSGJUM/////8/AwPD/PwMDAwPD//8MDP8ZGP7///+fgeE/AwMDw/////8z/P////+oSmJUMvz/////f4b/DAz/////z/D/PwMDAwPD////GRgY/jMwMPz/z8Dwn+H/////R1USo5Lh/////xn+///PwMDAwMDw/z/D////Gf7/////P8N/Bob//xn+MzAw/P////+oSmJUMvz/////////Gf4z/P/P8P8/w38Ghv//Gf7//8/w/////////2f4z/D//////0dVEqOS4f//////M/xnYGBg+P+f4f///wz/GRj+///PwMDA8J+BgeE/w38Ghv////8fVUmMSob///////+f4f9/hv//GRj+/2dg+M/A8P//fwYGhv///zP8/8/A8J/h/////0dVEqOS4f////8Z/jP8//+fgeE/A8P/////////n+H/f4b/////Z2D4//8/A8P/////j6okRiXD//////9n+M/AwPD/PwMDAwMDA8P//wwMDAwM/xn+M/z/z8Dw/z/D/////4+qJEYlw/////8z/P//n+E/w3+G/wwMDAz//zP8//+fgYGBgYGBgYHh/3+G//////8/qpIYlQz/////////////////z8DA8J+BgYGB4T/DfwYGhv8M////Z/jPwMDw/////6MqiVHJ8P////8MDAwMDAwM/xn+M/z/z8Dwn+E/w///DP8ZGP4z/Gdg+M/A8P////+jKolRyfD/////DP//////n+E/w////xkY/jP8Z/j//z/D//8M////Z2D4z8Dw/////6MqiVHJ8P////8M/xkYGP4z/Gf4z8DAwMDAwPD/////DP//MzAwMDD8//////////+PqiRGJcP/////M/xnYGD4z/D/P8P//wz/GRgYGBj+MzD8Z2D4/5+B4T8Dw///////H1VJjEqG/////2f4z8DA8J/hPwMDw////////8/A8P8/AwPD////GRgY/jMw/P////+oSmJUMvz///8/w///////Z/jP8P////8MDAz/Gf7/Z2D4z8DA8J/h////DP//////f1QlMSoZ/v///5+BgYGBgYHhP8N/hv8M////////P8N/BgYGBgYGBgaG/wwM/////z+qkhiVDP+JBaMqR1WOqhxVOaoSWSUAM1I2tn9z91UAAAAASUVORK5CYII='
	    auth = QrToOtp::OTP.new(image, {:device_identity => 'b26590cf066b'})
	    expect(auth.auth_at(time).to_s).to eq('189652')
	  end

	  it 'incorrect device ID - base64 encoded image' do
    	image = File.join(File.dirname(__FILE__), '../fixtures/qrcode-with-id.png')
	    auth = QrToOtp::OTP.new(image, {:device_identity => 'a66590cf066b'})
	    expect(auth.auth_at(time).to_s).to eq("FAILURE")
	  end
	end

  context 'Run local test with device ID' do
	  it 'local qr code - png' do
	  	#Prepare QR code with your first 3 bytes of mac address in below listed format check correct message and store in ../fixtures with local-qr-code.png
	  	#otpauth://totp/Local:<mac-address without colon like 186590>?secret=XQLY4T5X7M7MLCJ4&issuer=Local
	  	#e.g. otpauth://totp/lc:186590?secret=XQLY4T5X7M7MLCJ4&issuer=lc
    	image = File.join(File.dirname(__FILE__), '../fixtures/local-qr-code.png')
    	local_device_id = MacAddress.address.split(':')
	    auth = QrToOtp::OTP.new(image, {:device_identity => local_device_id[0]+local_device_id[1]+local_device_id[2]})
	    if auth.otpauth.empty?
	    	puts "\nDevice Authentication failure !!\n"
	    end
	  end
	end
end
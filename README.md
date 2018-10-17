# The Ruby QR Image to OTP Library

A Ruby library for generating Google Authenticator time based password, based on base64 image or a QR code image. Additionally, it does a device identity based validation too, which is optional. 


## Dependencies

* OpenSSL
* Ruby 1.9.3 or higher
* Qrio 

## Installation

```bash
gem install qr-to-otp
```

## Usage

### Time based OTP's

```ruby
#Scan the QR code in path ../fixtures/qrcode.png and verify with below code
image = File.join(File.dirname(__FILE__), '../fixtures/qrcode.png')
auth = QrToOtp::OTP.new(image)
auth.get()
```

Optionally, you can provide device identity.

```ruby
image = File.join(File.dirname(__FILE__), '../fixtures/qrcode.png')
auth = QrToOtp::OTP.new(image, {'device_identity': 'a5b1b2'})
auth.get()
```

### Testing

```bash
bundle install
bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tusharmetkar/qr-to-otp
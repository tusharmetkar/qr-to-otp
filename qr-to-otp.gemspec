# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qr-to-otp/version'

Gem::Specification.new do |spec|
  spec.name          = "qr-to-otp"
  spec.version       = QrToOtp::VERSION
  spec.authors       = ["Tushar Metkar"]
  spec.email         = ["tusharmetkar@yahoo.co.in"]

  spec.summary       = %q{Ruby library for QR image to otp conversion}
  spec.description   = %q{It converts base64 image or QR image to time based Google Authenticator one time password}
  spec.homepage      = "https://github.com/tusharmetkar/qr-to-otp.git"

  spec.files         = ['lib/qr-to-otp.rb', 'lib/qr-to-otp/otp.rb','lib/qr-to-otp/version.rb']
  spec.test_files    = spec.files.grep(%r{^(test|spec|)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "mac-address", "~> 1.6.3"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "base32", "~> 0.3.2"
  spec.add_development_dependency "qrio", "~> 0.0.1"  

end
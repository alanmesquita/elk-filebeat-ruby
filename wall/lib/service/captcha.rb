require 'typhoeus'
require 'json'

# TO-DO extract magic string to constants
module Service
  class Captcha
    def initialize(captcha_response, ip)
      @request = make_request(captcha_response, ip)
      @request_body = JSON.load(@request.body)
    end

    def success?
      @request_body.fetch('success', false)
    end

    private
    def make_request(captcha_response, ip)
      Typhoeus.post('https://www.google.com/recaptcha/api/siteverify', body: {
        secret: '<secret>',
        response: captcha_response,
        remoteip: ip
      })
    end
  end
end

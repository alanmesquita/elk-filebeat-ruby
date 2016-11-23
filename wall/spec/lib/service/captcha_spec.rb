describe Service::Captcha do
  describe 'success?' do
    context 'When the request goes wrong',
      vcr: { cassette_name: 'lib/service/captcha/error'} do

      it '' do
        captcha_response = described_class.new 'teste', 'teste'
        expect(captcha_response.success?).to be_falsey
      end
    end

    context 'When successfully',
      vcr: { cassette_name: 'lib/service/captcha/success'} do

      it '' do
        ip = '172.17.0.1'
        # I need to do something with these string
        captcha_value = 'teste'
        captcha_response = described_class.new(captcha_value, ip)
        expect(captcha_response.success?).to be_truthy
      end
    end
  end
end

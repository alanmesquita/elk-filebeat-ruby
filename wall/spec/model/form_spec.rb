describe Form do
  before do
    allow(Service::Captcha).to receive(:new).and_return(mocked_captcha)
  end

  describe 'valid?' do
    context 'When form is not valid' do
      let(:mocked_captcha) { class_double('Mocked_captcha', :'success?' => false) }

      it 'shall invalidate the form' do
        form = described_class.new()
        expect(form.valid?).to be_falsey
      end

      context 'When everything is ok, but captcha is invalid' do
        it 'shall invalidate the form' do
          form = described_class.new(ip: '123', captcha: '123', vote: '1')
          expect(form.valid?).to be_falsey
        end
      end
    end

    context 'When form is valid' do
      let(:mocked_captcha) { class_double('Mocked_captcha', :'success?' => true) }
      it 'shall validate the form' do
        form = described_class.new(ip: '123', captcha: '123', vote: '1')
        expect(form.valid?).to be_truthy
      end
    end
  end
end

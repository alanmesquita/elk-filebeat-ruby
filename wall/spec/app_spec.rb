describe App do
  describe 'GET /' do
    it 'get home page' do
      get '/'
      expect(last_response).to be_ok
    end
  end
end

require_relative './../spec_helper.rb'

describe HelpService do
  describe '#perform' do

    it 'Response mostra os principais comandos' do
      response = HelpService.perform()

      expect(response).to match('para português')
      expect(response).to match('para inglês')
    end

  end
end

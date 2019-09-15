require_relative './../spec_helper.rb'

describe InterpretService do
  describe '#perform' do

    context 'sem texto para traduzir' do
      it 'para pt (português) - mostra mensagem para inserir texto' do
        response = InterpretService.perform('en-pt',{'text' => ''})

        expect(response).to match('Faltou o texto para tradução')
      end

      it 'para en (inglês) - mostra mensagem para inserir texto' do
        response = InterpretService.perform('pt-en',{'text' => ''})

        expect(response).to match('Faltou o texto para tradução')
      end
    end

    context 'com texto para traduzir' do
      it 'mostra o texto traduzido para pt (português)' do
        response = InterpretService.perform('en-pt',{'text' => 'house'})

        expect(response).to match('casa')
      end

      it 'mostra o texto traduzido para en (inglês)' do
        response = InterpretService.perform('pt-en',{'text' => 'casa'})

        expect(response).to match('house')
      end
    end

  end
end

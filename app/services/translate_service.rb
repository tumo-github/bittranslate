require 'rest-client'
require 'json'

class TranslateService

  def initialize(text)
    @text = text
  end

  def to_pt
    return return_text_blank if @text.nil? or @text == ''

    get_response('en-pt')
  end

  def to_en
    return return_text_blank if @text.nil? or @text == ''

    get_response('pt-en')
  end

  private

  def get_response(lang)
    begin
      key = "trnsl.1.1.20190912T225007Z.f91bbf10890db4dd.4a9056d8bde53d17921cb5e128cf23933c1cdf9c"
      url = "https://translate.yandex.net/api/v1.5/tr.json/translate?format=html&lang=#{lang}&text=#{@text}"

      res = JSON.parse(RestClient.get(url).body)

      res['code'] == 200 ? res['text'].first : return_text_error
    rescue
      text_error
    end
  end

  def return_text_blank
    'Faltou o texto para tradução.'
  end

  def return_text_error
    'Erro ao tentar traduzir.'
  end

end

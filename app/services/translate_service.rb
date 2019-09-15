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
      url    = "https://translate.yandex.net/api/v1.5/tr.json/translate"
      params = {
        key:    ENV['YANDEX_KEY'],
        format: 'html',
        lang:   lang,
        text:   @text
      }

      res = JSON.parse(RestClient.post(url, params).body)

      res['code'] == 200 ? res['text'].first : return_text_error
    rescue
      return_text_error
    end
  end

  def return_text_blank
    'Faltou o texto para tradução.'
  end

  def return_text_error
    'Erro ao tentar traduzir.'
  end

end

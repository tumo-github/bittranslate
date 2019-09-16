require 'json'
require 'sinatra'

# Load Services
Dir["./app/services/**/*.rb"].each {|file| require file }

class App < Sinatra::Base

  get '/' do
    'NazuSoft Bit Translate! (en-pt <-> pt-en)'
  end

  post '/webhook' do
    request.body.rewind
p "request.body.read"
p request.body.read
    result = JSON.parse(request.body.read)['queryResult']
p "result"
p result

    params   = result['contexts'].present? ? result['contexts'][0]['parameters'] : result['parameters']
    response = TranslateService.perform(result['action'], params)

    content_type :json, charset: 'utf-8'
    {
      'fulfillmentMessages': [
        {
          'payload': {
            'telegram': {
              'text': response,
              'parse_mode': 'HTML'
            }
          }
        }
      ]
    }.to_json
  end

end

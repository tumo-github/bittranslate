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

    result = JSON.parse(request.body.read)['queryResult']

    params   = result['parameters']
    response = InterpretService.perform(result['action'], params)

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

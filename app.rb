require 'json'
require 'sinatra'

# Load Services
Dir["./app/services/**/*.rb"].each {|file| require file }

class App < Sinatra::Base

  get '/' do
    'NazuSoft Bit Translate! (en-pt <-> pt-en)'
  end

  post '/webhook' do
    #request.body.rewind

    #result = JSON.parse(request.body.read)

    params = if JSON.parse(request.body.read)['queryResult']['contexts'].present?
      JSON.parse(request.body.read)['queryResult']['contexts']['contexts'][0]['parameters']
    else
      JSON.parse(request.body.read)['queryResult']['parameters']
    end

    response = TranslateService.perform(JSON.parse(request.body.read)['queryResult']['action'], params)

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

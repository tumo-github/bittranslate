RSpec.configure do |config|
  config.before(:each) do

    stub_request(:post, "https://translate.yandex.net/api/v1.5/tr.json/translate" )
    .with(
      body: { key: ENV['YANDEX_KEY'], format: 'html', lang: 'en-pt', text: 'house' },
      headers: { 'Accept': '*/*' }
    ).to_return(status: 200, body:
    '{
      "code": 200,
      "lang": "en-pt",
      "text": [
        "casa"
      ]
    }', headers: {})

    stub_request(:post, "https://translate.yandex.net/api/v1.5/tr.json/translate")
    .with(
      body: { key: ENV['YANDEX_KEY'], format: 'html', lang: 'pt-en', text: 'casa' },
      headers: { 'Accept': '*/*' }
    ).to_return(status: 200, body:
    '{
      "code": 200,
      "lang": "pt-en",
      "text": [
        "house"
      ]
    }', headers: {})

  end
end

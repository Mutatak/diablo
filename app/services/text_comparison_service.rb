require 'httparty'

class TextComparisonService
  API_KEY = ENV['SEMANTIC_API_KEY']
  API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=#{API_KEY}"

  def self.check(text1, text2)
    body = {
      "contents" => [
        {
          "parts" => [
            { "text" => "Compare the following two paragraphs semantically and provide a similarity score between 1 and 10:
              Paragraph 1: #{text1}, Paragraph 2: #{text2}"
            }
          ]
        }
      ],
      "generationConfig" => {
        "response_mime_type" => "application/json"
      }
    }

    headers = { 'Content-Type' => 'application/json' }

    response = HTTParty.post(API_URL, body: body.to_json, headers: headers)

    if response.code == 200
      JSON.parse(response.body)
    else
      { error: "API error: #{response.message}", details: response.body }
    end
  end
end

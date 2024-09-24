require 'httparty'

class SemanticScholarService
  def self.search(keyword)
    searcher_url = "https://api.semanticscholar.org/graph/v1/paper/search?query=#{keyword}&limit=3"
    response = HTTParty.get(searcher_url)

    if response.code == 200
      JSON.parse(response.body)
    else
      { error: "API error: #{response.message}", details: response.body }
    end
  end

  def self.get_paper(paper_id)
    retriever_url = "https://api.semanticscholar.org/graph/v1/paper/#{paper_id}"
    response = HTTParty.get(retriever_url)

    if response.code == 200
      JSON.parse(response.body)
    else
      { error: "API error: #{response.message}", details: response.body }
    end

  end
end

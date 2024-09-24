class PapersController < ApplicationController
  def new
    @papers = nil
  end

  def search_paper
    keyword = params[:keyword]

    result = SemanticScholarService.search(keyword)
    @papers = if result["data"].present?
      result["data"]
    else
        "Could not get data from the API."
    end
    render :new
  end

  def get_paper
    paper_id = params[:paper_id]

    result = SemanticScholarService.get_paper(paper_id)
    @paper = if result["data"].present?
      result["data"]
    else
      "Could not get data from the API."
    end
    render :show
  end
end

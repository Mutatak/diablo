class TextsController < ApplicationController
  def new
    @similarity_score = nil
  end

  def check_similarity
    text1 = params[:text1]
    text2 = params[:text2]

    result = TextComparisonService.check(text1, text2)
    @similarity_score = if result["candidates"].present?
      content_text = result["candidates"].first["content"]["parts"].first["text"]
      JSON.parse(content_text)['similarity_score']
    else
      "API'den beklenen veri alınamadı."
    end

    redirect_to show_similarity_path(@similarity_score)
  end

  def show_similarity
    @similarity_score = params[:similarity_score]
  end
end

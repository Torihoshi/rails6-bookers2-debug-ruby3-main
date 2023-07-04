class TagsearchesController < ApplicationController

  def search
    @model = Book  #search機能とは関係なし
    @word = params[:content]
    @books = Book.where("category LIKE?","%#{@word}%") #LIKE句は、主に曖昧検索を行う場合に使用するクエリ
    render "tagsearches/tagsearch"
  end




end

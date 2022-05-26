class SearchesController < ApplicationController
  def index
    @dream_lists = DreamList.search(params[:search])
    @search = params[:search]
  end
end

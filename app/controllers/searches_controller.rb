class SearchesController < ApplicationController
  def index
    @dream_lists = DreamList.search(params[:search])
    @search = params[:search]
    @not_to_do_lists = current_user.not_to_do_lists.all
  end
end

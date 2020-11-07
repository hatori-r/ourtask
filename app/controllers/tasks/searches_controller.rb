class Tasks::SearchesController < ApplicationController
  def index
    @tasks = Task.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(10)
  end
end
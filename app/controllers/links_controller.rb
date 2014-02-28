class LinksController < ApplicationController
  before_action :require_current_user!
  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to @link
    else
      flash[:errors] = @link.errors.full_messages
      render "new"
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      redirect_to @link
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:text, :title, :url, :sub_ids => [])
  end
end

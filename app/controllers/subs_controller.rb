class SubsController < ApplicationController
  before_action :require_current_user!

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    @sub.links.new(link_params)

    if @sub.save
      render :json => @sub
    else
      flash[:errors] = @sub.errors.full_messages
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:name)
  end

  def link_params
    params.permit(:link => [:title, :url, :text])
          .require(:link)
          .values
          .reject{|data| data["title"].blank? || data["url"].blank?}
  end
end
class SubsController < ApplicationController
  before_action :require_current_user!

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    user_hash = {:submitter_id => current_user.id}
    params = link_params.map do |link_param|
      link_param.merge!(user_hash)
    end
    @sub.links.new(params)
    if @sub.save
      redirect_to @sub
    else
      flash[:errors] = @sub.errors.full_messages
    end
  end

  def index
    @subs = Sub.all
  end
  
  def show
    @sub = Sub.find(params[:id])
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
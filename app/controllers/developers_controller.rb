class DevelopersController < ApplicationController
  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    @developer.user = current_user
    if @developer.save
      redirect_to events_path(@events)
    else
      render :new, status: :bad_request
    end
  end

  private

  def developer_params
    params.require(:event).permit(:title, :content)
  end
end

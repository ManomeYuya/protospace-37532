class PrototypesController < ApplicationController
  def index
    @prototypes = Prototypes.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
  end

  private

  def prototype_params
    params.require(:prototype).permit(:image,:title,:catch_copy,:concept).merge(user_id: current_user.id)
  end

end

class Public::HomesController < ApplicationController
  def top
    @information = Information.all.limit(5).order(id: :desc)
  end
  
  def about
  end
end

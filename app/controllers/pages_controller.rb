class PagesController < ApplicationController

  skip_before_action :authenticate_user!

  def home
  end

  def about
  end

  def hygiene
  end

  def features
  end

end

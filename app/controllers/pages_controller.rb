class PagesController < ApplicationController
  before_filter :authenticate_user!,
    :except => [:index, :about, :contact, :terms, :about_us, :privacy]

  def index

  end

  def contact
  end

  def pdf
  end

  def about
  end

  def terms
  end

  def about_us
  end

  def privacy
  end
end

class UrlResourcesController < ApplicationController

  before_filter :authenticate_user!, :only => [:index, :show, :new, :create]

  def index
    @url_resources = current_user.url_resources
  end

  def show
    begin
      @url_resource = current_user.url_resources.find(params[:id])
    rescue
      redirect_to url_resources_path, :flash => { :error => "Url not found" }      
    end
  end

  def new
    @url_resource = UrlResource.new
  end

  def create
    @url_resource = UrlResource.find_or_create_by_url_string(params[:url_resource])
    @url_resource.user = current_user
    if @url_resource.save
      redirect_to @url_resource, :flash => { :notice => "Url Created" }
    else
      render :new
    end
  end

  def short
    if @url_resource = UrlResource.find_by_token(params[:id])
      @url_resource.increase_browser_count browser.name
      redirect_to @url_resource.url_string
    else
      redirect_to :root, :flash => { :error => "Url not found" }
    end
  end
end

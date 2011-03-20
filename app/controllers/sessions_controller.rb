class SessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.xml
  before_filter :ensure_login, :only => [:destroy, :show]
  before_filter :ensure_logout, :only => [:new, :create]
  def index
    redirect_to(new_session_path)
  end
 
  def new
    @session = Session.new
  end
 
  def create
    @session = Session.new(params[:session])
    if @session.save
      session[:id] = @session.id
      flash[:notice] = "Hello #{@session.person.name}, you are now logged in"
      redirect_to(root_url)
    else
      render(:action => 'new')
    end
  end

  # PUT /sessions/1
  # PUT /sessions/1.xml
  def update
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        format.html { redirect_to(@session, :notice => 'Session was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @session.errors, :status => :unprocessable_entity }
      end
    end
  end
  def show
  	destroy
  end
  # DELETE /sessions/1
  # DELETE /sessions/1.xml
  def destroy
    @session = Session.find(session[:id])
    @session.destroy
    session[:id] = @user = nil
    flash[:notice] = "You are now logged out"
    redirect_to :controller => :pages, :action=> :home 
  end
end

class RegistrationsController < ApplicationController
  # GET /registrations
  # GET /registrations.xml
  skip_before_filter :require_user, :only=>[:create, :checkout, :completed, :new]

  layout :set_layout
  
  def index
    @registrations = Registration.all(:order => "id ASC")  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
      format.csv do
        @registrations_to_csv = Registration.to_csv_file(@registrations)
        @filename = 'inscricoes.csv'
        @output_encoding = 'UTF-8'
      end
      
    end
  end

  # GET /registrations/1
  # GET /registrations/1.xml
  def show
    @registration = Registration.find(params[:id], :include => [:activities])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.xml
  def new
    @registration = Registration.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])  
  end

  # POST /registrations
  # POST /registrations.xml
  def create
    @registration = Registration.new(params[:registration])
    respond_to do |format|
      if @registration.save
        format.html { redirect_to registration_completed_path(:id => @registration.id) }
        format.xml  { render :xml => @registration, :status => :created, :location => @registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.xml
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to(@registration, :notice => 'Registration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end
  


  # DELETE /registrations/1
  # DELETE /registrations/1.xml
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to(registrations_url) }
      format.xml  { head :ok }
    end
  end
  
  def checkout
    @registration = Registration.find(params[:id])
    if @registration.mode_of_payment == Registration::PAGSEGURO
      @order = PagSeguro::Order.new(@registration.id)
      @order.add :id => 1, :price => @registration.value, :description => "Inscrição no EIE 2011"
    end
  end
  
  def completed
    @registration = Registration.find(params[:id])
  end

  def export_data
    @registrations_to_csv = Registration.export_data
    respond_to do |format|
      format.csv do
        @filename = 'inscricoes.csv'
        @output_encoding = 'UTF-8'
      end  
    end
  end

protected

  def set_layout
    if @current_user.nil?
      'registration'
    else
      'application'
    end

  end
  
end

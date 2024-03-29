class RegistrationsController < ApplicationController
  # GET /registrations
  # GET /registrations.xml
  skip_before_filter :require_user, :only=>[:new, :create, :checkout, :completed, :edit_new_data, :update_new_data, :update, :search_certificate, :download_certificate]

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
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.xml
  def new
    @registration = Registration.new
    @registration.participations.build
    load_data(0)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])  
    @registration.participations.build if @registration.participations.count == 0
    load_data(10)
  end

  # POST /registrations
  # POST /registrations.xml
  def create
    @registration = Registration.new(params[:registration])
    respond_to do |format|
      if @registration.save
        @registration.send_notification
        format.html { redirect_to registration_completed_path(:id => @registration.id) }
        format.xml  { render :xml => @registration, :status => :created, :location => @registration }
      else
        @registration.participations.build if @registration.participations.first.nil?
        load_data(0)
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.xml
  def update
    if params[:update_new_data].nil?
      @registration = Registration.find(params[:id])

      respond_to do |format|
        if @registration.update_attributes(params[:registration])
          format.html { redirect_to(@registration, :notice => 'Registration was successfully updated.') }
          format.xml  { head :ok }
        else
          @registration.participations.build if @registration.participations.count == 0
          load_data(10)
          format.html { render :action => "edit" }
          format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
        end
      end
    else
      update_new_data
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

  def edit_new_data
    @registration = Registration.find(params[:id])  
    @registration.participations.build if @registration.participations.count == 0
    load_data(10)
  end

  def update_new_data
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { render :action => "update_new_data" }
        format.xml  { head :ok }
      else
        @registration.participations.build if @registration.participations.count == 0
        load_data(10)
        format.html { render :action => "edit_new_data" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  def search_certificate
  end

  def download_certificate
    @registration = Registration.with_cpf(params[:cpf])
  end

protected

  def set_layout
    if @current_user.nil?
      'unlogged'
    else
      'application'
    end
  end

  def load_data(increase_limit)
    activities = Activity.all
    @activities = []
    activities.each do |a|
      registrations_total = 0
        # Participation.find_by_sql("
        # SELECT count(*) as total FROM participations p
        # INNER JOIN registrations r ON p.registration_id = r.id
        # WHERE r.participation_type = 0
        # AND p.activity_id = #{a.id}").first.total
      if registrations_total < (a.lotation.to_i + increase_limit)
        @activities << [a.name, a.id]
      end
    end
  end
  
end

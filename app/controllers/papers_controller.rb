class PapersController < ApplicationController

  skip_before_filter :require_user, :only=>[:new, :create, :validate_paper_user]

  layout :set_layout

  def index
    @papers = Paper.all(:include => [:registration])
    respond_to do |format|
      format.html
      format.csv do
        @papers_to_csv = Paper.to_csv_file
        @filename = 'trabalhos.csv'
        @output_encoding = 'UTF-8'
      end
    end 
  end


  def new

  end

  def validate_paper_user
    cpf = params[:cpf]
    cpf = "#{cpf.slice(0..2)}.#{cpf.slice(3..5)}.#{cpf.slice(6..8)}-#{cpf.slice(9..10)}"
    @registration = Registration.find_by_cpf(cpf)
    if @registration.nil?
      @registration = Registration.find_by_cpf(params[:cpf])
    end
    @paper = Paper.new
    respond_to do |format|
    if @registration.nil?
        format.html { redirect_to(new_paper_user_path, :notice => 'O CPF informado não está inscrito no evento, se inscreva antes, para poder enviar o seu trabalho.') }
        format.xml  { render :status => :unprocessable_entity }
    elsif @registration.papers.count == 2
      format.html { redirect_to(new_paper_user_path, :notice => 'Você já enviou o máximo de trabalhos permitido.') }
      format.xml  { render :status => :unprocessable_entity }
    else
        get_new_paper_data
        format.html
        format.xml  { render :xml => @registration }
      end
    end
  end

  def create
    @paper = Paper.new(params[:paper])

    respond_to do |format|
      if @paper.save
        format.html { redirect_to(new_paper_user_path, :notice => 'Trabalho salvo com sucesso.') }
        format.xml  { render :xml => @paper, :status => :created, :location => @paper }
      else
        @registration = Registration.find(@paper.registration_id)
        get_new_paper_data
        format.html { render :action => "validate_paper_user" }
        format.xml  { render :xml => @paper.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @paper = Paper.find(params[:id])  
    @registration = @paper.registration
  end

  def update
    @paper = Paper.find(params[:id])

    respond_to do |format|
      if @paper.update_attributes(params[:paper])
        format.html { redirect_to(papers_path, :notice => 'Paper was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paper.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @paper = Paper.find(params[:id])
  end

    def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    respond_to do |format|
      format.html { redirect_to(papers_path) }
      format.xml  { head :ok }
    end
  end

  def update_status
    @paper = Paper.find(params[:id])
    @paper.status = params[:status]
    @paper.save
    respond_to do |format|
      format.js
    end
  end

protected

  def get_new_paper_data
    @paper_types = Paper.get_types_that_didnt_send(@registration.papers.collect(&:paper_type))
  end

  def set_layout
    if @current_user.nil?
      'unlogged'
    else
      'application'
    end

  end
end


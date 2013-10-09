class KindsController < ApplicationController

  before_action :set_kind, only: [:show, :edit, :update, :destroy]
  before_action :new_kind, only: [:create]

  def index
    @kinds = Kind.where(:user => current_user)
  end

  def show
  end

  def new
    @kind = Kind.new
    @kind.build_treatment
  end

  def edit
  end

  def create
    respond_to do |format|
      if @kind.save
        format.html { redirect_to @kind, notice: 'Kind was successfully created.' }
        format.json { render action: 'show', status: :created, location: @kind }
      else
        format.html { render action: 'new' }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @kind.update(kind_params)
        format.html { redirect_to @kind, notice: 'Kind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kind.destroy
    respond_to do |format|
      format.html { redirect_to kinds_url }
      format.json { head :no_content }
    end
  end

  private

  def set_kind
    @kind = Kind.find(params[:id])
  end

  def new_kind
    @kind = Kind.new(kind_params)
    @kind.user_id = current_user.id
  end

  def kind_params
    params.require(:kind).permit(:name, :latin_name, :user_id, treatment_attributes: [:temperature_min, :temperature_max, :comment])
  end

end

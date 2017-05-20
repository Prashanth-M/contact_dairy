class ContactInfosController < InheritedResources::Base
  before_action :set_contact_info, only: [:show, :edit, :update, :destroy]

  # GET /contact_infos
  # GET /contact_infos.json
  def index
    @contact_infos = ContactInfo.all
  end


	def login
      @contact_info = ContactInfo.find_by_mobile_one(params[:mobile_one])

	    respond_to do |format|
		  	if @contact_info.present?
		  		# @contact_infos = ContactInfo.all
				@res = { :status => "Success", :message => "Logged in!", :response => @contact_info }
				format.json { render json: @res }
			else
				@res = { :status => "Failed", :message => "Mobile number not found"}
				format.json { render json: @res }
		  	end
		end
	end


  # GET /contact_infos/1
  # GET /contact_infos/1.json
  def show
  end

  # GET /contact_infos/new
  def new
    @ConctactInfo = ConctactInfo.new
  end

  # GET /contact_infos/1/edit
  def edit
  end

  # POST /contact_infos
  # POST /contact_infos.json
  def create
    @ConctactInfo = ConctactInfo.new(ConctactInfo_params)

    respond_to do |format|
      if @ConctactInfo.save
        format.html { redirect_to @ConctactInfo, notice: 'ConctactInfo was successfully created.' }
        format.json { render :show, status: :created, location: @ConctactInfo }
      else
        format.html { render :new }
        format.json { render json: @ConctactInfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_infos/1
  # PATCH/PUT /contact_infos/1.json
  def update
    respond_to do |format|
      if @ConctactInfo.update(ConctactInfo_params)
        format.html { redirect_to @ConctactInfo, notice: 'ConctactInfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @ConctactInfo }
      else
        format.html { render :edit }
        format.json { render json: @ConctactInfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_infos/1
  # DELETE /contact_infos/1.json
  def destroy
    @ConctactInfo.destroy
    respond_to do |format|
      format.html { redirect_to contact_infos_url, notice: 'ConctactInfo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_contact_info
      @contact_info = ContactInfo.find(params[:id])
    end

    def contact_info_params
      params.require(:contact_info).permit(:first_name, :last_name, :email, :phone, :address)
    end
end


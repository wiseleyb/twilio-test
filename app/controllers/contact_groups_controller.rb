class ContactGroupsController < ApplicationController
  before_action :set_contact_group, only: [:show, :edit,
                                           :update, :destroy,
                                           :send_text_messages]
  # GET /contact_groups
  # GET /contact_groups.json
  def index
    @contact_groups = ContactGroup.all
  end

  # GET /contact_groups/1
  # GET /contact_groups/1.json
  def show
    @contacts = @contact_group.contacts
  end

  # GET /contact_groups/new
  def new
    @contact_group = ContactGroup.new
  end

  # GET /contact_groups/1/edit
  def edit
  end

  # POST /contact_groups
  # POST /contact_groups.json
  def create
    @contact_group = ContactGroup.new(contact_group_params)

    respond_to do |format|
      if @contact_group.save
        format.html { redirect_to @contact_group,
                      notice: 'Contact group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_groups/1
  # PATCH/PUT /contact_groups/1.json
  def update
    respond_to do |format|
      if @contact_group.update(contact_group_params)
        format.html { redirect_to @contact_group, notice: 'Contact group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_groups/1
  # DELETE /contact_groups/1.json
  def destroy
    @contact_group.destroy
    respond_to do |format|
      format.html { redirect_to contact_groups_url }
      format.json { head :no_content }
    end
  end

  # POST /contact_groups/1/send_text_messages
  def send_text_messages
    # TODO error handling, etc.
    MessageWorker.perform_async(@contact_group.id, params[:message])
    flash[:notice] = "#{@contact_group.contacts.count} text messages queued " +
                     "to be sent."
    redirect_to contact_group_path(@contact_group)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_group
      @contact_group = ContactGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_group_params
      params.require(:contact_group)
            .permit(:file, :group_name)
            .merge(user_id: current_user.id)
    end
end

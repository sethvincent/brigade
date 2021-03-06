class Brigades::DeployedApplicationsController < ApplicationController
  load_resource :brigade

  def new
    @deployed_application = @brigade.deployed_applications.build
    @deployed_application.build_location
    @deployed_application.build_brigade
  end

  def create
    @deployed_application = @brigade.deployed_applications.build params[:deployed_application]

    if @deployed_application.save
      redirect_to @deployed_application, notice: 'The application was deployed successfully!'
    else
      flash[:error] = 'The application could not be deployed'
      render :new
    end
  end

  def index
    @deployed_applications = @brigade.deployed_applications.search(params[:query])
  end
end

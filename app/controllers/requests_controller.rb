class RequestsController < ApplicationController

    def index
      @requests = Request.all
      # SELECT department, COUNT(*) AS requests_num FROM requests GROUP BY department
      @sales = Request.where(department: 'Sales').count
      @marketing = Request.where(department: 'Marketing').count
      @technical = Request.where(department: 'Technical').count
      # Search stuff.
      if params[:search]
        @requests = Request.search(params[:search]).page(params[:page]).per(10).order("created_at DESC")
      else
        @requests = Request.all.page(params[:page]).per(10).order('created_at DESC')
      end
    end

    def new
      @request = Request.new
    end

    def create
      @request = Request.new request_params
      if @request.save
        redirect_to request_path(@request)
      else
        render :new
      end
    end

    def show
      find_request
    end

    def edit
      find_request
    end

    def update
      find_request
      if @request.update request_params
        redirect_to request_path(@request)
      else
        render :edit_request
      end
    end

    def destroy
      find_request
      @request.destroy
      redirect_to requests_path
    end

    def search
      find_request
    end

    def done
      request = Request.find(params[:id])
      if request.done
        request.update_attribute(:done, false)
        # flash[:notice] = 'Request not answered'
      else
        request.update_attribute(:done, true)
        # flash[:notice] = 'Request completed!'
      end
      redirect_to :back
    end

    private

    def request_params
      params.require(:request).permit([:name, :email, :department, :message, :done])
    end

    def find_request
      @request = Request.find params[:id]
    end

end






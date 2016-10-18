class RequestsController < ApplicationController
    def new
      @request = Request.new
    end

    def create
      request_params = params.require(:request).permit([:name, :email, :department, :message, :done])
      @request = Request.new request_params
      if @request.save
        redirect_to request_path(@request)
      else
        render :new
      end
    end

    def show
      @request = Request.find params[:id]
    end



    def index
      @requests = Request.all
      # Some initial search stuff.
      if params[:search]
        @requests = Request.search(params[:search]).page(params[:page]).per(10).order("created_at DESC")
      else
        @requests = Request.all.page(params[:page]).per(10).order('created_at DESC')
      end
    end

    def edit
      @request = Request.find params[:id]
    end

    def update
      @request = Request.find params[:id]
      request_params = params.require(:request).permit(:name, :email, :department, :message)
      if @request.update request_params
        redirect_to request_path(@request)
      else
        render :edit_request
      end
    end

    def done
      request = Request.find(params[:id])
      if request.done
        request.update_attribute(:done, false)
      else
        request.update_attribute(:done, true)
      end
      redirect_to requests_path
    end

    def destroy
      @request = Request.find params[:id]
      @request.destroy
      redirect_to requests_path
    end

    def search
      @request = Request.find params[:id]
    end



end

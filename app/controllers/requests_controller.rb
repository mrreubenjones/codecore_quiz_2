class RequestsController < ApplicationController
  # this action is to show the form for creating a new question
    # the URL: /questions/new
    # the path helper is: new_question_path
    def new
      @request = Request.new
    end

    # this action is to handle creating a new question after submitting the form
    # that was shown in the new action
    def create
      request_params = params.require(:request).permit([:name, :email, :department, :message])
      @request = Request.new request_params
      if @request.save
        # redirect_to question_path({id: @question.id})
        # redirect_to question_path({id: @question})
        redirect_to request_path(@request)
      else
        render :new
      end
    end

    # this action is to show information about a specific question
    # URL: /questions/:id (for example /questions/123)
    # METHOD: GET
    def show
      @request = Request.find params[:id]
      # render plain: "In show action"

    end

    def done

      @request = Request.find(params[:id])
      @request.update_attribute(:done, 'true')
      redirect_to requests_path
    end

    # this action is to show a listings of all the questions
    # URL: /questions
    # METHOD: GET
    def index
      # @requests = Request.order(created_at: :desc)
      # @requests = Request.order(:id).page params[:page]
      @requests = Request.page(params[:page]).per(10)
    end

    # this action is to show a form pre-populated with the question's data
    # URL: /questions/:id/edit
    # METHOD: GET
    def edit
      @request = Request.find params[:id]
    end

    # this action is to capture the parameters from the form submission form the
    # edit action in order to update a question
    # URL: /questions/:id
    # METHOD: PATCH
    def update
      @request = Request.find params[:id]
      request = params.require(:request).permit(:name, :email, :department, :message)
      if @request.update request_params
        redirect_to request_path(@request)
      else
        render :edit
      end
    end

    # this action handles deleting a question
    # URL: /questions/:id
    # METHOD: DELETE
    def destroy
      @request = Request.find params[:id]
      @request.destroy
      redirect_to requests_path
    end

    def search
      @request = Request.find params[:id]
    end



end

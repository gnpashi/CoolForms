class ResponsesController < ApplicationController
    before_action :set_response, only: %i[ show edit update destroy ]
    before_action :set_form
  

    def index
      @responses = Response.all
    end

    def new
        @response = @form.responses.new
        @questions = @form.questions
        @response.answers.build
    end

    def create
      @response = @form.responses.new(form_params)
  
      respond_to do |format|
        if @response.save
          format.html { redirect_to @form, notice: "Response was successfully created." }
          format.json { render :show, status: :created, location: @response }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @response.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @response.update(form_params)
          format.html { redirect_to @form, notice: "Response was successfully updated." }
          format.json { render :show, status: :ok, location: @response }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @response.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @response.destroy
      respond_to do |format|
        format.html { redirect_to forms_url, notice: "Response was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_response
        @response = Response.find(params[:id])
      end
      
      def set_form
        @form = Form.find(params[:form_id])
      end
  
      # Only allow a list of trusted parameters through.
      def form_params
        params.require(:response).permit(answers_attributes: [:id, :_destroy, :content, :question_id, :form_id ])
      end
  end
  
# frozen_string_literal: true

class ReviewsController < ApplicationController
  load_and_authorize_resource :movie
  load_and_authorize_resource :review, through: :movie, shallow: true, param_method: :review_params

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.movie, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review.movie, notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @review.movie, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private def review_params
    params.require(:review).permit(:movie_id, :title, :body)
  end
end

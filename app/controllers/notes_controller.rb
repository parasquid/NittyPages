class NotesController < ApplicationController
  def show
    @note = Note.where(date: params[:id]).first || Note.new(date: params[:id])
  end

  def create() = update

  def update
    @note = Note.where(date: params[:id]).first || Note.new(note_params)

    if @note.persisted?
      if @note.update(note_params)
        redirect_to @note
      else
        render :show, status: :unprocessable_entity
      end
    else
      if @note.save
        redirect_to @note
      else
        render :show, status: :unprocessable_entity
      end
    end
  end

  private
  def note_params
    params.require(:note).permit(:date, :body)
  end
end

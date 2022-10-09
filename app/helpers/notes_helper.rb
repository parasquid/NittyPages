module NotesHelper
  def has_notes_class(date) = Note.where(date: date).exists? ? "font-bold" : nil
  def today_class(date) = Date.today == date ? "text-red-500" : nil

  def prev_month_class(date, start_date_param)
    start_date = Date.parse(start_date_param)
    (start_date.month != date.month && date < start_date) ? "bg-gray-200" : nil
  end

  def next_month_class(date, start_date_param)
    start_date = Date.parse(start_date_param)
    (start_date.month != date.month && date > start_date) ? "bg-gray-200" : nil
  end
end

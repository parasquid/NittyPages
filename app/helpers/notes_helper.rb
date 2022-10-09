module NotesHelper
  def has_notes_class(date) = Note.where(date: date).exists? ? "font-bold" : nil
  def today_class(date) = Date.today == date ? "text-red-500" : nil
  def current_date_class(date, start_date) = date == start_date ? "bg-amber-200" : nil
  def hover_class(date, start_date) = date != start_date ? "hover:bg-sky-300" : nil

  def prev_month_class(date, start_date)
    (start_date.month != date.month && date < start_date) ? "bg-gray-200" : nil
  end

  def next_month_class(date, start_date)
    (start_date.month != date.month && date > start_date) ? "bg-gray-200" : nil
  end

  def date_classes(date, start_date_param)
    start_date = Date.parse(start_date_param)
    <<~CLASSES
      #{today_class(date)}
      #{has_notes_class(date)}
      #{next_month_class(date, start_date)}
      #{prev_month_class(date, start_date)}
      #{current_date_class(date, start_date)}
      #{hover_class(date, start_date)}
    CLASSES
  end
end

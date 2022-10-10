class Note < ApplicationRecord
  serialize :body

  def to_param() = date

  def todos(sigil: ENV.fetch("SIGIL_TODO") { ">" })
    return [] unless persisted?
    body
      .each_line
      .filter { |line| line.start_with? "#{sigil} " }
      .map(&:chomp)
      .map { |line| line.gsub(sigil, "" ) }
  end
end

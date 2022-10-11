class Note < ApplicationRecord
  serialize :body

  def to_param() = date

  def todos(sigil: ENV.fetch("SIGIL_TODO") { "=" })
    Rails.cache.fetch([self, :todos]) do
      return [] unless persisted?
      body
        .each_line
        .map.with_index { |line, number|
          next unless line.start_with? "#{sigil} "
          {
            line: line.chomp.gsub(sigil, ""),
            number: number
          }
        }
        .compact
      end
  end

  def dones(sigil: ENV.fetch("SIGIL_DONE") { "~" })
    Rails.cache.fetch([self, :dones]) do
      return [] unless persisted?
      body
        .each_line
        .map.with_index { |line, number|
          next unless line.start_with? "#{sigil} "
          {
            line: line.chomp.gsub(sigil, ""),
            number: number
          }
        }
        .compact
      end
  end
end

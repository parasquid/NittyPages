class Note < ApplicationRecord
  serialize :body

  def to_param() = date

  def checklist_items(sigils: {
    todos: ENV.fetch("SIGIL_TODO") { "=" },
    dones: ENV.fetch("SIGIL_DONE") { "~" },
    crits: ENV.fetch("SIGIL_CRIT") { "!" },
  })
    ret_val = {
      todos: [],
      dones: [],
      crits: [],
    }
    return ret_val unless persisted?

    Rails.cache.fetch([self, :checklist_items]) do
      body
        .each_line
        .map.with_index { |line, number|
          sigils.each do |key, sigil|
            next unless line.start_with? "#{sigil} "
            ret_val.fetch(key).push({
              line: line.chomp.gsub(sigil, ""),
              number: number + 1
            })
          end
        }
        .compact

      puts ret_val.inspect
      ret_val
    end
  end

end

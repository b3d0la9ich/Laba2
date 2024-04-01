require 'set'

def remove_dots(s)
  result = ""
  ignore = false
  s.each_char do |c|
    if c == '*'
      ignore = true
    end
    if !ignore && c != '.'
      result += c
    end
  end
  result
end

emails = ["mar.pha+science@co.rp.nstu.ru", "marpha+scie.nce@corp.nstu.ru", "marph.a+s.c.i.e.n.c.e+@corp.nstu.ru"]
unique_emails = Set.new

emails.each do |email|
  local_part = email.split('@').first
  cleaned_email = remove_dots(local_part)
  unique_emails.add(cleaned_email)
end

puts "Count of unique emails: #{unique_emails.size}"
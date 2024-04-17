def remove_dots(s)
  result = ""
  (0...s.length - 1).each do |i|
    if s[i] == '.' && s[i + 1] == '.'
      return "wrong"
    end
    if s[0] == '.' || s[-1] == '.'
      return "wrong"
    end
  end

  s.each_char do |c|
    if c == '*'
      return result
    end
    if ['=', '+', '_', '-', ',', '<', '>', '&', '\''].include?(c)
      return "wrong"
    end

    if c != '.'
      result += c
    end
  end
  result
end

emails = ["maaaasdf@dsf@p.nstu.ru", "marphascience@corp.nstu.ru", "marphas.c.i.e.n.c.e@corp.nstu.ru"]
unique_emails = Set.new

emails.each do |email|
  at_pos = email.index('@')
  if at_pos
    length_before_at = at_pos
    if length_before_at < 6 || length_before_at > 30
      puts "Ошибка: количество символов до @ в адресе #{email} должно быть между 6 и 30."
      exit 1
    end
  else
    puts "Ошибка: адрес #{email} не содержит символ @."
    exit 1
  end
end

emails.each do |email|
  if email.count('@') > 1
    puts "Error: More than one '@' symbol in email: #{email}"
    exit 1
  end

  cleaned_email = remove_dots(email[0...email.index('@')])
  if cleaned_email != "wrong"
    unique_emails.add(cleaned_email)
  end
end

puts "Count of unique emails: #{unique_emails.size}"

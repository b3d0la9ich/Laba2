def remove_dots(s):
    result = ""
    for i in range(len(s) - 1):
        if s[i] == '.' and s[i+1] == '.':
            return "wrong"
        if s[0] == '.' or s[-1] == '.':
            return "wrong"

    for c in s:
        if c == '*':
            return result
        if c in ['=', '+', '_', '-', ',', '<', '>', '&', '\'']:
            return "wrong"

        if c != '.':
            result += c
    return result

emails = ["maaaasdf@dsf@p.nstu.ru", "marphascience@corp.nstu.ru", "marphas.c.i.e.n.c.e@corp.nstu.ru"]
unique_emails = set()

for email in emails:
    at_pos = email.find('@')
    if at_pos != -1:
        length_before_at = at_pos
        if length_before_at < 6 or length_before_at > 30:
            print("Ошибка: количество символов до @ в адресе {} должно быть между 6 и 30.".format(email))
            exit(1)
    else:
        print("Ошибка: адрес {} не содержит символ @.".format(email))
        exit(1)

for email in emails:
    if email.count('@') > 1:
        print("Error: More than one '@' symbol in email: {}".format(email))
        exit(1)

    cleaned_email = remove_dots(email[:email.find('@')])
    if cleaned_email != "wrong":
        unique_emails.add(cleaned_email)

print("Count of unique emails: {}".format(len(unique_emails)))

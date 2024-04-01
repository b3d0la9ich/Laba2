def remove_dots(s):
    result = ""
    ignore = False
    for c in s:
        if c == '*':
            ignore = True
        if not ignore and c != '.':
            result += c
    return result

emails = ["mar.pha+science@co.rp.nstu.ru", "marpha+scie.nce@corp.nstu.ru", "marph.a+s.c.i.e.n.c.e+@corp.nstu.ru"]
unique_emails = set()

for email in emails:
    cleaned_email = remove_dots(email[:email.find('@')])
    unique_emails.add(cleaned_email)

print("Count of unique emails:", len(unique_emails))
fn remove_dots(s: &str) -> String {
    let mut result = String::new();
    let mut ignore = false;
    for c in s.chars() {
        if c == '*' {
            ignore = true;
        }
        if !ignore && c != '.' {
            result.push(c);
        }
    }
    result
}

fn main() {
    let emails = vec![
        "mar.pha+science@co.rp.nstu.ru",
        "marpha+scie.nce@corp.nstu.ru",
        "marph.a+s.c.i.e.n.c.e+@corp.nstu.ru",
    ];
    let mut unique_emails = std::collections::HashSet::new();

    for email in emails {
        let local_part = email.split('@').next().unwrap();
        let cleaned_email = remove_dots(local_part);
        unique_emails.insert(cleaned_email);
    }

    println!("Count of unique emails: {}", unique_emails.len());
}
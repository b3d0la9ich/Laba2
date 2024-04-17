use std::collections::HashSet;

fn remove_dots(s: &str) -> String {
    let mut result = String::new();
    let mut chars = s.chars();
    let mut prev_char = chars.next();

    for c in chars {
        if c == '.' && prev_char == Some('.') {
            return "wrong".to_string();
        }
        if c == '*' {
            break;
        }
        if c == '=' || c == '+' || c == '_' || c == '-' || c == ',' || c == '<' || c == '>' || c == '&' || c == '\'' {
            return "wrong".to_string();
        }
        if c != '.' {
            result.push(c);
        }
        prev_char = Some(c);
    }

    result
}

fn main() {
    let emails = vec![
        "maaaasdf@dsf@p.nstu.ru",
        "marphascience@corp.nstu.ru",
        "marphas.c.i.e.n.c.e@corp.nstu.ru",
    ];
    let mut unique_emails = HashSet::new();

    for email in emails {
        let at_pos = email.find('@');
        if let Some(length_before_at) = at_pos {
            if length_before_at < 6 || length_before_at > 30 {
                println!("Error: Number of characters before @ in email {} should be between 6 and 30.", email);
                return;
            }
        } else {
            println!("Error: Email {} does not contain '@' symbol.", email);
            return;
        }

        if email.matches('@').count() > 1 {
            println!("Error: More than one '@' symbol in email: {}", email);
            return;
        }

        let cleaned_email = remove_dots(&email[0..length_before_at]);
        if cleaned_email != "wrong" {
            unique_emails.insert(cleaned_email);
        }
    }

    println!("Count of unique emails: {}", unique_emails.len());
}

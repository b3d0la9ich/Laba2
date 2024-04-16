package main

import (
	"fmt"
	"strings"
)

// Function to remove all dots from a string
func removeDots(s string) string {
	result := ""
	for i := 0; i < len(s)-1; i++ {
		if s[i] == '.' && s[i+1] == '.' {
			return "wrong"
		}
		if s[0] == '.' || s[len(s)-1] == '.' {
			return "wrong"
		}
	}

	for _, c := range s {
		if c == '*' {
			return result
		}
		if c == '=' || c == '+' || c == '_' || c == '-' || c == ',' || c == '<' || c == '>' || c == '&' || c == '\'' {
			return "wrong"
		}

		if c != '.' {
			result += string(c) // Add character to result if it's not '.' and ignore is not active
		}
	}
	return result
}

func main() {
	emails := []string{"maaaasdf@dsf@p.nstu.ru", "marphascience@corp.nstu.ru", "marphas.c.i.e.n.c.e@corp.nstu.ru"}
	uniqueEmails := make(map[string]bool)

	// Проверка длины до символа "@"
	for _, email := range emails {
		atPos := strings.Index(email, "@")
		if atPos != -1 {
			lengthBeforeAt := atPos
			if lengthBeforeAt < 6 || lengthBeforeAt > 30 {
				fmt.Println("Ошибка: количество символов до @ в адресе", email, "должно быть между 6 и 30.")
				return
			}
		} else {
			fmt.Println("Ошибка: адрес", email, "не содержит символ @.")
			return
		}
	}

	// Checking for uniqueness of email addresses after removing dots
	for _, email := range emails {
		// Check if there is more than one '@' in the email
		if strings.Count(email, "@") > 1 {
			fmt.Println("Error: More than one '@' symbol in email:", email)
			return
		}

		cleanedEmail := removeDots(email[:strings.Index(email, "@")])
		if cleanedEmail != "wrong" {
			uniqueEmails[cleanedEmail] = true
		}
	}

	// Output the count of unique emails
	fmt.Println("Count of unique emails:", len(uniqueEmails))
}
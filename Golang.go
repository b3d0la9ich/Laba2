package main

import (
	"fmt"
	"strings"
)

// Function to remove all dots from a string
func removeDots(s string) string {
	var result strings.Builder
	ignore := false // Flag indicating whether to ignore characters
	for _, c := range s {
		if c == '*' {
			ignore = true // Encountered '*', start ignoring
		}
		if !ignore && c != '.' {
			result.WriteRune(c) // Add character to result if it's not '.' and ignore is not active
		}
	}
	return result.String()
}

func main() {
	emails := []string{"mar.pha+science@co.rp.nstu.ru", "marpha+scie.nce@corp.nstu.ru", "marph.a+s.c.i.e.n.c.e+@corp.nstu.ru"}
	uniqueEmails := make(map[string]bool)

	// Checking for uniqueness of email addresses after removing dots
	for _, email := range emails {
		atIndex := strings.Index(email, "@")
		localPart := email[:atIndex]
		cleanedEmail := removeDots(localPart)
		uniqueEmails[cleanedEmail] = true
	}

	// Output the count of unique emails
	fmt.Println("Count of unique emails:", len(uniqueEmails))
}
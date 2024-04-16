import java.util.*;

public class Main {
    public static void main(String[] args) {
        List<String> emails = Arrays.asList("maaaasdf@dsf@p.nstu.ru", "marphascience@corp.nstu.ru", "marphas.c.i.e.n.c.e@corp.nstu.ru");
        Set<String> uniqueEmails = new HashSet<>();

        for (String email : emails) {
            int atPos = email.indexOf('@');
            if (atPos != -1) {
                int lengthBeforeAt = atPos;
                if (lengthBeforeAt < 6 || lengthBeforeAt > 30) {
                    System.out.println("Ошибка: количество символов до @ в адресе " + email + " должно быть между 6 и 30.");
                    System.exit(1); // Выход с ошибкой
                }
            } else {
                System.out.println("Ошибка: адрес " + email + " не содержит символ @.");
                System.exit(1); // Выход с ошибкой
            }
        }

        for (String email : emails) {
            if (email.chars().filter(ch -> ch == '@').count() > 1) {
                System.out.println("Error: More than one '@' symbol in email: " + email);
                System.exit(1); // Выход с ошибкой
            }

            String cleanedEmail = removeDots(email.substring(0, email.indexOf('@')));
            if (!cleanedEmail.equals("wrong")){
                uniqueEmails.add(cleanedEmail);
            }
        }

        System.out.println("Count of unique emails: " + uniqueEmails.size());
    }

    public static String removeDots(String s) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < s.length() - 1; i++){
            if (s.charAt(i) == '.' &&  s.charAt(i+1) == '.') {
                return "wrong";
            }
            if(s.charAt(0) == '.' || s.charAt(s.length() - 1) == '.'){
                return "wrong";
            }
        }

        for (char c : s.toCharArray()) {
            if (c == '*') {
                return result.toString();
            }
            if (c == '=' || c == '+' || c == '_' || c == '-' || c == ',' || c == '<' || c == '>' || c == '&' || c == '\''){
                return "wrong";
            }

            if (c != '.' ) {
                result.append(c); // Add character to result if it's not '.' and ignore is not active
            }
        }
        return result.toString();
    }
}
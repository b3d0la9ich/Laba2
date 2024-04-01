import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Main {
    public static String removeDots(String s) {
        String result = "";
        boolean ignore = false;
        for (char c : s.toCharArray()) {
            if (c == '*') {
                ignore = true;
            }
            if (!ignore && c != '.') {
                result += c;
            }
        }
        return result;
    }

    public static void main(String[] args) {
        List<String> emails = new ArrayList<>();
        emails.add("mar.pha+science@co.rp.nstu.ru");
        emails.add("marpha+scie.nce@corp.nstu.ru");
        emails.add("marph.a+s.c.i.e.n.c.e+@corp.nstu.ru");

        Set<String> uniqueEmails = new HashSet<>();

        for (String email : emails) {
            String cleanedEmail = removeDots(email.substring(0, email.indexOf('@')));
            uniqueEmails.add(cleanedEmail);
        }

        System.out.println("Count of unique emails: " + uniqueEmails.size());
    }
}


import java.util.Scanner;
import java.util.ArrayList;

public class Main {
    public static int countEqualNumbers(ArrayList<Integer> sequence) {
        int count = 0;
        for (int i = 1; i < sequence.size(); i++) {
            if (sequence.get(i) == sequence.get(i - 1)) {
                count++;
            }
        }
        return count;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the number of elements: ");
        int n;
        while (!scanner.hasNextInt()) {
            System.out.println("Error: Invalid input. Please enter an integer.");
            scanner.nextLine();
        }
        n = scanner.nextInt();

        ArrayList<Integer> sequence = new ArrayList<>(n);
        System.out.println("Enter the elements: ");
        for (int i = 0; i < n; i++) {
            while (!scanner.hasNextInt()) {
                System.out.println("Error: Invalid input. Please enter integers only.");
                scanner.nextLine();
            }
            sequence.add(scanner.nextInt());
        }

        int result = countEqualNumbers(sequence);
        System.out.println("Output: " + result);
    }
}

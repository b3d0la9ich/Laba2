import java.util.ArrayList;
import java.util.List;

public class Main {
    public static int countEqualNumbers(List<Integer> sequence) {
        int count = 0;
        for (int i = 1; i < sequence.size(); i++) {
            if (sequence.get(i).equals(sequence.get(i - 1))) {
                count++;
            }
        }
        return count;
    }

    public static void main(String[] args) {
        List<Integer> sequence = new ArrayList<>();
        sequence.add(5);
        sequence.add(12);
        sequence.add(12);
        sequence.add(23);
        sequence.add(23);
        sequence.add(23);
        sequence.add(108);
        int result = countEqualNumbers(sequence);
        System.out.println("Output: " + result);
    }
}


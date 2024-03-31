import java.util.Arrays;

public class Main {
    public static int countSafeStones(int stones, int[] birds) {
        boolean[] isStoneSafe = new boolean[stones + 1]; // initialize all stones as safe
        Arrays.fill(isStoneSafe, true);

        for (int bird : birds) {
            // if a bird can fly a distance that is less than or equal to the number of stones,
            // that it will visit the stones with a step "bird"
            for (int i = bird; i <= stones; i += bird) {
                isStoneSafe[i] = false; // mark stone as unsafe
            }
        }

        int safeStones = 0;
        for (int i = 1; i <= stones; i++) {
            if (isStoneSafe[i]) {
                safeStones++; // add counts of safe stones
            }
        }

        return safeStones;
    }

    public static void main(String[] args) {
        int stones = 6;
        int[] birds = {3, 2};

        int safeStones = countSafeStones(stones, birds);
        System.out.println("Count of safe stones: " + safeStones);
    }
}
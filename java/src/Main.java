import java.util.*;

/**
 * Kocsen Chung
 * PLC Typed Java assignment
 * CSCI-344
 * Contributors: N/A
 */

/**
 * Does there exist a flight path from Rochester to Paris?
 * ANSWER
 *
 * Does there exist a flight path from Paris to Rochester?
 * ANSWER
 *
 * Does there exist a direct flight from Berlin to Miami?
 * ANSWER
 *
 * Does there exist a one stop flight from London to Rochester?
 * ANSWER
 *
 * Does there exist a two stop flight from London to Rochester?
 * ANSWER
 *
 * Does there exist a three stop flight from London to Rochester?
 * ANSWER
 *
 * Does there exist a four stop flight from London to Rochester?
 * ANSWER
 *
 * Does your flightExists query give you the longest or shortest possible path? Can you explain how to make it do it the opposite way, if it is even possible?
 * ANSWER
 *
 * Which language was easier to implement this scenario in, Java or Prolog?
 * ANSWER
 *
 */
public class Main {
    private static HashMap<String, HashSet<String>> flights = new HashMap<String, HashSet<String>>();

    public static void main(String[] args) {


        flights.put("rochester", new HashSet<>(Arrays.asList("nyc", "dc", "detroit")));
        flights.put("nyc", new HashSet<>(Arrays.asList("dc", "paris", "miami")));
        flights.put("dc", new HashSet<>(Arrays.asList("miami", "nyc", "denver")));
        flights.put("detroit", new HashSet<>(Arrays.asList("rochester", "dc")));
        flights.put("denver", new HashSet<>(Arrays.asList("detroit", "miami", "dc")));
        flights.put("miami", new HashSet<>(Arrays.asList("london")));
        flights.put("london", new HashSet<>(Arrays.asList("nyc", "berlin", "paris")));
        flights.put("berlin", new HashSet<>(Arrays.asList("miami")));
        flights.put("paris", new HashSet<>(Arrays.asList()));

        ArrayList<String> finalFlight = traverse("miami", "berlin");
        System.out.println(finalFlight.toString());
    }

    public static boolean direct(String source, String dest) {
        return flights.get(source).contains(dest);
    }

    public static boolean oneStop(String source, String dest) {
        return false;
    }

    public static boolean twoStop(String source, String dest) {
        return false;
    }

    public static boolean threeStop(String source, String dest) {
        return false;
    }

    public static boolean fourStop(String source, String dest) {
        return false;
    }

    public static boolean flightExists(String source, String dest) {
        return false;
    }

    public static ArrayList<String> traverse(String source, String dest) {
        System.out.println(source + " to " + dest);
        ArrayList<String> visited = new ArrayList<>();
        if (source.equals(dest)) {
            return visited;
        }

        ArrayList<String> finalPath = new ArrayList<>();

        // BFS uses Queue data structure
        // BFS will allow us to achieve the fastest path possible
        Queue<String> queue = new LinkedList();
        queue.add(source);

        int currentDepth = 0,
                elementsToDepthIncrease = 1,
                nextElementsToDepthIncrease = 0;

        while (!queue.isEmpty()) {
            String current = queue.poll();
            System.out.println("\tTraversing through " + current);
            nextElementsToDepthIncrease += flights.get(current).size();
            if (--elementsToDepthIncrease == 0) {
                currentDepth++;
                elementsToDepthIncrease = nextElementsToDepthIncrease;
                nextElementsToDepthIncrease = 0;
            }

            if (current.equals(dest)) {
                System.out.println(--currentDepth);
                return visited;
            }

            visited.add(current);
            for (String flight : flights.get(current)) {
                if (!visited.contains(flight)) {
                    queue.add(flight);
                }
            }
        }

        return visited;
    }
}




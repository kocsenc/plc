import java.util.*;

/**
 * Kocsen Chung
 * PLC Typed Java assignment
 * CSCI-344
 * Contributors: N/A
 */

/** QUESTIONS TO ANSWER
 * Does there exist a flight path from Rochester to Paris?
 * [rochester, dc, nyc, paris]
 * True
 *
 * Does there exist a flight path from Paris to Rochester?
 * False
 *
 * Does there exist a direct flight from Berlin to Miami?
 * [berlin, miami]
 * True
 *
 * Does there exist a one stop flight from London to Rochester?
 * False
 *
 * Does there exist a two stop flight from London to Rochester?
 * False
 *
 * Does there exist a three stop flight from London to Rochester?
 * False
 *
 * Does there exist a four stop flight from London to Rochester?
 * False
 *
 * Does your flightExists query give you the longest or shortest possible path?
 * Can you explain how to make it do it the opposite way, if it is even possible?
 *
 * My flightExists query tries to give the shortest path but it's not guaranteed.
 * A way to help it always perform the shortest path is by using a BFS algorithm.
 * Even then, since the graph is cyclic it may not always work.
 *
 * Which language was easier to implement this scenario in, Java or Prolog?
 * Prolog was way better to implement this in. Basically because prolog uses ordinal logic
 * to already determine for us if any cases are possible. Where as it's up to us in Java
 * to code, test and analyze the algorithm.
 */
public class prog08 {
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

        System.out.println(flightExists("rochester", "paris"));
        System.out.println(flightExists("paris", "rochester"));
        System.out.println(direct("berlin", "miami"));
        System.out.println(oneStop("london", "rochester"));
        System.out.println(twoStop("london", "rochester"));
        System.out.println(threeStop("london", "rochester"));
        System.out.println(fourStop("london", "rochester"));
    }

    public static boolean direct(String source, String dest) {
        ArrayList<String> path = traverse(source, dest);
        System.out.println(path);
        return path != null && path.size() - 2 == 0;
    }

    public static boolean oneStop(String source, String dest) {
        ArrayList<String> path = traverse(source, dest);
        System.out.println(path);
        return path != null && path.size() - 2 == 1;
    }

    public static boolean twoStop(String source, String dest) {
        ArrayList<String> path = traverse(source, dest);
        System.out.println(path);
        return path != null && path.size() - 2 == 2;
    }

    public static boolean threeStop(String source, String dest) {
        ArrayList<String> path = traverse(source, dest);
        System.out.println(path);
        return path != null && path.size() - 2 == 3;
    }

    public static boolean fourStop(String source, String dest) {
        ArrayList<String> path = traverse(source, dest);
        System.out.println(path);
        return path != null && path.size() - 2 == 4;
    }

    public static boolean flightExists(String source, String dest) {
        ArrayList<String> path = traverse(source, dest);
        System.out.println(path);
        return path != null;
    }

    public static ArrayList<String> traverse(String source, String dest) {
        ArrayList<String> visited = new ArrayList<>();
        if (source.equals(dest)) {
            return visited;
        }

        Stack stack = new Stack();
        stack.push(source);

        while (!stack.isEmpty()) {
            String current = (String) stack.pop();
            visited.add(current);

            // If we immediately see the destination in our destinations, then done
            if (flights.get(source).contains(dest)) {
                visited.add(dest);
                return visited;
            }

            if (current.equals(dest)) {
                return visited;
            }

            if (visited.size() > 7) {
                return null;
            }

            for (String flight : flights.get(current)) {
                if (!visited.contains(flight)) {
                    stack.add(flight);
                }
            }
        }

        return null;
    }
}




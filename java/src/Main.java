import java.util.HashMap;

/**
 * Kocsen Chung
 * PLC Typed Java assignment
 * CSCI-344
 * Contributors: N/A
 */
public class Main {

    public enum City {
        ROCHESTER, NYC, DC, DETROIT, DENVER, MIAMI, LONDON, BERLIN, PARIS
    }

    public static void main(String[] args) {
        HashMap<City, City[]> flights = new HashMap<City, City[]>();

        flights.put(City.ROCHESTER, new City[]{City.NYC, City.DC, City.DETROIT});
        flights.put(City.NYC, new City[]{City.DC, City.PARIS, City.MIAMI});
        flights.put(City.DC, new City[]{City.MIAMI, City.NYC, City.DENVER});
        flights.put(City.DETROIT, new City[]{City.ROCHESTER, City.DC});
        flights.put(City.DENVER, new City[]{City.DETROIT, City.MIAMI, City.DC});
        flights.put(City.MIAMI, new City[]{City.LONDON});
        flights.put(City.LONDON, new City[]{City.NYC, City.BERLIN, City.PARIS});
        flights.put(City.BERLIN, new City[]{City.MIAMI});

        System.out.println(flights.get(City.LONDON)[1]);
    }

    public static boolean direct(String source, String dest) {
        return false;
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
}




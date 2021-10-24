package com.codedy.roadhelp.util.storage;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.Normalizer;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * -------------------------------------------------------------------------- <br>
 * Các hàm dùng chung toàn hệ thống <br>
 * -------------------------------------------------------------------------- <br><br>
 */
public class Common {

    private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
    private static final Pattern WHITESPACE = Pattern.compile("[\\s]");

    public static String toSlug(String input) {
        String nowhitespace = WHITESPACE.matcher(input).replaceAll("-");
        String normalized = Normalizer.normalize(nowhitespace, Normalizer.Form.NFD);
        String slug = NONLATIN.matcher(normalized).replaceAll("");
        return slug.toLowerCase(Locale.ENGLISH);
    }

    //https://www.baeldung.com/java-round-decimal-number
    public static double roundAvoid(double value, int places) {
        double scale = Math.pow(10, places);
        return Math.round(value * scale) / scale;
    }

    //https://www.baeldung.com/java-round-decimal-number
    //https://stackoverflow.com/questions/2808535/round-a-double-to-2-decimal-places
    public static double round(double value, int places) {
        if (places < 0) throw new IllegalArgumentException();

        // Cách 1: Cách viết code này tương đương 1 dòng return ở dưới.
        //BigDecimal bd = BigDecimal.valueOf(value);
        BigDecimal bd = new BigDecimal(Double.toString(value));
        bd = bd.setScale(places, RoundingMode.HALF_UP);

        return bd.doubleValue();

        // Cách 2: Of course, if you prefer, you can inline the above into a one-liner:
        //return new BigDecimal(value).setScale(places, RoundingMode.HALF_UP).doubleValue();
    }

}

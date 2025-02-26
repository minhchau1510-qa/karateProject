package ui;
import com.intuit.karate.junit5.Karate;

public class uiRunner {
    @Karate.Test 
        Karate testgoogleSearch() {
            return Karate.run("googleSearch").tags("@searchDemoWebsite").relativeTo(getClass());
        }
    @Karate.Test 
    Karate testsauceDemoLogin() {
            return Karate.run("sauceDemoLogin").tags("@logIn-Out").relativeTo(getClass());
        }
    @Karate.Test 
    Karate testaddToCard() {
            return Karate.run("addToCard").tags("@addToCard").relativeTo(getClass());
        }
}


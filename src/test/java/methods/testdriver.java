package methods;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class testdriver {

    public static void main(String args[]) {
        System.setProperty("webdriver.chrome.driver", "C:\\Users\\FH352RA\\IdeaProjects\\ngtp-official315\\webdrivers\\chromedriver\\win32\\99.0.4844.51\\chromedriver.exe");

        // Instantiate a ChromeDriver class.
        WebDriver driver = new ChromeDriver();

        // Launch Website
        driver.navigate().to("http://www.amazon.com/");

    }
}

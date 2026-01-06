package com.miempresa;


import org.junit.Test;
import static org.junit.Assert.assertEquals;
/**
 * Unit test for simple App.
 */
public class AppTest 
{

    @Test
    public void testSumar() {
        App app = new App();
        assertEquals(5, App.sumar(2, 3));
    }
  
}




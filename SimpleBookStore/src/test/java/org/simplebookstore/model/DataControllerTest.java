package org.simplebookstore.model;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author cesar flores
 */
public class DataControllerTest {

    private static final Logger LOG = Logger.getLogger(DataControllerTest.class.getName());
    private static DataController dataController;

    public DataControllerTest() {
    }

    @BeforeClass
    public static void setUpClass() {
        dataController = DataController.getInstance();
    }

    @AfterClass
    public static void tearDownClass() {
        dataController.close();
        dataController = null;
    }

    @Before
    public void setUp() {
        try {
            File f = File.createTempFile("db4otest_", ".yap");
            dataController.initialize(f.getAbsolutePath());
        } catch (IOException ex) {
            LOG.log(Level.SEVERE, null, ex);
        }
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getInstance method, of class DataController.
     */
    @Test
    public void testGetInstance() {
        System.out.println("getInstance");
        DataController result = DataController.getInstance();
        assertNotNull(result);
    }

    /**
     * Test of find method, of class DataController.
     */
    @Test
    public void testFind() {
        System.out.println("find");
        Author author = new Author("Jhon", "Smith");
        dataController.save(author);
        Object result = dataController.find(author);
        assertEquals(author, result);
    }

    /**
     * Test of save method, of class DataController.
     */
    @Test
    public void testSave() {
        System.out.println("save");
        Author author = new Author("Max", "Smith");
        dataController.save(author);
        Object result = dataController.find(author);
        assertEquals(author, result);
    }

    /**
     * Test of update method, of class DataController.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        Author author = new Author("Mary", "Smith");
        dataController.save(author);
        Author saved = (Author) dataController.find(author);
        saved.setLastName("Black");
        dataController.update(saved);
        Object result = dataController.find(saved);
        assertEquals(saved, result);
    }

    /**
     * Test of delete method, of class DataController.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        Author author = new Author("Jhon", "Smith");
        dataController.save(author);
        Object result = dataController.find(author);
        assertNotNull(result);
        dataController.delete(author);
        result = dataController.find(author);
        assertNull(result);
    }

}

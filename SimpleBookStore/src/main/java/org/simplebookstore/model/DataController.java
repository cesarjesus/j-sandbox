package org.simplebookstore.model;

import java.util.logging.Logger;

import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;

/**
 *
 * @author cesar flores
 */
public class DataController {

    private static final Logger LOG = Logger.getLogger(DataController.class.getName());

    private ObjectContainer objectContainer;

    private DataController() {
    }

    public static DataController getInstance() {
        return DataControllerHolder.INSTANCE;
    }

    private static class DataControllerHolder {

        private static final DataController INSTANCE = new DataController();
    }

    public void initialize(String fileName) {
        objectContainer = Db4oEmbedded.openFile(fileName);
    }

    public void close() {
        objectContainer.close();
    }

    public Object find(Object o) {
        Object res = null;
        ObjectSet<Object> result = objectContainer.queryByExample(o);
        if (result.size() > 1) {
            LOG.warning(String.format("More of one element found for:%s", o));
        }
        if (!result.isEmpty()) {
            res = result.get(0);
        }

        return res;
    }

    public void save(Object o) {
        objectContainer.store(o);
    }

    public void update(Object o) {
        objectContainer.store(o);
    }

    public void delete(Object o) {
        objectContainer.delete(o);
    }

}

package com.pino.db.pino.dao;
import com.pino.db.pino.entities.Bar;
import com.pino.db.pino.entities.Drinker;

import java.util.*;

public interface BarDAO {

    /*
    public void delete(Drinker drinker);
    public void insert(String name, int phone, int cc_number, Date cc_expiration);
    public void update(Drinker drinker);
    public Drinker get(String name, int phone);
    */
    public List<Bar> list();

    //void insert(Drinker drinker);
}

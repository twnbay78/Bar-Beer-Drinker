package com.pino.db.pino.dao;

import com.pino.db.pino.entities.Drinker;

import java.sql.Date;
import java.util.*;

public interface BeerDAO {

    //public List<Product> list();

    void insert(Drinker drinker);
}

package com.example.basepostgreswebapp.root.config;


import com.example.basepostgreswebapp.root.model.Faculty;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.type.EnumType;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

public class PostgreSQLEnumType  extends EnumType<Faculty> {
    @Override
    public void nullSafeSet(PreparedStatement ps, Object obj, int index,
                            SharedSessionContractImplementor session) throws HibernateException, SQLException {
        if (obj == null) {
            ps.setNull(index, Types.OTHER);
        } else {
            ps.setObject(index, obj.toString(), Types.OTHER);
        }
    }
}

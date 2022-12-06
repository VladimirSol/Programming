package com.example.bankingsystem.data.branch;

import com.example.bankingsystem.domain.model.Branch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class BranchStorageDB implements BranchStorage {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Branch> getBranchList() {
        String sqlQuery = "Select * from Branch";
        return jdbcTemplate.query(sqlQuery, new BranchRowMapper());
    }

    @Override
    public List<Branch> getBranchIdByName(String branchName) {
        String sqlQuery = "Select * from Branch where Branch.Name Like ?";
        return jdbcTemplate.query(sqlQuery, new BranchRowMapper(), branchName);
    }
}

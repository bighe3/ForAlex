package com.hjh.communitysadministrativesystem.dao;

import com.hjh.communitysadministrativesystem.Entity.OperationLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OperationLogDao {
    void insert(OperationLog log);
    List<OperationLog> selectAll();
    List<OperationLog> selectByOperatorId(Integer operatorId);
    List<OperationLog> selectByOperatorType(String operatorType);
    List<OperationLog> findLogsByType(String type);
    List<OperationLog> findLogsByTypeAndOname(String type, String oname);
    List<OperationLog> findAllLogs();
} 
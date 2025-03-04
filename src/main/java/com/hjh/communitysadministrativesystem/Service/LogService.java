package com.hjh.communitysadministrativesystem.Service;

import com.hjh.communitysadministrativesystem.Entity.OperationLog;

import java.util.List;

public interface LogService {
    void recordLog(Integer operatorId, 
                  String operatorType,
                  String operatorName,
                  String operationType,
                  String operationDetail);
                  
    List<OperationLog> getAllLogs();
    List<OperationLog> getLogsByOperator(Integer operatorId);
    List<OperationLog> getLogsByType(String operatorType);

    List<OperationLog> findLogsByType(String type);
    List<OperationLog> findLogsByTypeAndOname(String type, String oname);
    List<OperationLog> findAllLogs();

}

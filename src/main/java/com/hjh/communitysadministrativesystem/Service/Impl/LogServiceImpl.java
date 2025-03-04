package com.hjh.communitysadministrativesystem.Service.Impl;

import com.hjh.communitysadministrativesystem.Service.LogService;
import com.hjh.communitysadministrativesystem.dao.OperationLogDao;
import com.hjh.communitysadministrativesystem.Entity.OperationLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class LogServiceImpl implements LogService {


    @Autowired
    private OperationLogDao operationLogDao;

    @Override
    public void recordLog(Integer operatorId, 
                         String operatorType,
                         String operatorName,
                         String operationType,
                         String operationDetail) {
        OperationLog log = new OperationLog();
        log.setOperatorId(operatorId);
        log.setOperatorType(operatorType);
        log.setOperatorName(operatorName);
        log.setOperationType(operationType);
        log.setOperationDetail(operationDetail);
        log.setOperationTime(new Date());
        log.setStatus("success");
        
        operationLogDao.insert(log);
    }
    
    @Override
    public List<OperationLog> getAllLogs() {

        System.out.println("logs:" + operationLogDao.selectAll());
        return operationLogDao.selectAll();
    }
    
    @Override
    public List<OperationLog> getLogsByOperator(Integer operatorId) {
        return operationLogDao.selectByOperatorId(operatorId);
    }
    
    @Override
    public List<OperationLog> getLogsByType(String operatorType) {
        return operationLogDao.selectByOperatorType(operatorType);
    }
    @Override
    public List<OperationLog> findLogsByType(String type) {
        return operationLogDao.findLogsByType(type);
    }

    @Override
    public List<OperationLog> findLogsByTypeAndOname(String type, String oname) {
        return operationLogDao.findLogsByTypeAndOname(type, oname);
    }

    @Override
    public List<OperationLog> findAllLogs() {
        return operationLogDao.findAllLogs();
    }

}

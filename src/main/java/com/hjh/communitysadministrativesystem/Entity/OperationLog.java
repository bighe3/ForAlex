package com.hjh.communitysadministrativesystem.Entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OperationLog {
    private Long id;
    private Integer operatorId;
    private String operatorType;
    private String operatorName;
    private String operationType;
    private String operationDetail;
    private Date operationTime;
    private String status;
} 
package com.iss.system.log.entity;

import com.orm.commons.utils.IdEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "t_s_operate_log")
public class OperateLog extends IdEntity {

    @Column(name = "user_id", columnDefinition = "varchar(40) comment '用户ID'")
    private String userId;

    @Column(columnDefinition = "用户名")
    private String opName;

    @Column(columnDefinition = "操作记录", length = 3000)
    private String message;

    @Column(columnDefinition = "异常记录")
    private String exception;

    @Column(columnDefinition = "操作时间")
    private Date opTime;

    @Column(columnDefinition = "备注")
    private String remarks;

    @Column(columnDefinition = "状态:1.未解决 2.已解决")
    private Long solveStatus;

    @Column(columnDefinition = "预留字段1")
    private String standBy1;

    @Column(columnDefinition = "预留字段2")
    private String standBy2;

    @Column(columnDefinition = "预留字段3")
    private String standBy3;

    //附加字段
    private String opTimeStart;//操作时间从

    private String opTimeEnd;//操作时间至

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getOpName() {
        return opName;
    }

    public void setOpName(String opName) {
        this.opName = opName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getException() {
        return exception;
    }

    public void setException(String exception) {
        this.exception = exception;
    }

    public Date getOpTime() {
        return opTime;
    }

    public void setOpTime(Date opTime) {
        this.opTime = opTime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Long getSolveStatus() {
        return this.solveStatus;
    }

    public void setSolveStatus(Long solveStatus) {
        this.solveStatus = solveStatus;
    }

    public String getStandBy1() {
        return standBy1;
    }

    public void setStandBy1(String standBy1) {
        this.standBy1 = standBy1;
    }

    public String getStandBy2() {
        return standBy2;
    }

    public void setStandBy2(String standBy2) {
        this.standBy2 = standBy2;
    }

    public String getStandBy3() {
        return standBy3;
    }

    public void setStandBy3(String standBy3) {
        this.standBy3 = standBy3;
    }

    public String getOpTimeStart() {
        return opTimeStart;
    }

    public void setOpTimeStart(String opTimeStart) {
        this.opTimeStart = opTimeStart;
    }

    public String getOpTimeEnd() {
        return opTimeEnd;
    }

    public void setOpTimeEnd(String opTimeEnd) {
        this.opTimeEnd = opTimeEnd;
    }

}

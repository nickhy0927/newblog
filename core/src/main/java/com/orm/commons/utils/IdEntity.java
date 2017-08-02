package com.orm.commons.utils;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

@MappedSuperclass
@Access(AccessType.PROPERTY)
public class IdEntity {
    protected Date createTime = new Date();
    protected String id;// ID
    protected Date updateTime;
    protected Boolean disabled = Boolean.FALSE;

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        IdEntity other = (IdEntity) obj;
        if (getId() == null) {
            return false;
        }
        return getId().equals(other.getId());
    }

    @Column(updatable = false)
    public Date getCreateTime() {
        return createTime;
    }

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid2")
    public String getId() {
        return id;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }
}
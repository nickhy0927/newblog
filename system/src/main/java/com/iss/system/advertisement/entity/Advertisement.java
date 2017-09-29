package com.iss.system.advertisement.entity;

import com.iss.system.attachment.entity.Attachment;
import com.iss.system.user.entity.User;
import com.orm.commons.utils.IdEntity;

import javax.persistence.*;

/**
 * Created by yuanhuangd on 2017/9/29.
 *
 * @see com.iss.system.advertisement.entity.Advertisement
 * 广告管理
 */
@Entity
@Table(name = "t_s_adv")
public class Advertisement extends IdEntity {
    private String title;
    private String url;
    private String sort;
    private Attachment attachment;
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "attach_id")
    public Attachment getAttachment() {
        return attachment;
    }

    public void setAttachment(Attachment attachment) {
        this.attachment = attachment;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pid")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}

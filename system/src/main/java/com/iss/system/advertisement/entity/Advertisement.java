package com.iss.system.advertisement.entity;

import com.iss.system.attachment.entity.Attachment;
import com.iss.system.user.entity.User;
import com.orm.commons.utils.IdEntity;
import com.orm.commons.utils.SysContants;

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
    private String shows = SysContants.IsDisplay.NO;
    private Attachment attachment;
    private User user;

    public String getShows() {
		return shows;
	}
    
    public void setShows(String shows) {
		this.shows = shows;
	}
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "attach_id")
    public Attachment getAttachment() {
        return attachment;
    }

    public void setAttachment(Attachment attachment) {
        this.attachment = attachment;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
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

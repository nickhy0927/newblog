package com.iss.util.substring;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
public class SubString extends TagSupport {
    private Integer len;
    private String content;

    public int getLen() {
        return len;
    }

    public void setLen(int len) {
        this.len = len;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public int doEndTag() throws JspException {
        String c = getContent();
        if (getLen() > 0)
            if (StringUtils.isNotEmpty(getContent())) {
                c = c.length() < getLen() ? c : c.substring(0, getLen()) + "...";
            }
        try {
            pageContext.getOut().println(c);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }
}

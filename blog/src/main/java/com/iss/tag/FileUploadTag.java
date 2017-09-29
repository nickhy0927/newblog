package com.iss.tag;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yuanhuangd on 2017/9/29.
 */
public class FileUploadTag extends BodyTagSupport {

    private Map<String, Object> model = new HashMap<String, Object>();

    public Map<String, Object> getMap() {
        return model;
    }

    public void setMap(Map<String, Object> model) {
        this.model = model;
    }

    @Override
    public int doEndTag() throws JspException {
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        String ctx = request.getContextPath();
        this.model.put("ctx", ctx);
        try {
            Configuration configuration = new Configuration();
            configuration.setClassForTemplateLoading(FileUploadTag.class, "template");
            Template template = configuration.getTemplate("fileUpload.ftl", "UTF-8");
            StringWriter writer = new StringWriter();
            template.process(this.model, writer);
            this.pageContext.getOut().write(writer.toString());
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        return EVAL_PAGE;
    }
}

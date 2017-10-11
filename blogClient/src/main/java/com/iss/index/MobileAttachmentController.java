package com.iss.index;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.iss.listener.SingletonUser;
import com.iss.system.attachment.entity.Attachment;
import com.iss.system.attachment.service.AttachmentService;
import com.iss.system.user.entity.User;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.FileTools;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.MyConfig;
import com.orm.commons.utils.ObjectTools;

/**
 * Created by yuanhuangd on 2017/9/29.
 */
@Controller
@Scope("prototype")
public class MobileAttachmentController {
    @Autowired
    private AttachmentService attachmentService;

    private MessageObject message = new MessageObject();
    private static String tempDir = "";


    @RequestMapping(value = "/mobile/attachment/copy", method = RequestMethod.POST)
    @ResponseBody
    public String copy(MultipartHttpServletRequest request) {
        List<Attachment> attachments = attachmentService.fileUpload(request);
        return new JsonMapper().toJson(attachments);
    }


    @RequestMapping(value = "/mobile/attachment/fileUpload", method = RequestMethod.POST)
    public void fileUpload(HttpServletRequest request, HttpServletResponse response) {
    	User user = SingletonUser.getContextUser(request);
        String realPath = request.getSession().getServletContext().getRealPath("/upload/attachment" +  + File.separatorChar + user.getId());
        if (!new File(realPath).exists()) {
            new File(realPath).mkdirs();
        }
        String versionIds = "";
        String[] values = request.getParameterValues("myfiles");
        try {
            if (values != null && values.length > 0) {
                for (String filePath : values) {
                    File file = new File(filePath);
                    FileInputStream fin = new FileInputStream(file);
                    String contentType = new MimetypesFileTypeMap().getContentType(file);
                    long files = FileTools.getFileSizes(file);
                    String fileSize = FileTools.formetFileSize(files);//文件的大小
                    String suffix = FileTools.getFileExtension(file.getName());//文件的后缀
                    String name = file.getName();
                    name = name.substring(0, name.lastIndexOf("."));
                    String filename = UUID.randomUUID().toString().replaceAll("-", "") + "." + suffix;
                    FileUtils.copyInputStreamToFile(fin, new File(realPath, filename));
                    Attachment attachment = new Attachment(name, "/upload/attachment/" + filename, contentType, fileSize, suffix);
                    attachment = attachmentService.save(attachment);
                    versionIds += attachment.getId() + ",";
                }
                if (StringUtils.isNotEmpty(versionIds)) {
                    versionIds = versionIds.substring(0, versionIds.length() - 1);
                }
                message.setObject(versionIds);
                message.setInforMessage("上传成功");
                tempDir = request.getSession().getServletContext().getRealPath("/upload/temp");
                HashMap<String, Object> hashMap = MyConfig.getConfig();
                Object object = hashMap.get("upload");
                if (object != null) {
                    tempDir = object.toString();
                    tempDir += File.separatorChar + user.getId();
                }
                if (!new File(tempDir).exists()) {
                    new File(tempDir).mkdirs();
                }
                FileTools.delFolder(tempDir);
            } else {
                message.setErrorMessage("请先选择文件，再上传");
            }
        } catch (Exception e) {
            e.printStackTrace();
            message.setErrorMessage("上传文件失败");
        } finally {
            try {
                response.getWriter().write(message.getJsonMapper(message));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

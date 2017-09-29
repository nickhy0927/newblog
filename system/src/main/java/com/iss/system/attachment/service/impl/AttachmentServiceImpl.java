package com.iss.system.attachment.service.impl;

import com.iss.system.attachment.entity.Attachment;
import com.iss.system.attachment.service.AttachmentService;
import com.orm.commons.service.impl.DefaultAbstractService;
import com.orm.commons.utils.FileTools;
import com.orm.commons.utils.MyConfig;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Created by yuanhuangd on 2017/8/17.
 */
@Service
public class AttachmentServiceImpl extends DefaultAbstractService<Attachment, String> implements AttachmentService {
    private static String tempDir = "";

    public List<Attachment> fileUpload(MultipartHttpServletRequest request) {
        tempDir = request.getSession().getServletContext().getRealPath("/upload/temp");
        HashMap<String, Object> hashMap = MyConfig.getConfig();
        Object object = hashMap.get("upload");
        if (object != null) {
            tempDir = object.toString();
        }
        if (!new File(tempDir).exists()) {
            new File(tempDir).mkdirs();
        }
        Iterator<String> iterator = request.getFileNames();
        List<Attachment> versions = new ArrayList<>();
        while (iterator.hasNext()) {
            MultipartFile multipartFile = request.getFile(iterator.next());
            String type = multipartFile.getContentType();
            String name = multipartFile.getOriginalFilename();
            float size = (float) (multipartFile.getSize() / (1024));
            AtomicReference<String> fileSize = new AtomicReference<>();
            if (size > 1024 && size < 1024 * 1024) {
                fileSize.set((size / 1024) + "MB");
            } else if (size >= 1024 * 1024) {
                fileSize.set((size / 1024 / 1024) + "GB");
            } else {
                fileSize.set(size + "KB");
            }
            String path = tempDir + File.separatorChar + name;
            Attachment version = new Attachment(name, new File(path).getPath(), type, fileSize.get(), FileTools.getFileExtension(name));
            try {
                FileUtils.copyInputStreamToFile(multipartFile.getInputStream(), new File(tempDir, multipartFile.getOriginalFilename()));
            } catch (IOException e) {
                e.printStackTrace();
            }
            versions.add(version);
        }
        return versions;
    }
}

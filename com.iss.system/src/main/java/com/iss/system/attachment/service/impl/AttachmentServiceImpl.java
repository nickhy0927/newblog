package com.iss.system.attachment.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.iss.listener.SingletonUser;
import com.iss.system.attachment.entity.Attachment;
import com.iss.system.attachment.service.AttachmentService;
import com.iss.system.user.entity.User;
import com.orm.commons.service.impl.DefaultAbstractService;
import com.orm.commons.utils.FileTools;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.MyConfig;

/**
 * Created by yuanhuangd on 2017/8/17.
 */
@Service
public class AttachmentServiceImpl extends DefaultAbstractService<Attachment, String> implements AttachmentService {
	private static String tempDir = "";

	public List<Attachment> fileUpload(MultipartHttpServletRequest request) {
		User user = SingletonUser.getContextUser(request);
		tempDir = request.getSession().getServletContext().getRealPath("/upload/temp" + File.separatorChar + user.getId());
		HashMap<String, Object> hashMap = MyConfig.getConfig();
		Object object = hashMap.get("upload");
		if (object != null) {
			tempDir = object.toString() + File.separatorChar + "temp";
			tempDir += File.separatorChar + user.getId();
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
			Attachment version = new Attachment(name, new File(path).getPath(), type, fileSize.get(),
					FileTools.getFileExtension(name));
			try {
				FileUtils.copyInputStreamToFile(multipartFile.getInputStream(),
						new File(tempDir, multipartFile.getOriginalFilename()));
			} catch (IOException e) {
				e.printStackTrace();
			}
			versions.add(version);
		}
		return versions;
	}

	public MessageObject fileUpload(HttpServletRequest request, String filePath,String id) {
		MessageObject message = MessageObject.getDefaultMessageObjectInstance();
		String realPath = request.getSession().getServletContext().getRealPath("/upload/attachment/" + id);
		HashMap<String, Object> hashMap = MyConfig.getConfig();
		Object object = hashMap.get("upload");
		if (object != null) {
			realPath = object.toString();
		}
		if (!new File(realPath).exists()) {
			new File(realPath).mkdirs();
		}
		try {
			if (StringUtils.isNotEmpty(filePath)) {
				File file = new File(filePath);
				FileInputStream fin = new FileInputStream(file);
				String contentType = new MimetypesFileTypeMap().getContentType(file);
				long files = FileTools.getFileSizes(file);
				String fileSize = FileTools.formetFileSize(files);// 文件的大小
				String suffix = FileTools.getFileExtension(file.getName());// 文件的后缀
				String name = file.getName();
				name = name.substring(0, name.lastIndexOf("."));
				String filename = UUID.randomUUID().toString().replaceAll("-", "") + "." + suffix;
				String pString = "attachment/" + dateFormate("yyyyMMdd") + "/" + filename;
				realPath += "attachment/" + dateFormate("yyyyMMdd") + "/";
				FileUtils.copyInputStreamToFile(fin, new File(realPath, filename));
				Attachment attachment = new Attachment(name, pString, contentType, fileSize, suffix);
				message.setObject(save(attachment));
				message.ok("上传附件成功", attachment);
				FileTools.delAllFile(filePath);
			} else {
				message.error("请先选择文件，再上传");
			}
		} catch (Exception e) {
			message.error("上传文件失败");
		}
		return message;
	}
	
	private String dateFormate(String patten) {
		SimpleDateFormat sdf = new SimpleDateFormat(patten);
		String format = sdf.format(new java.util.Date());
		return format;
	}
}

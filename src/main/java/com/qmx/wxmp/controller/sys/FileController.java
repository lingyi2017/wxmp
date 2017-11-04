package com.qmx.wxmp.controller.sys;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.qmx.wxmp.common.utils.StringUtils;
import com.qmx.wxmp.controller.BaseController;

/**
 * <p>
 * Title: 文件上传、下载 controller
 * </p>
 * 
 * <p>
 * Description: 包括图像、文件上传、显示等
 * </p>
 * 
 * <p>
 * Copyright: Copyright (c) 2015 by Free Lancer
 * </p>
 * 
 * <p>
 * Company: Free Lancer
 * </p>
 * 
 * @author: free lance
 * @Email: free.lance@Gmail.com
 * @version: 1.0
 * @date: 2015-1-13 上午11:10:25
 * 
 */
@Controller
@RequestMapping(value = "/file")
public class FileController extends BaseController {

	// @Autowired
	// private SystemService systemService;

	/**
	 * <p>
	 * Title：文件上传（图片、文档和视频等）
	 * <p/>
	 * <p>
	 * Description：这里这里用的是MultipartFile
	 * file参数,所以前台就要用<input type="file" name="file"/>。
	 * 上传文件完毕后返回给前台[0`filepath],0表示上传成功(后跟上传后的文件路径)；1表示失败(后跟失败描述)。filepath不包含项目名称：/upload/20171104174407408h2.jpg
	 * <p/>
	 *
	 *
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/upload")
	public String upload(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		if (file.isEmpty()) {
			out.print("1`请选择文件后上传");
			out.flush();
			return null;
		}

		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		response.setContentType("text/plain; charset=UTF-8");
		String originalFilename = file.getOriginalFilename();
		String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
		String newFilename = getUploadCurrentTime() + "." + suffix;
		try {
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath, newFilename));
		} catch (IOException e) {
			logger.error("文件[" + originalFilename + "]上传失败,堆栈轨迹如下", e);
			e.printStackTrace();
			out.print("1`文件上传失败，请重试！！");
			out.flush();
			return null;
		}
		out.print("0`" + "/upload/" + newFilename);
		out.flush();
		return null;

	}



	/**
	 * <p>
	 * Title：上传用户头像
	 * <p/>
	 * <p>
	 * Description：这里这里用的是MultipartFile
	 * file参数,所以前台就要用<input type="file" name="file"/>。
	 * 上传文件完毕后返回给前台[0`filepath],0表示上传成功(后跟上传后的文件路径)；1表示失败(后跟失败描述)。filepath包含项目名称：/wxmp/upload/20171104174407408h2.jpg
	 * <p/>
	 * 
	 * 
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/upload/headPortrait")
	public String uploadHeadPortrait(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {
		// 如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
		// 这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		// 设置响应给前台内容的数据格式,在springmvc配置文件实现
		response.setContentType("text/plain; charset=UTF-8");
		// 设置响应给前台内容的PrintWriter对象
		PrintWriter out = response.getWriter();
		// 上传文件的原名(即上传前的文件名字)
		String originalFilename = null;
		String newFilename = null;
		// 如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解
		// 如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解
		// 上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是file,否则参数里的file无法获取到所有上传的文件
		if (file.isEmpty()) {
			out.print("1`请选择文件后上传");
			out.flush();
			return null;
		} else {
			originalFilename = file.getOriginalFilename();
			newFilename = getUploadCurrentTime() + originalFilename; // 重新命名上传头像名称

			logger.info("文件原名: " + originalFilename);
			logger.info("文件名称: " + file.getName());
			logger.info("文件长度: " + file.getSize());
			logger.info("文件类型: " + file.getContentType());
			logger.info("新文件名: " + newFilename);
			logger.info("========================================");
			try {
				// 这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
				// 此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
				FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath, newFilename));
			} catch (IOException e) {
				logger.error("文件[" + originalFilename + "]上传失败,堆栈轨迹如下", e);
				// e.printStackTrace();
				out.print("1`文件上传失败，请重试！！");
				out.flush();
				return null;
			}
		}
		// 此时在Windows下输出的是[D:\\OpenSource\\apache-tomcat-7.0.57\\webapps\\mserver\\upload\愤怒的小鸟.jpg]
		// logger.info(realPath + "\\" + originalFilename);
		// 此时在Windows下输出的是[/AjaxFileUpload/upload/愤怒的小鸟.jpg]
		// logger.info(request.getContextPath() + "/upload/" + originalFilename);
		// 不推荐返回[realPath + "\\" + originalFilename]的值
		// 因为在Windows下<img src="file:///D:/aa.jpg">能被firefox显示,而<img
		// src="D:/aa.jpg">firefox是不认的
		// out.print("0`" + "/upload/" + newFilename);
		out.print("0`" + request.getContextPath() + "/upload/" + newFilename);
		out.flush();
		return null;
	}



	/**
	 * 文件下载 文件路径格式（不含项目名称）：/upload/20171104174407408h2.jpg
	 *
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/download")
	public String download(HttpServletRequest request, HttpServletResponse response) {

		String paramPath = request.getParameter("path");
		if (StringUtils.isEmpty(paramPath)) {
			return null;
		}

		try {
			String path = new String(paramPath.getBytes("ISO8859-1"), "UTF-8");
			String realPath = request.getSession().getServletContext().getRealPath("/") + File.separator + path;
			File file = new File(realPath);
			InputStream inputStream = new FileInputStream(realPath);
			response.reset();
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
			OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			byte data[] = new byte[1024];
			while (inputStream.read(data, 0, 1024) >= 0) {
				outputStream.write(data);
			}
			outputStream.flush();
			outputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}
		return null;

	}



	/**
	 * 将图片读到页面上 TODO
	 * 
	 * @param request
	 *            内置对象
	 * @param response
	 *            内置对象
	 * 
	 * @return
	 * 
	 */
	@RequestMapping("/dumpImage")
	public void dumpImage(HttpServletRequest request, HttpServletResponse response) {
		String paramPath = request.getParameter("path");
		String path = "";
		if (paramPath == null) {
			path = (String) request.getAttribute("path");
		} else {
			try {
				path = new String(paramPath.getBytes("ISO8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// e.printStackTrace();
				logger.error(e.getMessage(), e);
			}
		}
		String picPath = request.getSession().getServletContext().getRealPath("/") + File.separator + path;
		InputStream in = null;
		BufferedInputStream bis = null;
		OutputStream out = null;
		BufferedOutputStream bos = null;

		// 判断文件是否存在
		File file = new File(picPath);
		if (!file.exists() || file.isDirectory()) {
			return;
		}
		try {
			in = new FileInputStream(picPath);
			bis = new BufferedInputStream(in);

			byte[] data = new byte[1024];
			int bytes = 0;
			out = response.getOutputStream();
			bos = new BufferedOutputStream(out);
			while ((bytes = bis.read(data, 0, data.length)) != -1) {
				bos.write(data, 0, bytes);
			}
			bos.flush();
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error(e.getMessage(), e);
		} finally {
			try {
				if (bos != null)
					bos.close();
				if (out != null)
					out.close();
				if (bis != null)
					bis.close();
				if (in != null)
					in.close();
			} catch (IOException e) {
				// e.printStackTrace();
				logger.error(e.getMessage(), e);
			}
		}
	}



	/**
	 * 当前上传时间
	 * 
	 * @return
	 */
	private String getUploadCurrentTime() {
		return new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
	}

}

package com.yougo.servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 列出web服务器上�?有上传的文件
 * @author Alpha
 *
 */
public class ListFileServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取上传文件的目�?
		String uploadFilePath = this.getServletContext().getRealPath(
				"/WEB-INF/upload");
		// 存储要下载的文件�?
		Map<String, String> fileNameMap = new HashMap<String, String>();
		// 递归遍历filepath目录下的�?有文件和目录，将文件的文件名存储到map集合�?
		listfile(new File(uploadFilePath), fileNameMap);// File既可以代表一个文件也可以代表�?个目�?
		// 将Map集合发�?�到listfile.jsp页面进行显示
		request.setAttribute("fileNameMap", fileNameMap);
		request.getRequestDispatcher("/listfile.jsp")
				.forward(request, response);
	}


	/**
	 * 递归遍历指定目录下的�?有文�?
	 * @param file 即代表一个文件，也代表一个文件目�?
	 * @param map 存储文件名的Map集合
	 */
	public void listfile(File file, Map<String, String> map) {
		// 如果file代表的不是一个文件，而是�?个目�?
		if (!file.isFile()) {
			// 列出该目录下的所有文件和目录
			File files[] = file.listFiles();
			// 遍历files[]数组
			for (File f : files) {
				// 递归
				listfile(f, map);
			}
		} else {
			/**
			 * 处理文件名，上传后的文件是以uuid_文件名的形式去重新命名的，去除文件名的uuid_部分
			 * file.getName().indexOf
			 * ("_")�?索字符串中第�?次出�?"_"字符的位置，如果文件名类似于�?9349249849-88343-8344_阿_凡_�?.avi
			 * 那么file.getName().substring(file.getName().indexOf("_")+1)
			 * 处理之后就可以得到阿_凡_�?.avi部分
			 */
			String realName = file.getName().substring(
					file.getName().indexOf("_") + 1);
			// file.getName()得到的是文件的原始名称，这个名称是唯�?的，因此可以作为key，realName是处理过后的名称，有可能会重�?
			map.put(file.getName(), realName);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
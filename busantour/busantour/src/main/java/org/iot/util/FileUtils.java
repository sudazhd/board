package org.iot.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.iot.domain.EpilogueVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {

	private static final Logger logger = LoggerFactory.getLogger(FileUtils.class);

	private static final String filePath = "E:\\busan\\busantour\\src\\main\\webapp\\resources\\upload\\";

	public List<Map<String, Object>> parseInsertFileInfo(EpilogueVO epilogueVO, MultipartHttpServletRequest mpRequest)
			throws Exception {

		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		String org_file_name = null;
		String originalFileExtension = null;
		String stored_file_name = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		int ep_no = epilogueVO.getEp_no();

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				org_file_name = multipartFile.getOriginalFilename();
				originalFileExtension = org_file_name.substring(org_file_name.lastIndexOf("."));
				stored_file_name = getRandomString() + originalFileExtension;

				file = new File(filePath + stored_file_name);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("ep_no", ep_no);
				listMap.put("org_file_name", org_file_name);
				listMap.put("stored_file_name", stored_file_name);
				listMap.put("file_size", multipartFile.getSize());
				list.add(listMap);
			}
		}

		return list;
	}

	public List<Map<String, Object>> parseUpdateFileInfo(EpilogueVO epilogue, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null; 
		String org_file_name = null; 
		String originalFileExtension = null; 
		String stored_file_name = null; 
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 
		int ep_no = epilogue.getEp_no();
		
		while(iterator.hasNext()){ 
			multipartFile = mpRequest.getFile(iterator.next()); 
			if(multipartFile.isEmpty() == false){ 
				org_file_name = multipartFile.getOriginalFilename(); 
				originalFileExtension = org_file_name.substring(org_file_name.lastIndexOf(".")); 
				stored_file_name = getRandomString() + originalFileExtension; 
				multipartFile.transferTo(new File(filePath + stored_file_name)); 
				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("ep_no", ep_no);
				listMap.put("org_file_name", org_file_name);
				listMap.put("stored_file_name", stored_file_name);
				listMap.put("file_size", multipartFile.getSize());
				list.add(listMap); 
				System.out.println("list : "+list);
			} 
		}
		if(files != null && fileNames != null){ 
			for(int i = 0; i<fileNames.length; i++) {
					listMap = new HashMap<String,Object>();
                    listMap.put("IS_NEW", "N");
					listMap.put("FILE_NO", files[i]); 
					list.add(listMap); 
			}
		}
		return list;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}

package com.qmx.wxmp.dto.category;

import java.util.List;

/**
 * 微信端，菜单跳转后展示的服务列表
 * @author itismin
 *
 */
public class ServiceCategoryDTO {

	private String serviceCategoryId;
	
	private String serviceCategoryName;
	
	private List<BasicServiceDTO> basicServiceDTOs;

	public String getServiceCategoryId() {
		return serviceCategoryId;
	}

	public void setServiceCategoryId(String serviceCategoryId) {
		this.serviceCategoryId = serviceCategoryId;
	}

	public String getServiceCategoryName() {
		return serviceCategoryName;
	}

	public void setServiceCategoryName(String serviceCategoryName) {
		this.serviceCategoryName = serviceCategoryName;
	}

	public List<BasicServiceDTO> getBasicServiceDTOs() {
		return basicServiceDTOs;
	}

	public void setBasicServiceDTOs(List<BasicServiceDTO> basicServiceDTOs) {
		this.basicServiceDTOs = basicServiceDTOs;
	}
	
	
}

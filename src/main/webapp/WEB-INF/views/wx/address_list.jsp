<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<title>地址编辑</title>
		<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
		<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
		<link rel="stylesheet" href="${ctx}/static/css/weixin/style.css">
		<style type="text/css">
			a:link {   
				color: #000000;   
				text-decoration: none;   
			}   
			a:visited {   
				color: #000000;   
				text-decoration: none;   
			}   
			a:hover {   
				color: #999999;   
				text-decoration: underline;   
			} 
		</style>
	</head>
	<body style="font-family:'黑体';background-color: #F5F5F5;">
		<div class="weui-cells" style="margin-top: -0.7%;margin-bottom: -5px;">
			 <div class="weui-cell">
			   <div class="weui-cell__bd" style="text-align:center;height: 40px;">
			    	<div style="float: left;position: absolute;left: 3%;top: 33%;font-size: larger;"></div>
					<div style="float: left;position: absolute;left: 40%;top: 35%;text-align: center;font-size: large;">地址列表</div>
			   		<div style="float: left;position: absolute;left: 85%;top: 35%;">
			   			<a href="${ctx}/dcxt/accountaddress/wx_address_edit"><img style="width: 40px;height: 40px;" src="${ctx }/static/images/wx/icon-add.png"></a>
			   		</div>
			   </div>
			 </div>
			 <div class="weui-panel address-box">
				 <c:forEach items="${addressList }" var="entity">
	    			<div class="weui-panel__bd">
				      <div class="weui-media-box weui-media-box_text address-list-box">
				        <h4 class="weui-media-box__title"><span style=" display:-moz-inline-box; display:inline-block; width: 30%">${entity.person }</span><span>${entity.phone }</span></h4>
				        <p class="weui-media-box__desc address-txt">${entity.provence }${entity.city }${entity.county }${entity.address }</p>
				      	<div class="weui-cells weui-cells_checkbox commg">
				      		<div style="width: 50%;float: left;">
	    					<label class="weui-cell weui-check__label" for="${entity.id }">
	    						<c:if test="${entity.isDefault == 1 }">
	    							<div class="weui-cell__hd" >
								        <input type="checkbox" class="weui-check" name="defalut_address" id="${entity.id }" checked="checked">
								        <i class="weui-icon-checked"></i>
								      </div>
								      <div class="weui-cell__bd">
								      	<p>默认地址</p>
								      
								      </div>
	    						</c:if>
						      	<c:if test="${entity.isDefault == 0 }">
	    							<div class="weui-cell__hd" >
								        <input type="checkbox" class="weui-check" name="defalut_address" id="${entity.id }" >
								        <i class="weui-icon-checked"></i>
								      </div>
								      <div class="weui-cell__bd">
								      	<p>设为默认</p>
								      
								      </div>
	    						</c:if>
	      						
	    					</label>
	    					</div>
	    					<div style="width: 50%;float: left;">
	    						<a href="${ctx}/dcxt/accountaddress/wx_address_edit?id=${entity.id}">
					        		<img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/icon-edit.png">
					        	</a>
					        	<a href="javascript:del_address('${entity.id }')">
					        		<img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/icon-dele.png">
					        	</a>
	    					</div>
  						</div>
				        <%-- <div style="width: 50%;float: right;text-align: right;">
				        	<a href="${ctx}/dcxt/accountaddress/wx_address_edit?id=${entity.id}">
				        		<img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/icon-edit.png">
				        	</a>
				        	<a href="javascript:del_address('${entity.id }')">
				        		<img style="width: 30px;height: 30px;" src="${ctx }/static/images/wx/icon-dele.png">
				        	</a>
				        </div> --%>
				      </div>
				    </div>
				 </c:forEach>
			 </div>
			 
		</div>
		
		<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/weixin/fastclick.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/weixin/city-picker-now.js"></script>
		<script type="text/javascript">
		function del_address(id){
	    	  $.confirm({
	    		  title: '确认删除',
	    		  text: '确定删除此收货地址吗?',
	    		  onOK: function () {
	    			  $.ajax({
	    		            type:"POST",
	    		            async:false,
	    		            url:"${ctx}/dcxt/accountaddress/wx_del",
	    		            data:{
	    		            	id : id
	    		            },
	    		            datatype: "json",
	    		            success:function(data){
	    		            	if(data){
	    		            		$.toptip("删除成功",3000,"success");
	    		            		window.location.href = "${ctx}/dcxt/accountaddress/wx_address_list";
	    		            	}
	    		            },
	    		            error: function(){
	    		                //请求出错处理
	    		            	$.toptip("修改失败");
	    		            }         
	    		         });
	    		  },
	    		  onCancel: function () {
	    		  }
	    		});
	      }
		</script>
	</body>
</html>
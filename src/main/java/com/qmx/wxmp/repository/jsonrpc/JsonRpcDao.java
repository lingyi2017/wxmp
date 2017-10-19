package com.qmx.wxmp.repository.jsonrpc;

import java.net.MalformedURLException;
import java.net.URL;

import javax.annotation.PostConstruct;

import com.qmx.wxmp.common.config.Global;
import com.qmx.wxmp.vo.jsonrpc.JsonRpc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.googlecode.jsonrpc4j.JsonRpcHttpClient;

/**
 * Created by wdl on 14-11-5.
 */
@Repository
public class JsonRpcDao {
    private static Logger logger = LoggerFactory.getLogger(JsonRpcDao.class);

    private String jsonRpcUrl;

    @PostConstruct
    public void init() {
        // 使用公共方法读取项目属性值
        jsonRpcUrl = Global.getConfig("cdcy.url").trim();

        if (jsonRpcUrl == null || jsonRpcUrl.trim().equals("")) {
            logger.error("未配置参数jsonrpc.url");
            throw new NullPointerException("未配置参数jsonrpc.url");
        } else {
            logger.debug("request地址:" + jsonRpcUrl);
        }
    }

    public Object request(JsonRpc request) {
        try {
            request.newTag();

            String requestStr = new ObjectMapper().writeValueAsString(request.getParams());
            logger.debug("request地址:" + jsonRpcUrl);
            logger.debug("request方法:" + request.getMethod());
            logger.debug("request数据:" + requestStr);

            JsonRpcHttpClient client = new JsonRpcHttpClient(new URL(jsonRpcUrl));

            Object response = client.invoke(request.getMethod(), request.getParams(), Object.class);
            logger.debug("response数据:" + new ObjectMapper().writeValueAsString(response));

            return response;
        } catch (MalformedURLException e) {
            logger.error("不能被解析的url", e);
        } catch (JsonProcessingException e) {
            logger.error(e.toString());
        }catch (Throwable e) {
            logger.error("远程调用方法出错或者对象格式无法解析", e);
            throw new RuntimeException(e);
        }
        return null;
    }
}

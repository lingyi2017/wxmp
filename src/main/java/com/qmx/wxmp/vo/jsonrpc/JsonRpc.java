package com.qmx.wxmp.vo.jsonrpc;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@SuppressWarnings({ "rawtypes", "unchecked" })
public class JsonRpc {

    private String method;

    private Map<String, String> params;

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Map getParams() {
        return params;
    }

    public void setParams(Map params) {
        this.params = params;
    }

    public void newTag() {
        if (params == null) {
            params = new HashMap();
        }
    }
}
package com.qmx.wxmp.service.jsonrpc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qmx.wxmp.repository.jsonrpc.JsonRpcDao;
import com.qmx.wxmp.vo.jsonrpc.JsonRpc;

/**
 * Created by wdl on 14-11-5.
 */
@Service
public class JsonRpcService {

    @Autowired
    private JsonRpcDao jsonRpcDao;

    public Object request(JsonRpc request) {
        return jsonRpcDao.request(request);
    }
}

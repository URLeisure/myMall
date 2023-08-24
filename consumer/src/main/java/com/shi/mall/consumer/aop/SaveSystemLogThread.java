package com.shi.mall.consumer.aop;

import com.shi.api.model.UmsLog;
import com.shi.api.service.IUmsLogService;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 保存日志至数据库
 * @create: 2023/08/04 18:56
 **/

public class SaveSystemLogThread implements Runnable{
    private UmsLog umsLog;//日志信息
    private IUmsLogService umsLogService;//日志操作类

    public SaveSystemLogThread(UmsLog umsLog,IUmsLogService umsLogService){
        this.umsLog = umsLog;
        this.umsLogService = umsLogService;
    }
    @Override
    public void run() {
        if(umsLog.getLogType() != null){
            umsLogService.insert(umsLog);//日志信息装入数据库
        }
    }
}

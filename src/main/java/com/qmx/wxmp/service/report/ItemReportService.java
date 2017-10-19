package com.qmx.wxmp.service.report;

import java.util.List;

import com.qmx.wxmp.repository.mybatis.report.IItemReportDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.vo.report.AxisVo;

@Service
@Transactional(readOnly = true)
public class ItemReportService {
    @Autowired
    IItemReportDao thisDao;

    public List<AxisVo> getItemNewAmountByDaily(String beginDate, String endDate) {
        return thisDao.getItemNewAmountByDaily(beginDate, endDate);
    }

    public List<AxisVo> getItemNewAmountByWeekly(String beginDate, String endDate) {
        return thisDao.getItemNewAmountByWeekly(beginDate, endDate);
    }

    public List<AxisVo> getItemNewAmountByMonthly(String beginDate, String endDate) {
        return thisDao.getItemNewAmountByMonthly(beginDate, endDate);
    }

    public List<AxisVo> getItemUpDownAmountByDaily(String beginDate, String endDate, String delFlag) {
        return thisDao.getItemUpDownAmountByDaily(beginDate, endDate, delFlag);
    }

    public List<AxisVo> getItemUpDownAmountByWeekly(String beginDate, String endDate, String delFlag) {
        return thisDao.getItemUpDownAmountByWeekly(beginDate, endDate, delFlag);
    }

    public List<AxisVo> getItemUpDownAmountByMonthly(String beginDate, String endDate, String delFlag) {
        return thisDao.getItemUpDownAmountByMonthly(beginDate, endDate, delFlag);
    }

}

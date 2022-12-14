package com.example.blog.service;

import com.example.blog.common.base.BaseService;
import com.example.blog.entity.Report;

import java.util.List;

/**
 * @author Y9000P
 * @date 2021/2/21 5:30 下午
 */

public interface ReportService extends BaseService<Report, Long> {

    /**
     * 根据用户ID和状态查询
     *
     * @param userId
     * @param status
     * @return
     */
    List<Report> findByUserIdAndStatus(Long userId, Integer status);

    /**
     * 根据用户ID删除
     * @param userId
     * @return
     */
    Integer deleteByUserId(Long userId);
}

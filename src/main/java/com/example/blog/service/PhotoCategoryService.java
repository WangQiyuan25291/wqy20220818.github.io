package com.example.blog.service;

import com.example.blog.common.base.BaseService;
import com.example.blog.entity.PhotoCategory;

import java.util.List;

/**
 * @author Y9000P
 * @date 2021/3/2 5:40 下午
 */
public interface PhotoCategoryService extends BaseService<PhotoCategory, Long> {

    /**
     * 根据用户ID查询
     *
     * @param userId
     * @return
     */
    List<PhotoCategory> findByUserId(Long userId);
}

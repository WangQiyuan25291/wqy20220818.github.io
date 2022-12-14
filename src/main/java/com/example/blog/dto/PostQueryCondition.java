package com.example.blog.dto;

import lombok.Data;

/**
 * @author Y9000P
 * @date 2020/3/12 4:53 下午
 */
@Data
public class PostQueryCondition {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 标签ID
     */
    private Long tagId;

    /**
     * 分类ID
     */
    private Long cateId;

    /**
     * 关键字
     */
    private String keywords;

    /**
     * 类型
     */
    private String postType;


    /**
     * 是否推荐
     */
    private Integer isRecommend;

}

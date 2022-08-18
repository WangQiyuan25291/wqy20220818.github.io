package com.example.blog.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.blog.common.base.BaseEntity;
import lombok.Data;


@Data
@TableName("photo_category")
public class PhotoCategory extends BaseEntity {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 分类名称
     */
    private String cateName;

    /**
     * 分类排序号
     */
    private Integer cateSort;

    /**
     * 分类描述
     */
    private String cateDesc;
}

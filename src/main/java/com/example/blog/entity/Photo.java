package com.example.blog.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.blog.common.base.BaseEntity;
import lombok.Data;


@Data
@TableName("photo")
public class Photo extends BaseEntity {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 照片分类
     */
    private Long categoryId;

    /**
     * 照片名称
     */
    private String fileName;
    /**
     * 照片路径
     */
    private String filePath;
    /**
     * 缩略图路径
     */
    private String fileSmallPath;
    /**
     *
     */
    private String fileSuffix;
    /**
     *
     */
    private String fileSize;
    /**
     * 照片宽高
     */
    private String fileWh;
}

package com.example.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.blog.entity.Photo;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface PhotoMapper extends BaseMapper<Photo> {
}

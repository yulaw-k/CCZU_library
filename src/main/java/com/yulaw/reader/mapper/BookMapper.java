package com.yulaw.reader.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yulaw.reader.entity.Book;

public interface BookMapper extends BaseMapper<Book> {
    /**
     * 更新图书评分和评论数量
     */
    public void updateEvaluation();

}

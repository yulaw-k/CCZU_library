package com.yulaw.reader.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yulaw.reader.entity.Test;

public interface TestMapper extends BaseMapper<Test> {
    public void insertSample();
}

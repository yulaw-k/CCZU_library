package com.yulaw.reader.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yulaw.reader.entity.Book;

public interface BookService {
    /**
     * 分页查询图书
     * @param categoryId 分类编号
     * @param order 排序方式
     * @param page 页号
     * @param rows 每页记录数
     * @return 分页对象
     */
    public IPage<Book> paging(Long categoryId, String order , Integer page, Integer rows);

    /**
     * 根据图书编号查询图书对象
     * @param bookId 图书编号
     * @return 图书对象
     */
    public Book selectById(Long bookId);
    /**
     * 更新图书评分和评论数量
     */
    public void updateEvaluation();

    public Book createBook(Book book);

    public  Book updateBook(Book book);

    /**
     *  删除图书以及相关数据
     * @param bookId 图书编号
     */
    public void deleteBook(Long bookId);

}

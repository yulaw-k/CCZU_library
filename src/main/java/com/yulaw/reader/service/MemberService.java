package com.yulaw.reader.service;

import com.yulaw.reader.entity.Evaluation;
import com.yulaw.reader.entity.Member;
import com.yulaw.reader.entity.MemberReadState;

public interface MemberService {
    /**
     * 会员注册，创建新会员
     * @param username 用户名
     * @param password 密码
     * @param nickname 昵称
     * @return 新会员对象
     */
    public Member createMember(String username,String password,String nickname);

    public Member checkLogin(String username,String password);

    public MemberReadState selectMemberReadState(Long memberId,Long bookId);

    /**
     *
     * @param memberId 会员编号
     * @param bookId 图书编号
     * @param readState 阅读状态
     * @return 阅读状态对象
     */
    public MemberReadState updateMemberReadState(Long memberId, Long bookId, Integer readState);

    /**
     *
     * @param memberId 会员编号
     * @param bookId 图书编号
     * @param score 评分
     * @param content 短评内容
     * @return 短评对象
     * */
    public Evaluation evaluate(Long memberId,Long bookId,Integer score,String content);

    /**
     *
     * @param evaluationId 短评编号
     * @return 短评对象
     */
    public Evaluation enjoy(Long evaluationId);
}

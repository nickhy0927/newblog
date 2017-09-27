package com.iss.platform.member.service.impl;

import org.springframework.stereotype.Service;

import com.iss.platform.member.entity.Member;
import com.iss.platform.member.service.MemberService;
import com.orm.commons.service.impl.DefaultAbstractService;

@Service
public class MemberServiceImpl extends DefaultAbstractService<Member, String>  implements MemberService {

}

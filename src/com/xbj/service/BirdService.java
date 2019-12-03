package com.xbj.service;

import com.xbj.domain.Bird;
import com.xbj.util.PageResult;

public interface BirdService {
    PageResult<Bird> page (Bird bird,Integer currentPage, Integer pageSize);

    Bird login(String name,String password);

    void insertBird(Bird bird);

    void updateBird( Bird bird);

    Bird findById(Integer id);
    void deleteStatus(Integer id);

    boolean ajaxCheckName(String name);
}

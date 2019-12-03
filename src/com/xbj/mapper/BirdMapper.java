package com.xbj.mapper;

import com.xbj.domain.Bird;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BirdMapper {

    List<Bird> listAll(@Param("bird") Bird bird, @Param("param1") int param1, @Param("param2") int param2);
    /**
     * 根据条件查询条数
     * @param bird
     * @return
     */

    int countBird(@Param("bird") Bird bird);

    Bird login(@Param("name") String name, @Param("password") String password);

    void insertBird(@Param("bird") Bird bird);

    void updateBird(@Param("bird") Bird bird);

    Bird findById(@Param("id") Integer id);

    void updateStatus(@Param("id") Integer id);

    int ajaxCheckName(@Param("name") String name);
}

package com.hjh.communitysadministrativesystem;

import com.github.pagehelper.PageInfo;
import com.hjh.communitysadministrativesystem.Entity.adminUser;
import com.hjh.communitysadministrativesystem.Service.AdminService;
import com.hjh.communitysadministrativesystem.Service.HouseService;
import com.hjh.communitysadministrativesystem.Service.MaintainService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import com.hjh.communitysadministrativesystem.Service.ChargeService;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CommunitysAdministrativeSystemApplicationTests {
    @Autowired
    private AdminService adminService;

    @Autowired
    private ChargeService chargeService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private MaintainService maintainService;

    @Test
    void contextLoads() {
        adminUser admin = adminService.selectOne("admin", "123456");
        System.out.println(admin);
    }

    @Test
    void testFindAll() {
        List<adminUser> list = adminService.findAll();
        System.out.println(list);
    }
    @Test
    void testFindPage() {
        // 设置分页参数
        int pageNum = 1;
        int pageSize = 5;

        // 调用分页方法
        PageInfo<adminUser> pageInfo = adminService.findPage(pageNum, pageSize);

        // 断言分页信息是否正确
        assertNotNull(pageInfo);
        assertEquals(pageNum, pageInfo.getPageNum());
        assertEquals(pageSize, pageInfo.getPageSize());

        // 断言结果列表不为空
        assertNotNull(pageInfo.getList());
        assertTrue(pageInfo.getList().size() <= pageSize);

        // 打印分页结果
        System.out.println("Total pages: " + pageInfo.getPages());
        System.out.println("Total records: " + pageInfo.getTotal());
        System.out.println("Current page records: " + pageInfo.getList());
    }



    @Test
    void testSelectById() {
        System.out.println(adminService.selectById(1));
    }

    @Test
    void testCharge(){
        System.out.println(chargeService.selectChargeByCustomId(1));
    }

    @Test
    void testHouse(){
        System.out.println(houseService.selectHouseByCustomId(1));
    }

    @Test
    void testMaintain(){
        System.out.println(maintainService.selectMaintainByCustomId(1));
    }
}

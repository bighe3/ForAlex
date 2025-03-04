package com.hjh.communitysadministrativesystem.Service.Impl;

import com.hjh.communitysadministrativesystem.Entity.House;
import com.hjh.communitysadministrativesystem.Service.HouseService;
import com.hjh.communitysadministrativesystem.dao.HouseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HouseServiceImpl implements HouseService {

    @Autowired
    public HouseDao houseDao;

    @Override
    public int insertHouse(House house) {
        int i = houseDao.insertHouse(house);
        return i;
    }

    @Override
    public int deleteHouse(int id) {
        int i = houseDao.deleteHouse(id);
        return i;
    }

    @Override
    public int updateHouse(House house) {
        int i = houseDao.updateHouse(house);
        return i;
    }

    @Override
    public List<House> selectHouseByCustomId(int id) {
        List<House> houseList = houseDao.selectHouseByCustomId(id);
        return houseList;
    }

    @Override
    public List<House> selectHouseByCustomName(String name) {
        List<House> houseList=houseDao.selectHouseByCustomName(name);
        return houseList;
    }

    @Override
    public List<House> selectAllHouse() {
        List<House> houseList=houseDao.selectAllHouse();
        return houseList;
    }

    @Override
    public House selectHouseById(int custom_id) {
        House house=houseDao.selectHouseById(custom_id);
        return house;
    }
}

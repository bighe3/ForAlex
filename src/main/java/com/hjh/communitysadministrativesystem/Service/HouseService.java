package com.hjh.communitysadministrativesystem.Service;

import com.hjh.communitysadministrativesystem.Entity.House;

import java.util.List;

public interface HouseService {
    int insertHouse(House house);

    int deleteHouse(int id);

    int updateHouse(House house);

    List<House> selectHouseByCustomId(int id);

    List<House> selectHouseByCustomName(String name);

    List<House> selectAllHouse();

    House selectHouseById(int id);
}

package com.cos.shumstart.service;

import com.cos.shumstart.domain.holder.Holder;
import com.cos.shumstart.domain.holder.HolderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class HolderService {
    private final HolderRepository holderRepository;

    public Holder 우산아이디로거치대정보찾기(int umbrellaId) {
        Holder holderEntity = holderRepository.findByUmbrellaId(umbrellaId);

        return holderEntity;
    }

    public Holder 빈거치대중제일처음거치대() {
        List<Holder> holderList = holderRepository.listOfEmptyHolder();
        Holder holderEntity;

        if(holderList.isEmpty()) {
            holderEntity = null;
        }
        else {
            holderEntity = holderList.get(0);
        }

        return holderEntity;
    }
}

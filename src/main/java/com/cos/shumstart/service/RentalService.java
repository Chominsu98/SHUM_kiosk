package com.cos.shumstart.service;

import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.booth.BoothRepository;
import com.cos.shumstart.domain.holder.Holder;
import com.cos.shumstart.domain.holder.HolderRepository;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.rental.RentalRepository;
import com.cos.shumstart.domain.umbrella.Umbrella;
import com.cos.shumstart.domain.umbrella.UmbrellaRepository;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.user.UserRepository;
import com.cos.shumstart.domain.voucher.Voucher;
import com.cos.shumstart.domain.voucher.VoucherRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;

@RequiredArgsConstructor
@Service
public class RentalService {

    private final RentalRepository rentalRepository;
    private final BoothRepository boothRepository;
    private final UserRepository userRepository;
    private final UmbrellaRepository umbrellaRepository;
    private final VoucherRepository voucherRepository;
    private final HolderRepository holderRepository;

    public Rental 대여정보(int userId) {

        List<Rental> rentalEntityList = rentalRepository.findByUserId(userId);

        Rental rentalEntity = new Rental();

        for (int i = 0; i < rentalEntityList.size(); i++) {
            Rental rental = rentalEntityList.get(i);

            if(rental.isActivation() == true) {
                rentalEntity = rental;
            }
        }
        return rentalEntity;
    }

    public Rental 대여정보_우산번호로찾기(int umbrellaId) {
        List<Rental> rentalEntityList = rentalRepository.findByUmbrellaId(umbrellaId);

        Rental rentalEntity = new Rental();

        for (int i = 0; i < rentalEntityList.size(); i++) {
            Rental rental = rentalEntityList.get(i);

            if(rental.isActivation() == true) {
                rentalEntity = rental;
            }
        }
        return rentalEntity;
    }

    public Umbrella 우산정보(int umbrellaId) {
        return umbrellaRepository.findById(umbrellaId);
    }

    @Transactional
    public Rental 이용권구매후첫대여(int userId, int holderId, int umbrellaId, int boothId) {

        User userEntity = userRepository.findById(userId);

        Umbrella umbrella = new Umbrella();
        umbrella.setId(umbrellaId);

        Rental rental = new Rental();
        rental.setUser(userEntity);
        rental.setUmbrella(umbrella);
        rental.setActivation(true);

        Booth boothEntity = boothRepository.findById(boothId);
        Umbrella umbrellaEntity = umbrellaRepository.findById(umbrellaId);

        if(umbrellaEntity.getUmbrellaType().equals("프리Edition")) {
            int leftUmbrella = boothEntity.getLeftFreeUmbrella();
            boothRepository.updateLeftFreeUmbrella(--leftUmbrella, boothId);
        }
        else {
            int leftUmbrella = boothEntity.getLeftLocationUmbrella();
            boothRepository.updateLeftLocationUmbrella(--leftUmbrella, boothId);
        }

        umbrellaRepository.updateBoothIdRental(umbrellaId);
        umbrellaRepository.updateRentalState(true, umbrellaId);
        umbrellaRepository.updateHolderNumberRental(umbrellaId);

        userRepository.updateState(true, userId);

        Holder holderEntity = holderRepository.findById(holderId);
        holderRepository.updateUmbrellaIdRental(holderEntity.getId());

        List<Voucher> voucherEntityList =  voucherRepository.findByUserId(userId);

        Voucher voucherEntity = new Voucher();

        for (int i = 0; i < voucherEntityList.size(); i++) {
            Voucher voucher = voucherEntityList.get(i);

            if(voucher.getActivation() == true) {
                voucherEntity = voucher;
            }
        }
        voucherRepository.updateVoucherStartDate(LocalDateTime.now(), voucherEntity.getId());

        return rentalRepository.save(rental);
    }

    @Transactional
    public Rental 대여하기(int userId, int holderId, int umbrellaId, int boothId) {

        User userEntity = userRepository.findById(userId);

        Umbrella umbrella = new Umbrella();
        umbrella.setId(umbrellaId);

        Rental rental = new Rental();
        rental.setUser(userEntity);
        rental.setUmbrella(umbrella);
        rental.setActivation(true);

        Booth boothEntity = boothRepository.findById(boothId);
        Umbrella umbrellaEntity = umbrellaRepository.findById(umbrellaId);

        if(umbrellaEntity.getUmbrellaType().equals("프리Edition")) {
            int leftUmbrella = boothEntity.getLeftFreeUmbrella();
            boothRepository.updateLeftFreeUmbrella(--leftUmbrella, boothId);
        }
        else {
            int leftUmbrella = boothEntity.getLeftLocationUmbrella();
            boothRepository.updateLeftLocationUmbrella(--leftUmbrella, boothId);
        }

        umbrellaRepository.updateBoothIdRental(umbrellaId);
        umbrellaRepository.updateRentalState(true, umbrellaId);
        umbrellaRepository.updateHolderNumberRental(umbrellaId);

        Holder holderEntity = holderRepository.findById(holderId);
        holderRepository.updateUmbrellaIdRental(holderEntity.getId());

        userRepository.updateState(true, userId);

        return rentalRepository.save(rental);
    }

    @Transactional
    public void 반납하기(int userId, int holderId, int boothId) {

        List<Rental> rentalEntityList = rentalRepository.findByUserId(userId);

        Rental rentalEntity = new Rental();

        for (int i = 0; i < rentalEntityList.size(); i++) {
            Rental rental = rentalEntityList.get(i);
            System.out.println(rental.getId());

            if(rental.isActivation() == true) {
                rentalEntity = rental;
            }
        }
        System.out.println(rentalEntity.getId());

        Booth boothEntity = boothRepository.findById(boothId);
        Umbrella umbrellaEntity = umbrellaRepository.findById(rentalEntity.getUmbrella().getId());

        if(umbrellaEntity.getUmbrellaType().equals("프리Edition")) {
            int leftUmbrella = boothEntity.getLeftFreeUmbrella();
            boothRepository.updateLeftFreeUmbrella(++leftUmbrella, boothId);
        }
        else {
            int leftUmbrella = boothEntity.getLeftLocationUmbrella();
            boothRepository.updateLeftLocationUmbrella(++leftUmbrella, boothId);
        }

        umbrellaRepository.updateBoothIdReturn(boothId, umbrellaEntity.getId());
        umbrellaRepository.updateRentalState(false, umbrellaEntity.getId());
        umbrellaRepository.updateHolderNumberReturn(holderId, umbrellaEntity.getId());

        Holder holderEntity = holderRepository.findById(holderId);
        holderRepository.updateUmbrellaIdReturn(umbrellaEntity.getId(), holderEntity.getId());

        userRepository.updateState(false, userId);

        rentalRepository.updateActivation(false, rentalEntity.getId());
        rentalRepository.updateReturnDate(LocalDateTime.now(), rentalEntity.getId());

        userRepository.updateLateFeeStack(0, userId);
    }
}

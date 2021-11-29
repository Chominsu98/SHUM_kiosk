package com.cos.shumstart.service;

import com.cos.shumstart.domain.user.UserRepository;
import com.cos.shumstart.domain.voucher.Voucher;
import com.cos.shumstart.domain.voucher.VoucherRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

@EnableScheduling
@RequiredArgsConstructor
@Service
public class VoucherService {

    private final UserRepository userRepository;
    private final VoucherRepository voucherRepository;

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private double lateFeeStack;

    @Autowired
    private DataSource dataSource;

    public Voucher 이용권정보(int userId) {

        List<Voucher> voucherEntityList =  voucherRepository.findByUserId(userId);

        Voucher voucherEntity = new Voucher();

        for (int i = 0; i < voucherEntityList.size(); i++) {
            Voucher voucher = voucherEntityList.get(i);

            if(voucher.getActivation() == true) {
                voucherEntity = voucher;
            }
        }

        return voucherEntity;
    }

    public Voucher 예약번호로찾기(String reservationcode){
        Voucher voucher=voucherRepository.findByReservationCode(reservationcode);
        return voucher;
    }
}

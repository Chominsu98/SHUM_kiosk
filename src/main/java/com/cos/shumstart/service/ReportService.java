package com.cos.shumstart.service;

import com.cos.shumstart.domain.Report.Report;
import com.cos.shumstart.domain.Report.ReportRepository;
import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.rental.RentalRepository;
import com.cos.shumstart.domain.umbrella.Umbrella;
import com.cos.shumstart.domain.umbrella.UmbrellaRepository;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;

@RequiredArgsConstructor
@Service
public class ReportService {

    private final UserRepository userRepository;
    private final UmbrellaRepository umbrellaRepository;
    private final RentalRepository rentalRepository;
    private final ReportRepository reportRepository;

    @Transactional
    public Report 우산고장신고(int umbrellaId, String message) {

        Umbrella umbrella = new Umbrella();
        umbrella.setId(umbrellaId);

        Report report = new Report();
        report.setUmbrella(umbrella);
        report.setMessage(message);

        umbrellaRepository.updateBoothIdRental(umbrellaId);
        umbrellaRepository.updateRentalState(false, umbrellaId);
        umbrellaRepository.updateBrokenState(true, umbrellaId);

        return reportRepository.save(report);
    }

    @Transactional
    public void 고장신고후반납하기(int userId, int boothId) {

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

        Umbrella umbrellaEntity = umbrellaRepository.findById(rentalEntity.getUmbrella().getId());

        umbrellaRepository.updateRentalState(false, umbrellaEntity.getId());

        userRepository.updateState(false, userId);

        rentalRepository.updateActivation(false, rentalEntity.getId());
        rentalRepository.updateReturnDate(LocalDateTime.now(), rentalEntity.getId());

        userRepository.updateLateFeeStack(0, userId);
    }
}

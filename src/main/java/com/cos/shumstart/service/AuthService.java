package com.cos.shumstart.service;

import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@RequiredArgsConstructor
@Service // 1. IoC 2. 트랜잭션 관리
public class AuthService {

    private final UserRepository userRepository;

    @Transactional
    public User 유저정보(int id) {
        User userEntity = userRepository.findById(id);

        return userEntity;
    }

    @Transactional
    public User 유저정보_유저네임으로_찾기(String userName) {
        User userEntity = userRepository.findByUsername(userName);

        return userEntity;
    }
}
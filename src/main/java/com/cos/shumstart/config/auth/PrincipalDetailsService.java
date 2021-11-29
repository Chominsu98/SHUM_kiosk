package com.cos.shumstart.config.auth;

import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.booth.BoothRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class PrincipalDetailsService implements UserDetailsService{

    private final BoothRepository boothRepository;

    @Override
    public UserDetails loadUserByUsername(String boothName) throws UsernameNotFoundException {
        Booth boothEntity = boothRepository.findByBoothName(boothName);

        if(boothEntity == null) {
            return null;
        }
        else {
            return new PrincipalDetails(boothEntity);
        }
    }
}

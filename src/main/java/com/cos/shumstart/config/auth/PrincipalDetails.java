package com.cos.shumstart.config.auth;

import com.cos.shumstart.domain.booth.Booth;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;

@Data
public class PrincipalDetails implements UserDetails {

    private static final long serialVersionUID = 1L;

    private Booth booth;

    public PrincipalDetails(Booth booth) { this.booth = booth; }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collector = new ArrayList<>();
        collector.add(() -> { return "Role";});
        return collector;
    }

    @Override
    public String getPassword() {
        return "1234";
    }

    @Override
    public String getUsername() {
        return booth.getBoothName();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}

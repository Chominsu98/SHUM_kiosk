package com.cos.shumstart.domain.holder;

import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.umbrella.Umbrella;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Holder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int umbrellaId;

    private int boothId;
}

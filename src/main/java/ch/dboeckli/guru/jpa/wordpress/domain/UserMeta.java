package ch.dboeckli.guru.jpa.wordpress.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "wp_usermeta")
@Getter
@Setter
@ToString
public class UserMeta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "umeta_id")
    private Long id;
    private Long userId;
    private String metaKey;

    @Lob
    private String metaValue;

}

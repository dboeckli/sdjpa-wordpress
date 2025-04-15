package ch.dboeckli.guru.jpa.wordpress.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.URL;

import java.sql.Timestamp;

@Entity
@Table(name = "wp_users")
@Getter
@Setter
@ToString
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_login")
    @NotNull
    @Size(max = 60)
    private String login;

    @Column(name = "user_pass")
    @NotNull
    @Size(max = 255)
    private String password;

    @Column(name = "user_nicename")
    @NotNull
    @Size(max = 50)
    private String nicename;

    @Column(name = "user_email")
    @Email
    @NotNull
    @Size(max = 100)
    private String email;

    @Column(name = "user_url")
    @URL
    @NotNull
    @Size(max = 100)
    private String url;

    @Column(name = "user_registered")
    @NotNull
    private Timestamp registered;

    @Column(name = "user_activation_key")
    @NotNull
    @Size(max = 255)
    private String activationKey;

    @Column(name = "user_status")
    @NotNull
    private Integer status;

    @Column(name = "display_name", nullable = false)
    // or @Basic(optional = false) for same purpose as @Column
    @NotNull
    @Size(max = 255)
    private String displayName;
}

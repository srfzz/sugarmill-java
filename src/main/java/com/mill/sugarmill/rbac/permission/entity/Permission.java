package com.mill.sugarmill.rbac.permission.entity;


import com.mill.sugarmill.common.audit.BaseAuditableEntity;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.context.event.EventListener;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import java.time.Instant;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name="permissions")
public class Permission extends BaseAuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id ;

    @Column(nullable = false,length = 50)
    private String resource;
    @Column(nullable = false,length = 50)
    private String action;
    @Column(nullable = false,length = 150,insertable = false,updatable = false)
    private String name;

}

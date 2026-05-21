create table if not exists permissions(
    id bigint generated always as identity primary key,
    resource varchar(50) not null,
    action varchar(50) not null,
    name varchar(150)  generated always as (resource || ':'|| action) stored,
    created_by VARCHAR(100) NOT NULL DEFAULT 'SYSTEM_ENGINE',
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by VARCHAR(100) NOT NULL DEFAULT 'SYSTEM_ENGINE',
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_resource_action UNIQUE (resource, action),
    constraint ck_resource_lowercase check(resource=lower(resource)),
    constraint ck_action_lowercase check(resource=lower(action))
);
    create index if not exists idx_per_name on permissions(name);
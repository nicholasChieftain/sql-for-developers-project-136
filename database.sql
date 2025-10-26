create table courses 
(
    id bigint primary key generated always as identity,
    name varchar(255),
    description text,
    is_deleted boolean,
    created_at timestamp,
    updated_at timestamp
);

create table lessons 
(
    id bigint primary key generated always as identity,
    name varchar(255),
    content text,
    video_link text,
    position smallint,
    is_deleted boolean,
    created_at timestamp,
    updated_at timestamp,
    course_id bigint references courses (id)
);

create table modules 
(
    id bigint primary key generated always as identity,
    name varchar(255),
    description text,
    is_deleted boolean,
    created_at timestamp,
    updated_at timestamp
);

create table module_courses 
(
    id bigint primary key generated always as identity,
    module_id bigint references modules (id),
    course_id bigint references courses (id)
);

create type program_types as enum 
(
    'intensiv',
    'profession'
);

create table programs 
(
    id bigint primary key generated always as identity,
    price integer, 
    name varchar(255),
    program_type program_types,
    created_at timestamp,
    updated_at timestamp
);

create table program_modules 
(
    id bigint primary key generated always as identity,
    program_id bigint references programs (id),
    module_id bigint references modules (id)
);

create domain email_address as text check (VALUE ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$');

create table teaching_groups
(
    id bigint primary key generated always as identity,
    slug varchar(255),
    created_at timestamp,
    updated_at timestamp
);

create table user_roles 
(
    id bigint primary key generated always as identity,
    name varchar(255)
);

create table users 
(
    id bigint primary key generated always as identity,
    username varchar(255),
    email email_address,
    password text,
    teaching_group_id bigint references teaching_groups (id),
    role_id bigint references user_roles (id),
    created_at timestamp,
    updated_at timestamp
);


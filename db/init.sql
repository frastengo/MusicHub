
create table users (
    user_id serial primary key,
    auth0_id integer,
    profile_name text,
    email text, 
    picture text
);

create table listings (
    listing_id serial primary key,
    user_id int references users(user_id),
    listing_name text,
    description text,
    time_stamp text,
    type text,
    tags text,
    price integer,
    sold boolean
);

create table messages(
    message_id serial primary key,
    sender_id int references users(user_id),
    receivers_id int,
    message text,
    time_stamp text
);

create table completed_transactions (
    transaction_id serial primary key,
    listing_id int references listings(listing_id),
    seller_id int references users(user_id),
    buyers_id int references users(user_id),
);

create table favorites (
    favorites_id serial primary key,
    listing_id int references listings(listing_id),
    seller_id int references users(user_id),
    buyers_id int references users(user_id),
);

create table pictures(
    picture_id serial primary key,
    listing_id int references listings(listing_id),
    picture_url text
);

create table rooms(
    room_id serial
    user_1 integer,
    user_2 integer,
    room_name varchar(64) primary key
);

create table room_data(
time_sent TIMESTAMPTZ NOT NULL DEFAULT NOW()
,sender integer
,recipient integer
,message text
,room_name varchar(64) references rooms(room_name)
);




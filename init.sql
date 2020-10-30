-- ube: Universal Blog Engine
CREATE TABLE ube_users (
    user_id BIGINT NOT NULL PRIMARY KEY
);

CREATE TABLE ube_pages (
    url TEXT NOT NULL PRIMARY KEY
    ,content TEXT
    ,redirect_to TEXT
    ,disabled BOOLEAN
);

CREATE TABLE ube_posts (
    post_id BIGINT NOT NULL PRIMARY KEY
    ,slug TEXT
    ,title TEXT
    ,summary TEXT
    ,published_on DATETIME
    ,unpublished_on DATETIME
    ,created_at DATETIME
    ,updated_at DATETIME
);

CREATE TABLE users_posts (
    user_id BIGINT
    ,post_id BIGINT

    ,FOREIGN KEY (user_id) REFERENCES users (user_id)
    ,FOREIGN KEY (post_id) REFERENCES posts (post_id)
);

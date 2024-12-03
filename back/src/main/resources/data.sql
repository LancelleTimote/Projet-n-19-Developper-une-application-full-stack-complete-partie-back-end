CREATE TABLE USERS (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE TOPICS (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE SUBSCRIPTIONS (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    topic_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_subscription FOREIGN KEY (user_id) REFERENCES USERS (id),
    CONSTRAINT fk_topic_subscription FOREIGN KEY (topic_id) REFERENCES TOPICS (id),
    CONSTRAINT unique_subscription UNIQUE (user_id, topic_id)
);

CREATE TABLE POSTS (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    topic_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_topic_post FOREIGN KEY (topic_id) REFERENCES TOPICS (id),
    CONSTRAINT fk_author_post FOREIGN KEY (author_id) REFERENCES USERS (id)
);

CREATE TABLE COMMENTS (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_post_comment FOREIGN KEY (post_id) REFERENCES POSTS (id),
    CONSTRAINT fk_user_comment FOREIGN KEY (user_id) REFERENCES USERS (id)
);
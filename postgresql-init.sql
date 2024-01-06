CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS party
(
    id         UUID         DEFAULT uuid_generate_v4(),
    code       INTEGER      NOT NULL,
    name       VARCHAR(128) NOT NULL,
    acronym    VARCHAR(32)  NOT NULL,
    image_url  VARCHAR(256) NOT NULL,

    active     BOOLEAN      NOT NULL DEFAULT true,
    created_at TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT party_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS deputy
(
    id               UUID         DEFAULT uuid_generate_v4(),
    code             INTEGER      NOT NULL,
    cpf              VARCHAR(32)  NOT NULL,
    name             VARCHAR(128) NOT NULL,
    electoral_name   VARCHAR(128) NOT NULL,
    image_url        VARCHAR(256) NOT NULL,
    party_id         UUID NOT NULL,

    active           BOOLEAN      NOT NULL DEFAULT true,
    created_at       TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at       TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT deputy_pk       PRIMARY KEY (id),
    CONSTRAINT deputy_party_fk FOREIGN KEY (party_id) REFERENCES party (id)
);

CREATE TABLE IF NOT EXISTS organization
(
    id         UUID         DEFAULT uuid_generate_v4(),
    code       INTEGER,
    name       TEXT         NOT NULL,
    nickname   VARCHAR(256),
    acronym    VARCHAR(32),
    type       VARCHAR(256) NOT NULL,

    active     BOOLEAN      NOT NULL DEFAULT true,
    created_at TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT organization_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS proposition
(
    id                UUID         DEFAULT uuid_generate_v4(),
    code              INTEGER      NOT NULL,
    original_text_url VARCHAR(256) NOT NULL,
    title             TEXT         NOT NULL,
    content           TEXT         NOT NULL,
    submitted_at      TIMESTAMP    NOT NULL,
    image_url         VARCHAR(256),

    active            BOOLEAN      NOT NULL DEFAULT true,
    created_at        TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at        TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT proposition_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS proposition_author
(
    id                 UUID      DEFAULT uuid_generate_v4(),
    proposition_id     UUID      NOT NULL,
    deputy_id          UUID,
    party_id           UUID,
    organization_id    UUID,

    active             BOOLEAN   NOT NULL DEFAULT true,
    created_at         TIMESTAMP NOT NULL DEFAULT now(),
    updated_at         TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT proposition_author_pk              PRIMARY KEY (id),
    CONSTRAINT proposition_author_proposition_fk  FOREIGN KEY (proposition_id)  REFERENCES proposition     (id),
    CONSTRAINT proposition_author_deputy_fk       FOREIGN KEY (deputy_id)       REFERENCES deputy          (id),
    CONSTRAINT proposition_author_party_fk        FOREIGN KEY (party_id)        REFERENCES party           (id),
    CONSTRAINT proposition_author_organization_fk FOREIGN KEY (organization_id) REFERENCES organization    (id)
);

CREATE TABLE IF NOT EXISTS newsletter
(
    id             UUID      DEFAULT uuid_generate_v4(),
    title          TEXT      NOT NULL,
    content        TEXT      NOT NULL,
    reference_date DATE      NOT NULL,

    active         BOOLEAN   NOT NULL DEFAULT true,
    created_at     TIMESTAMP NOT NULL DEFAULT now(),
    updated_at     TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT newsletter_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS newsletter_proposition
(
    newsletter_id  UUID NOT NULL,
    proposition_id UUID NOT NULL,

    active         BOOLEAN   NOT NULL DEFAULT true,
    created_at     TIMESTAMP NOT NULL DEFAULT now(),
    updated_at     TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT newsletter_proposition_pk             PRIMARY KEY (newsletter_id, proposition_id),
    CONSTRAINT newsletter_proposition_newsletter_fk  FOREIGN KEY (newsletter_id)  REFERENCES newsletter  (id),
    CONSTRAINT newsletter_proposition_proposition_fk FOREIGN KEY (proposition_id) REFERENCES proposition (id)
);

CREATE TABLE IF NOT EXISTS news
(
    id             UUID      DEFAULT uuid_generate_v4(),
    proposition_id UUID,
    newsletter_id  UUID,

    active         BOOLEAN   NOT NULL DEFAULT true,
    created_at     TIMESTAMP NOT NULL DEFAULT now(),
    updated_at     TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT news_pk             PRIMARY KEY (id),
    CONSTRAINT news_proposition_fk FOREIGN KEY (proposition_id) REFERENCES proposition (id),
    CONSTRAINT news_newsletter_fk  FOREIGN KEY (newsletter_id)  REFERENCES newsletter  (id)
);

CREATE TABLE IF NOT EXISTS news_view
(
    id         UUID      DEFAULT uuid_generate_v4(),
    news_id    UUID      NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT news_view_pk      PRIMARY KEY (id),
    CONSTRAINT news_view_news_fk FOREIGN KEY (news_id) REFERENCES news (id)
);

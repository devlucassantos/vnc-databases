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

    current_party_id UUID NOT NULL,

    active           BOOLEAN      NOT NULL DEFAULT true,
    created_at       TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at       TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT deputy_pk               PRIMARY KEY (id),
    CONSTRAINT deputy_current_party_fk FOREIGN KEY (current_party_id) REFERENCES party (id)
);

CREATE TABLE IF NOT EXISTS organization
(
    id         UUID         DEFAULT uuid_generate_v4(),
    code       INTEGER      NOT NULL,
    name       TEXT         NOT NULL,
    nickname   VARCHAR(256) NOT NULL,
    acronym    VARCHAR(32)  NOT NULL,

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
    summary           TEXT         NOT NULL,
    submitted_at      TIMESTAMP    NOT NULL,

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

CREATE TABLE IF NOT EXISTS keyword
(
    id         UUID         DEFAULT uuid_generate_v4(),
    keyword    VARCHAR(128) NOT NULL UNIQUE,

    active     BOOLEAN      NOT NULL DEFAULT true,
    created_at TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT keyword_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS proposition_keyword
(
    proposition_id UUID      NOT NULL,
    keyword_id     UUID      NOT NULL,

    active         BOOLEAN   NOT NULL DEFAULT true,
    created_at     TIMESTAMP NOT NULL DEFAULT now(),
    updated_at     TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT proposition_keyword_pks            PRIMARY KEY (proposition_id, keyword_id),
    CONSTRAINT proposition_keyword_proposition_fk FOREIGN KEY (proposition_id) REFERENCES proposition (id),
    CONSTRAINT proposition_keyword_keyword_fk     FOREIGN KEY (keyword_id)     REFERENCES keyword     (id)
);

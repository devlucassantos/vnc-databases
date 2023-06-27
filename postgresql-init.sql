CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS political_party
(
    id         UUID         DEFAULT uuid_generate_v4(),
    name       VARCHAR(128) NOT NULL,
    acronym    VARCHAR(10)  NOT NULL,

    active     BOOLEAN      NOT NULL DEFAULT true,
    created_at TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT political_party_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS congressman
(
    id                         UUID         DEFAULT uuid_generate_v4(),
    name                       VARCHAR(128) NOT NULL,

    current_political_party_id UUID         NOT NULL,

    active                     BOOLEAN      NOT NULL DEFAULT true,
    created_at                 TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at                 TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT congressman_pk PRIMARY KEY (id),
    CONSTRAINT congressman_current_political_party_fk FOREIGN KEY (current_political_party_id) REFERENCES political_party (id)
);

CREATE TABLE IF NOT EXISTS proposition
(
    id                 UUID         DEFAULT uuid_generate_v4(),
    code               INTEGER      NOT NULL,
    original_text_url  VARCHAR(256) NOT NULL,
    summary            TEXT         NOT NULL,

    congressman_id     UUID NOT NULL,
    political_party_id UUID NOT NULL,

    active             BOOLEAN      NOT NULL DEFAULT true,
    created_at         TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at         TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT proposition_pk PRIMARY KEY (id),
    CONSTRAINT proposition_congressman_fk FOREIGN KEY (congressman_id) REFERENCES congressman (id),
    CONSTRAINT proposition_political_party_fk FOREIGN KEY (political_party_id) REFERENCES political_party (id)
);

CREATE TABLE IF NOT EXISTS keyword
(
    id         UUID         DEFAULT uuid_generate_v4(),
    keyword    VARCHAR(100) NOT NULL UNIQUE,

    active     BOOLEAN      NOT NULL DEFAULT true,
    created_at TIMESTAMP    NOT NULL DEFAULT now(),
    updated_at TIMESTAMP    NOT NULL DEFAULT now(),

    CONSTRAINT keyword_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS proposition_keyword
(
    proposition_id UUID,
    keyword_id     UUID,

    active         BOOLEAN   NOT NULL DEFAULT true,
    created_at     TIMESTAMP NOT NULL DEFAULT now(),
    updated_at     TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT keyword_proposition_pks PRIMARY KEY (proposition_id, keyword_id),
    CONSTRAINT proposition_keyword_proposition_fk FOREIGN KEY (proposition_id) REFERENCES proposition (id),
    CONSTRAINT proposition_keyword_keyword_fk FOREIGN KEY (keyword_id) REFERENCES keyword (id)
);
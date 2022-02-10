CREATE TABLE "customer" (
	"id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255),
	"birthday" DATE NOT NULL,
	"age" integer NOT NULL,
	"email" varchar(255) NOT NULL,
	"phone_number" varchar(255),
	CONSTRAINT "customer_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ticket" (
	"id" serial NOT NULL,
	"ticket_number" serial NOT NULL,
	"movie_id" integer NOT NULL,
	"start_time" TIME NOT NULL,
	"customer_id" integer NOT NULL,
	CONSTRAINT "ticket_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "staff" (
	"id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"phone_number" varchar(255) NOT NULL,
	CONSTRAINT "staff_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "concessions" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"size" VARCHAR(255) NOT NULL,
	"amount" FLOAT NOT NULL,
	CONSTRAINT "concessions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "payment" (
	"id" serial NOT NULL,
	"customer_id" integer NOT NULL,
	"staff_id" integer NOT NULL,
	"ticket_id" integer,
	"concessions_id" integer,
	"amount" FLOAT NOT NULL,
	CONSTRAINT "payment_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "movie" (
	"id" serial NOT NULL,
	"title" varchar(255) NOT NULL,
	CONSTRAINT "movie_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk0" FOREIGN KEY ("movie_id") REFERENCES "movie"("id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk1" FOREIGN KEY ("customer_id") REFERENCES "customer"("id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk0" FOREIGN KEY ("customer_id") REFERENCES "customer"("id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk1" FOREIGN KEY ("staff_id") REFERENCES "staff"("id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk2" FOREIGN KEY ("ticket_id") REFERENCES "ticket"("id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk3" FOREIGN KEY ("concessions_id") REFERENCES "concessions"("id");
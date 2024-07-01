create table "public"."product_to_features" (
    "id" bigint generated by default as identity not null,
    "models" jsonb default '["gpt-3.5-turbo-1106"]'::jsonb,
    "daily_chat_credit" integer not null default 20,
    "max_brains" integer not null,
    "max_brain_size" bigint not null default '50000000'::bigint,
    "api_access" boolean not null default false,
    "stripe_product_id" text
);


alter table "public"."user_settings" drop column "API_ACCESS";

alter table "public"."user_settings" add column "api_access" boolean not null default false;

CREATE UNIQUE INDEX product_to_features_pkey ON public.product_to_features USING btree (id);

alter table "public"."product_to_features" add constraint "product_to_features_pkey" PRIMARY KEY using index "product_to_features_pkey";

alter table "public"."product_to_features" add constraint "product_to_features_max_brains_check" CHECK ((max_brains > 0)) not valid;

alter table "public"."product_to_features" validate constraint "product_to_features_max_brains_check";

grant delete on table "public"."product_to_features" to "anon";

grant insert on table "public"."product_to_features" to "anon";

grant references on table "public"."product_to_features" to "anon";

grant select on table "public"."product_to_features" to "anon";

grant trigger on table "public"."product_to_features" to "anon";

grant truncate on table "public"."product_to_features" to "anon";

grant update on table "public"."product_to_features" to "anon";

grant delete on table "public"."product_to_features" to "authenticated";

grant insert on table "public"."product_to_features" to "authenticated";

grant references on table "public"."product_to_features" to "authenticated";

grant select on table "public"."product_to_features" to "authenticated";

grant trigger on table "public"."product_to_features" to "authenticated";

grant truncate on table "public"."product_to_features" to "authenticated";

grant update on table "public"."product_to_features" to "authenticated";

grant delete on table "public"."product_to_features" to "service_role";

grant insert on table "public"."product_to_features" to "service_role";

grant references on table "public"."product_to_features" to "service_role";

grant select on table "public"."product_to_features" to "service_role";

grant trigger on table "public"."product_to_features" to "service_role";

grant truncate on table "public"."product_to_features" to "service_role";

grant update on table "public"."product_to_features" to "service_role";

PGDMP     "                    y            school    13.1    13.1 +    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25145    school    DATABASE     j   CREATE DATABASE school WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE school;
                postgres    false            �            1259    25167    homework    TABLE     9  CREATE TABLE public.homework (
    id integer NOT NULL,
    courseid integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(8191),
    deadline character varying(255) NOT NULL,
    createdat character varying(255) NOT NULL,
    updatedat character varying(255) NOT NULL
);
    DROP TABLE public.homework;
       public         heap    postgres    false            �            1259    25150    Homework_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Homework_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 (   DROP SEQUENCE public."Homework_id_seq";
       public          postgres    false    203            �           0    0    Homework_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Homework_id_seq" OWNED BY public.homework.id;
          public          postgres    false    200            �            1259    25154    comment    TABLE     k  CREATE TABLE public.comment (
    id integer NOT NULL,
    authorid integer NOT NULL,
    authorfullname character varying(255) NOT NULL,
    authortype character varying(255) NOT NULL,
    submissionid integer NOT NULL,
    createdat character varying(255) NOT NULL,
    updatedat character varying(255) NOT NULL,
    content character varying(1023) NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    25200    course    TABLE       CREATE TABLE public.course (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(8191),
    points real NOT NULL,
    createdat character varying(255) NOT NULL,
    updatedat character varying(255) NOT NULL
);
    DROP TABLE public.course;
       public         heap    postgres    false            �            1259    25292    course_file    TABLE     @  CREATE TABLE public.course_file (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    course_id integer NOT NULL,
    mimetype character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    created_at character varying(255) NOT NULL,
    updated_at character varying(255) NOT NULL
);
    DROP TABLE public.course_file;
       public         heap    postgres    false            �            1259    25160    courseparticipants    TABLE     �   CREATE TABLE public.courseparticipants (
    personid integer NOT NULL,
    courseid integer NOT NULL,
    createdat character varying(255) NOT NULL,
    updatedat character varying(255) NOT NULL,
    id character varying(512) NOT NULL
);
 &   DROP TABLE public.courseparticipants;
       public         heap    postgres    false            �            1259    25256    homework_file    TABLE     D  CREATE TABLE public.homework_file (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    homework_id integer NOT NULL,
    mimetype character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    created_at character varying(255) NOT NULL,
    updated_at character varying(255) NOT NULL
);
 !   DROP TABLE public.homework_file;
       public         heap    postgres    false            �            1259    25181    person    TABLE     E  CREATE TABLE public.person (
    id integer NOT NULL,
    fname character varying(255) NOT NULL,
    lname character varying(255) NOT NULL,
    password character varying(1023) NOT NULL,
    type character varying(255) NOT NULL,
    createdat character varying(255) NOT NULL,
    updatedat character varying(255) NOT NULL
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    25187 
   submission    TABLE     R  CREATE TABLE public.submission (
    id integer NOT NULL,
    studentid integer NOT NULL,
    homeworkid integer NOT NULL,
    grade integer,
    status character varying(255),
    createdat character varying(255) NOT NULL,
    updatedat character varying(255) NOT NULL,
    graderid integer,
    graderfullname character varying(255)
);
    DROP TABLE public.submission;
       public         heap    postgres    false            �            1259    25193    submissionfile    TABLE     F  CREATE TABLE public.submissionfile (
    id integer NOT NULL,
    path character varying(511) NOT NULL,
    created_at character varying(255) NOT NULL,
    updated_at character varying(255) NOT NULL,
    submissionid integer NOT NULL,
    mimetype character varying(255) NOT NULL,
    title character varying(255) NOT NULL
);
 "   DROP TABLE public.submissionfile;
       public         heap    postgres    false            K           2604    25170    homework id    DEFAULT     l   ALTER TABLE ONLY public.homework ALTER COLUMN id SET DEFAULT nextval('public."Homework_id_seq"'::regclass);
 :   ALTER TABLE public.homework ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    203    203            �          0    25154    comment 
   TABLE DATA           x   COPY public.comment (id, authorid, authorfullname, authortype, submissionid, createdat, updatedat, content) FROM stdin;
    public          postgres    false    201   �8       �          0    25200    course 
   TABLE DATA           V   COPY public.course (id, title, description, points, createdat, updatedat) FROM stdin;
    public          postgres    false    207   �8       �          0    25292    course_file 
   TABLE DATA           c   COPY public.course_file (id, path, course_id, mimetype, title, created_at, updated_at) FROM stdin;
    public          postgres    false    209   "9       �          0    25160    courseparticipants 
   TABLE DATA           Z   COPY public.courseparticipants (personid, courseid, createdat, updatedat, id) FROM stdin;
    public          postgres    false    202   �9       �          0    25167    homework 
   TABLE DATA           d   COPY public.homework (id, courseid, title, description, deadline, createdat, updatedat) FROM stdin;
    public          postgres    false    203   �:       �          0    25256    homework_file 
   TABLE DATA           g   COPY public.homework_file (id, path, homework_id, mimetype, title, created_at, updated_at) FROM stdin;
    public          postgres    false    208   d;       �          0    25181    person 
   TABLE DATA           X   COPY public.person (id, fname, lname, password, type, createdat, updatedat) FROM stdin;
    public          postgres    false    204   �<       �          0    25187 
   submission 
   TABLE DATA           ~   COPY public.submission (id, studentid, homeworkid, grade, status, createdat, updatedat, graderid, graderfullname) FROM stdin;
    public          postgres    false    205   8=       �          0    25193    submissionfile 
   TABLE DATA           i   COPY public.submissionfile (id, path, created_at, updated_at, submissionid, mimetype, title) FROM stdin;
    public          postgres    false    206   U=       �           0    0    Homework_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Homework_id_seq"', 3, false);
          public          postgres    false    200            M           2606    25211    comment Comment_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comment DROP CONSTRAINT "Comment_pkey";
       public            postgres    false    201            O           2606    25320 *   courseparticipants CourseParticipants_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.courseparticipants
    ADD CONSTRAINT "CourseParticipants_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.courseparticipants DROP CONSTRAINT "CourseParticipants_pkey";
       public            postgres    false    202            Y           2606    25225    course Course_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.course
    ADD CONSTRAINT "Course_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.course DROP CONSTRAINT "Course_pkey";
       public            postgres    false    207            W           2606    25223 &   submissionfile HomeworkFile_copy1_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.submissionfile
    ADD CONSTRAINT "HomeworkFile_copy1_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.submissionfile DROP CONSTRAINT "HomeworkFile_copy1_pkey";
       public            postgres    false    206            Q           2606    25215    homework Homework_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.homework
    ADD CONSTRAINT "Homework_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.homework DROP CONSTRAINT "Homework_pkey";
       public            postgres    false    203            S           2606    25219    person Person_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.person
    ADD CONSTRAINT "Person_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.person DROP CONSTRAINT "Person_pkey";
       public            postgres    false    204            U           2606    25221    submission Submission_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.submission
    ADD CONSTRAINT "Submission_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.submission DROP CONSTRAINT "Submission_pkey";
       public            postgres    false    205            ]           2606    25299    course_file course_file_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.course_file
    ADD CONSTRAINT course_file_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.course_file DROP CONSTRAINT course_file_pkey;
       public            postgres    false    209            [           2606    25263     homework_file homework_file_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.homework_file
    ADD CONSTRAINT homework_file_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.homework_file DROP CONSTRAINT homework_file_pkey;
       public            postgres    false    208            `           2606    25228    courseparticipants CourseId    FK CONSTRAINT     �   ALTER TABLE ONLY public.courseparticipants
    ADD CONSTRAINT "CourseId" FOREIGN KEY (courseid) REFERENCES public.course(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.courseparticipants DROP CONSTRAINT "CourseId";
       public          postgres    false    207    202    2905            b           2606    25238    homework CourseId    FK CONSTRAINT     �   ALTER TABLE ONLY public.homework
    ADD CONSTRAINT "CourseId" FOREIGN KEY (courseid) REFERENCES public.course(id) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.homework DROP CONSTRAINT "CourseId";
       public          postgres    false    207    203    2905            c           2606    25243    submission HomeWorkId    FK CONSTRAINT     �   ALTER TABLE ONLY public.submission
    ADD CONSTRAINT "HomeWorkId" FOREIGN KEY (homeworkid) REFERENCES public.homework(id) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.submission DROP CONSTRAINT "HomeWorkId";
       public          postgres    false    2897    203    205            a           2606    25233    courseparticipants PersonId    FK CONSTRAINT     �   ALTER TABLE ONLY public.courseparticipants
    ADD CONSTRAINT "PersonId" FOREIGN KEY (personid) REFERENCES public.person(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.courseparticipants DROP CONSTRAINT "PersonId";
       public          postgres    false    204    202    2899            d           2606    25248    submission PersonId    FK CONSTRAINT     �   ALTER TABLE ONLY public.submission
    ADD CONSTRAINT "PersonId" FOREIGN KEY (studentid) REFERENCES public.person(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.submission DROP CONSTRAINT "PersonId";
       public          postgres    false    2899    205    204            _           2606    25310    comment authoridfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT authoridfk FOREIGN KEY (authorid) REFERENCES public.person(id) ON UPDATE CASCADE ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.comment DROP CONSTRAINT authoridfk;
       public          postgres    false    204    201    2899            e           2606    25300    course_file course_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_file
    ADD CONSTRAINT course_id_fk FOREIGN KEY (course_id) REFERENCES public.course(id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.course_file DROP CONSTRAINT course_id_fk;
       public          postgres    false    2905    207    209            ^           2606    25305    comment subidfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT subidfk FOREIGN KEY (submissionid) REFERENCES public.submission(id) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.comment DROP CONSTRAINT subidfk;
       public          postgres    false    205    201    2901            �      x������ � �      �   k   x�3�wu�LI-N.�,(���SHL�/-Q(OM����4�4202�50�521��25�2�г07��)�e�霘�\�SZ�����d�,V�-�LL�L�1̆Kp��qqq �L,�      �   e   x�u�M
� Fѱ�E{��Y�hBID�m?j\�ɅC�<���=,`k]�q0��>��+���)!�Q��*6�a����HA����Ơ�F:������ȍ&�      �     x�u�Ar$ E��.t!�`�#��ـ���0N��t%��g��[&�o�FH��w�������܁��6׆�����ce�V*��\#�-� eɉm�F.`����L�Ő{�rW�M}@�-��A�&0vי��<Yb��R�]�z���u�-`�8֩���uZ����gi_��O�x2?�⯈0Z���<�Ӷ��V��g��֗�o�q GJ/��h��v^Qkڶ�Y�j��pU���gp��Z������o�����xu�`Qv��[A����7��#      �   �   x�u�M
�0�ur�^ ���wr���;��F���[�Z����ޛ(��V���d���${�=Y�@B��۰m��L�¦���MۏX�]�j��������T��y�=�z}7����L	X���.@
i���O�}?h      �     x����n�0��3y�dv��q��B��Q1��!Uh�?�
jz@UͿ�/-�Χ����-
"e�$�����׫	��~�IV��f߾�=��E��}�5h�XH� l���B�9��=��J�!�X{�ТK�s)�����31eo�p�~z�������Hc�~aRA	�R��Og�H)k�(q��>��K���f1�Ty�2��$���r�������ԓ|�� {3���˞�Q^�	�����3��r�����G��?�ݹkv��I!�Md��bp�������      �   �   x���?�0���wi���n'\��K0)4)4)跷h��K��q���q�D���rp��օ�%@!!��S* ���c%䕛F`�M�д?����3�2��_��>!�q PJA!w4nC)��.-�q�{_sV}�==�L9S�gm?�V3�^{&[�      �      x������ � �      �   l   x�u�M
�0F�q����#_�ut$�D��B(�~ѩ�^8d�{�����`F�}�ԉ���Y�UW�[)s�y��{5B�	BC�A�Kh���
���Jkn�*�譵/x(�     
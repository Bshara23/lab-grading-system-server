PGDMP         /                y            school    13.1    13.1 +    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    207   �9       �          0    25292    course_file 
   TABLE DATA           c   COPY public.course_file (id, path, course_id, mimetype, title, created_at, updated_at) FROM stdin;
    public          postgres    false    209   �;       �          0    25160    courseparticipants 
   TABLE DATA           Z   COPY public.courseparticipants (personid, courseid, createdat, updatedat, id) FROM stdin;
    public          postgres    false    202   �<       �          0    25167    homework 
   TABLE DATA           d   COPY public.homework (id, courseid, title, description, deadline, createdat, updatedat) FROM stdin;
    public          postgres    false    203   >       �          0    25256    homework_file 
   TABLE DATA           g   COPY public.homework_file (id, path, homework_id, mimetype, title, created_at, updated_at) FROM stdin;
    public          postgres    false    208   *?       �          0    25181    person 
   TABLE DATA           X   COPY public.person (id, fname, lname, password, type, createdat, updatedat) FROM stdin;
    public          postgres    false    204   �@       �          0    25187 
   submission 
   TABLE DATA           ~   COPY public.submission (id, studentid, homeworkid, grade, status, createdat, updatedat, graderid, graderfullname) FROM stdin;
    public          postgres    false    205   FA       �          0    25193    submissionfile 
   TABLE DATA           i   COPY public.submissionfile (id, path, created_at, updated_at, submissionid, mimetype, title) FROM stdin;
    public          postgres    false    206   >B       �           0    0    Homework_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Homework_id_seq"', 3, false);
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
       public          postgres    false    205    201    2901            �     x���;k�0��Y�g��]-ŋ�J)�B tQ�Cl��E�C��BJnЮz�G�ĉ���I2w>�s�Iy�1d�,��ʂH.Ŕ˩��ږ�����aٌ�a}��gUEd��'<bJ�0�ѯ�wm���s/�n�`���:L2�]���������1F����+f��MNa�=�!c�`��v�sF����Rj&����<���~�Ǌ�ۆv��1�8GLQ�IkΑ_a��m�ܴ����ބl)Z]@��ȓO>na5���1n���~亭�      �     x�uS�n�0=�_A����I�+v�Ӗ!@��,3�Y2$y�����&i�"z��#��ɞm�Q�� x�00:���&.�9��Т���� ���e�$'��`�p4v��#�To��b�4^0��ЎRO5{�F5=0�Tpҕ�Sj�)� ����Sz� d/T 7"�Lɿ�ͩ�0*|-��3_{�<ёb����̀Qo,q��e�nUZ�"�Mm�5Y���Ų^T��Zo���������S _g�L�IMv�� O/�9E�u �Qj���!*�Diׇ�G�{(��G����Ԕ�z2��=_'�c4�3�z��x{5�5�l��^���ѣF7��4��$-`Fp�a�������lW�r�<�|
��2;|������X��AvtŶ�+�fOڜutkԕ �GEƜ]��8�9��3|�!�a�Y�M��,��iT��w���6�/-c6��Ɓ�>���ϳ��[�eKQڣUR��0h _��yb^Ʃ���"/��?�b�Fo��˶Y��f��n@�����ZPz      �   �   x�u��
�0E��_�fF�|GW"�TE����ҿ�i�Uf3ܳ�g�9��/�,1(%M"�p"ԧ�=��t�E��Fu�����9J.����8��g����ͤ4Y�	��<�y�}_�n�wq	_�K(�h���YJh�?�`�Ai5��HB���M|j�=��,��\�b����A��
&�,���DnW      �   h  x�}�In\1D��wa��(�^�P���`�����F��"JU�ZxEy�7F&@�w���-� Ï��(��Vct^�ˠe'��]tT�I�A�U/����b�A#2X=,GvՋ��|�o�58:#�T	1�FVS��0)�*���&�w��&zh��P�U�}w�	ұ���:s$vs���Or?�7P����}n�oyC��t��������_�����1g� E[�.պ-����*���:El��ǩ����~�4�s����϶�'�����п�y����N�@������iɰ�=f�S����gQȺ�W���)�#Y���V�SEǌ���㘥��~fah�	)��]5��|\����Ҵ      �   �   x�}��j�0E��W�X�iI��7��S���kY!��;nӦ�qA+c�&�4{Nv}� �5���4e�㻿�t$�	^2Qr�㶖�f�2�w n@[*��qq(�M��2p2F�����)�8RJoYY
5g�X�!��ʊ���y���|��$�f-�~"������U-8�f�F�,�b��T�Y��%�"L��}��\�d-U��@9<�\��_
A���C�D�K=n��>�q��5��,��gZ�'��Y      �   T  x����J�@��ο�x.sn�}*�6�X��߷j�Mb�����s2����e���kTDv3Q	������)��E]<<m���w�0/�Z��Z`5$�z�h���/�*4��;���	e��)�wO�а����>����ͦﶟ���F 7���&� �a��,n�5��p�#|�am����j6H2�<�9�(���7��&�)H:���2x�0x0����a�ha<��(H6�~n5����������u���e�3��8�j���tF��B�i~_Y��e�%z�ب�Ӂ�)�M���0w���_RD�	!�	Һ�����@,      �   �   x�����0��ݻ@֮���I^8/�,�	��a�o�(7�¥i����V���%�!z;Zh�m $qz�.L@�0�����)	KmRF�lb�O�p03L�޼��XC�������~��g�Cչ'�]�������0Ӝɂ�zͶK���gQ�T��K�Rʹ��5B��p[�      �   �   x���KJA�q�*�@���E8���@�Ip�i��Jw���wy�T��¨�� �Sˌ�q9��o���p��0GӨ�q�����n�X�����2!hf�$v����^���
6;�:}v1��/D�G� ��h�]wQiu���
�� ����7#��@�oF�6ẞ6�w��b�	��-e��/�C�y��h�l�M���al�0c�D���#Fw��:M�Ȃ�#      �   �   x�u��
�0��y����8�<�+JZ��Z�A����EJ��<���j��5���ؓw��$�s�,>���8ϗ�S���P�F�$r�:H
�i��L�D��q�C:�3�e? ����q$�y�-�>�����l����2�n��W�[�\B����	�K@     
PGDMP         6            
    y            blr    14.1    14.1 -    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    16470    blr    DATABASE     N   CREATE DATABASE blr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE blr;
                hargunoberoi    false            �            1259    16517    budgetcategories    TABLE     �   CREATE TABLE public.budgetcategories (
    budgets_id integer NOT NULL,
    category_id integer NOT NULL,
    amount real DEFAULT 0 NOT NULL
);
 $   DROP TABLE public.budgetcategories;
       public         heap    hargunoberoi    false            �            1259    16482    budgets    TABLE     �   CREATE TABLE public.budgets (
    id integer NOT NULL,
    name text NOT NULL,
    year integer NOT NULL,
    amount real,
    user_id integer NOT NULL
);
    DROP TABLE public.budgets;
       public         heap    hargunoberoi    false            �            1259    16481    budgets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.budgets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.budgets_id_seq;
       public          hargunoberoi    false    212            3           0    0    budgets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.budgets_id_seq OWNED BY public.budgets.id;
          public          hargunoberoi    false    211            �            1259    16496 
   categories    TABLE     T   CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.categories;
       public         heap    hargunoberoi    false            �            1259    16495    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          hargunoberoi    false    214            4           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          hargunoberoi    false    213            �            1259    16542    expenses    TABLE     �   CREATE TABLE public.expenses (
    id integer NOT NULL,
    description text NOT NULL,
    category text NOT NULL,
    expensedate text NOT NULL,
    amount real NOT NULL,
    payer text NOT NULL,
    submittime text NOT NULL,
    user_id integer
);
    DROP TABLE public.expenses;
       public         heap    hargunoberoi    false            �            1259    16541    expenses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.expenses_id_seq;
       public          hargunoberoi    false    219            5           0    0    expenses_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;
          public          hargunoberoi    false    218            �            1259    16531    payers    TABLE     U   CREATE TABLE public.payers (
    user_id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.payers;
       public         heap    hargunoberoi    false            �            1259    16504    usercategories    TABLE     g   CREATE TABLE public.usercategories (
    category_id integer NOT NULL,
    user_id integer NOT NULL
);
 "   DROP TABLE public.usercategories;
       public         heap    hargunoberoi    false            �            1259    16472    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    hash text NOT NULL,
    income real DEFAULT 60000.00 NOT NULL,
    registerdate text NOT NULL,
    lastlogin text NOT NULL
);
    DROP TABLE public.users;
       public         heap    hargunoberoi    false            �            1259    16471    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          hargunoberoi    false    210            6           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          hargunoberoi    false    209            �           2604    16485 
   budgets id    DEFAULT     h   ALTER TABLE ONLY public.budgets ALTER COLUMN id SET DEFAULT nextval('public.budgets_id_seq'::regclass);
 9   ALTER TABLE public.budgets ALTER COLUMN id DROP DEFAULT;
       public          hargunoberoi    false    211    212    212            �           2604    16499    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          hargunoberoi    false    213    214    214            �           2604    16545    expenses id    DEFAULT     j   ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);
 :   ALTER TABLE public.expenses ALTER COLUMN id DROP DEFAULT;
       public          hargunoberoi    false    218    219    219            �           2604    16475    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          hargunoberoi    false    210    209    210            )          0    16517    budgetcategories 
   TABLE DATA           K   COPY public.budgetcategories (budgets_id, category_id, amount) FROM stdin;
    public          hargunoberoi    false    216   �2       %          0    16482    budgets 
   TABLE DATA           B   COPY public.budgets (id, name, year, amount, user_id) FROM stdin;
    public          hargunoberoi    false    212   �2       '          0    16496 
   categories 
   TABLE DATA           .   COPY public.categories (id, name) FROM stdin;
    public          hargunoberoi    false    214   3       ,          0    16542    expenses 
   TABLE DATA           n   COPY public.expenses (id, description, category, expensedate, amount, payer, submittime, user_id) FROM stdin;
    public          hargunoberoi    false    219   z3       *          0    16531    payers 
   TABLE DATA           /   COPY public.payers (user_id, name) FROM stdin;
    public          hargunoberoi    false    217   �<       (          0    16504    usercategories 
   TABLE DATA           >   COPY public.usercategories (category_id, user_id) FROM stdin;
    public          hargunoberoi    false    215   �<       #          0    16472    users 
   TABLE DATA           T   COPY public.users (id, username, hash, income, registerdate, lastlogin) FROM stdin;
    public          hargunoberoi    false    210   �<       7           0    0    budgets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.budgets_id_seq', 1, true);
          public          hargunoberoi    false    211            8           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 9, true);
          public          hargunoberoi    false    213            9           0    0    expenses_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.expenses_id_seq', 140, true);
          public          hargunoberoi    false    218            :           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          hargunoberoi    false    209            �           2606    16489    budgets budgets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.budgets
    ADD CONSTRAINT budgets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.budgets DROP CONSTRAINT budgets_pkey;
       public            hargunoberoi    false    212            �           2606    16503    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            hargunoberoi    false    214            �           2606    16549    expenses expenses_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.expenses DROP CONSTRAINT expenses_pkey;
       public            hargunoberoi    false    219            �           2606    16480    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            hargunoberoi    false    210            �           2606    16521 1   budgetcategories budgetcategories_budgets_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.budgetcategories
    ADD CONSTRAINT budgetcategories_budgets_id_fkey FOREIGN KEY (budgets_id) REFERENCES public.budgets(id);
 [   ALTER TABLE ONLY public.budgetcategories DROP CONSTRAINT budgetcategories_budgets_id_fkey;
       public          hargunoberoi    false    216    212    3467            �           2606    16526 2   budgetcategories budgetcategories_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.budgetcategories
    ADD CONSTRAINT budgetcategories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 \   ALTER TABLE ONLY public.budgetcategories DROP CONSTRAINT budgetcategories_category_id_fkey;
       public          hargunoberoi    false    3469    214    216            �           2606    16490    budgets budgets_user_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.budgets
    ADD CONSTRAINT budgets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.budgets DROP CONSTRAINT budgets_user_id_fkey;
       public          hargunoberoi    false    212    210    3465            �           2606    16550    expenses budgets_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT budgets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.expenses DROP CONSTRAINT budgets_user_id_fkey;
       public          hargunoberoi    false    210    3465    219            �           2606    16536    payers payers_user_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.payers
    ADD CONSTRAINT payers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.payers DROP CONSTRAINT payers_user_id_fkey;
       public          hargunoberoi    false    3465    210    217            �           2606    16507 .   usercategories usercategories_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usercategories
    ADD CONSTRAINT usercategories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 X   ALTER TABLE ONLY public.usercategories DROP CONSTRAINT usercategories_category_id_fkey;
       public          hargunoberoi    false    215    3469    214            �           2606    16512 *   usercategories usercategories_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usercategories
    ADD CONSTRAINT usercategories_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.usercategories DROP CONSTRAINT usercategories_user_id_fkey;
       public          hargunoberoi    false    210    3465    215            )   3   x�3�4�4�34�2�42LL�c���ab iS m Rbc�C1z\\\ ?;	W      %   &   x�3�tJ�KO��/J�4202�4L�60�4����� zy�      '   i   x���
�P���=EO ؟�/lg`��\b��+�����pJԞ��*3���eV{q�.t�Xu���7�<��4�爇����p������� �3���˾ ��< D      ,   �  x���Ms�6��Я�q�\^_��-�󱱭���=�3iX�S$G����狚A���������~���S]��EQ�����g򱨊�1���K}Kӷ���w���;*���IͥΙ!􆽢����DfY�������E̠���1��C�$c<F�f�A�qQs(�(�b=�D�:z"3Ǘ�H#c��,K���Ĝ��*�1,OA�3'}SIx��9���:�����(�F�9� ��c���l�5È��`f%1#2�� c�`�z<P�g���4����&5o9�3�{�d9��Lf10(�F�����8r���13�}�d�1�
����Tb�����n0�R�11*~(�qY<���+�?\ג�}r�!�Wԑ��ʾ�I��xs۸�#�ֻ�77cx`!�>�O�i�;������m�mI�슲�
��ˤ@����U�����\���pF���f����zæ����{P*ׅ��4�E�o8.�t��î��n׸�c1��A�:�$�-�n��dռ�&���22�m��O���%4qk��]�ۭ7�?�� �TNU�;d�pW�MX�l�Pt���j��i<
�gl��g�����y� ���3� jf�q�.��]�DF���u�F��OuU�di�@Dq��s�&�|��乨�(5&Gq�������v1��)��	�$��v]Û@͉>?����[&��q��7ɲ��n��`<T�{�������+ʧ�K�# 	뺦I��l&��m��϶���{D\���� Jg{�M�M\��wTӎ4J�����܇�uʉ>$�SQ�ge����s��omg��n��_�W�Q��9�axvhb���_?�w$�4�2�d?3�F!ܘ(C��w���:�Pq7d���I��&p�#�W������i�7oB��p�a$�@M.%D��\�e@_ѭ�p�
�� �`v�^���KU�tcȸ:+�b�	h��peHPܖN\X���"g:O�d�|��](~k���r��m��m��+�\f� � ۭ��^�ځ�&\��?����毀�&�X�,�ΕI垓-�A(5�C�����L�ok�6G���&l��"��V3F��{WT�$,���eE/F� D�2a�^��0��gk���JG>� 0ԣomՅ"��Y�0��kAqrg����wv�Ix[�>��s����D5�Kԕ��}����W�G,�f�n�@ئY;k/��d�T�ܓ�<y���h һ�w0�ȭm����x�.0�_!^��!C��I04�]c����D�!~�ؔ*�{�֚ ���D!R�Y\2��!��5�����G֜�R<tw���u�o�䟘�����M�u��3���ɱ�?D p����,��&�V�ʛU�D$�u��y0��C�펞���W����6�#F�!�֫"��~�b(��.�����2��2�"��Hٱg9�9�e�Q���a^�!{6-�p�OP8��c�Z_%w�_�/	�9X{�> �8�E���z�_�� ��0d/}�o*�r�C^P&t3#k�+*
Q��^G�p�����CgK1����O7(���ۘPqkC�ֻ�+���7��1�D/FI�\�B��B���yާ�Rq2O1m�ޜ���y��Կ��)cv�5���\�������?�q�@�\�H9W�C�/�-6�r���5r3�<��D_�k�뇷� L��!Qm�JZ[���@
��I�t]�����>W�ϋ}��o*�����f?I�Ԑonk������|����C���Ǘ�¡�%���{u�\���˂=Z~��ؕ��y�%=��4��ђR6��=��������O>c)�_#�0
�<�cL{c1�d=E(�ȉ��S��3�fJV{L&D��������r��O�b��n���v�e�!�M ��'E�H�y����[׶E]]�
�K�� ����?�����l*�~,Na��CB�)١��<Eŉ����1'Pp��l���������ZMx '����D6@�0�"�%��0~���ˀvɾ�1\L�0ZNP�!����H?sN�D�@x�/d�?��������;�͠1���T�m�5�v!B��v����S=aϣ��]P�������B���4�Gd�ˬ��7��������(ɱ��B�ea3Q������&v��q���Ɛ��VM�t��d��,ұ��7g��)dΧ�(��s���0������� ��s      *      x������ � �      (   @   x�ʹ�0���X�f��ۋ���6�ZF0��qp�e�馛n��[]�	Ox����'������      #     x�m�;OQ��z�WXЙș빴�c���ff�A#*��}����)�b��n�ۼ=�>�w��vi(Z@�t�1> l�3h-�$�T`��Ck�9	�Bl��j&.�Rv^u4[���<��b	\0�k���n�^}��j����]\��4G�Q�E7���9Y�@��FoJ��{C¤"L�mȒ~Ua|@�\� ��Txj�c����n}Zu���zg ɱ�F�r0ɒ+at4�\��8kR7���m�SM
C�y�?*,�id�B<��P,���E��?��q     
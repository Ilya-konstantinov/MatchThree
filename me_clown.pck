GDPC                                                                               <   res://.import/Gray.png-86eb58dbcab696be1601153a322cc2d3.stex�      j       �IlY+���|k'�u�y<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stexP      �      &�y���ڞu;>��.p   res://Dot.gd.remap  �             �l�bC� i)[C!ǃ�   res://Dot.gdc   �      �      � ��MS^��|e��   res://Dots.tscn @      �      4��W���ld2�i��   res://Gray.png.import   P      �      ݆�]�1~?Z��ϡ�   res://Main.gd.remap               �(@Er�#��K�F�[   res://Main.gdc   
      {      Tƫ��ijML��D��   res://Main.tscn �            U們��,���=�%�   res://default_env.tres  �      �       um�`�N��<*ỳ�8   res://icon.png         �      G1?��z�c��vN��   res://icon.png.import   0      �      ��fe��6�B��^ U�   res://project.binary+      �      W�2m�h��2�� 1�        GDSC             5      �����ض�   �����϶�   �������Ŷ���   ����׶��   ���Ӷ���   ����������ض   ���������������������ض�                                                    	      
                                       $      %      '      (      .      0      1      2      3      3YYYYYY0�  PQV�  �  -YYY0�  P�  QV�  �  -YY0�  P�  QV�  �  -YY0�  PQV�  -�  �  �  Y`               [gd_scene load_steps=2 format=2]

[ext_resource path="res://Dot.gd" type="Script" id=1]

[node name="Button" type="Button"]
margin_right = 12.0
margin_bottom = 20.0
rect_scale = Vector2( 3, 2 )
script = ExtResource( 1 )

[node name="Tween" type="Tween" parent="."]

[node name="AnimatedSprite" type="AnimatedSprite" parent="."]

[connection signal="button_down" from="." to="." method="_on_Button_button_down"]
     GDST�  �           N   WEBPRIFFB   WEBPVP8L5   /�C� P��� E���"�������������������������������$       [remap]

importer="texture"
type="StreamTexture"
path="res://.import/Gray.png-86eb58dbcab696be1601153a322cc2d3.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Gray.png"
dest_files=[ "res://.import/Gray.png-86eb58dbcab696be1601153a322cc2d3.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              GDSC            ^      ���ӄ�   �������Ҷ���   ���¶���   �������Ӷ���   ������ƶ   ����Ķ��   ����   �������Ŷ���   �����϶�   ��������Ҷ��   �������޶���   ��������ض��   ��������Ŷ��   ���۶���   �ٶ�                              	                                 	   !   
   '      (      .      0      1      7      9      :      E      F      H      I      V      X      Y      Z      [      \      3YY5;�  Y5;�  Y1�  V�  -�  �  Y5;�  �  T�  PQY5;�  YY0�  PQV�  -YY0�	  PQV�  -YY0�
  P�  V�  �  QV�  �  -YY0�  P�  V�  R�  V�  QV�  -�  YYYY`     [gd_scene load_steps=4 format=2]

[ext_resource path="res://Main.gd" type="Script" id=1]
[ext_resource path="res://Dots.tscn" type="PackedScene" id=2]
[ext_resource path="res://Gray.png" type="Texture" id=3]

[node name="Node2D" type="Node2D"]
script = ExtResource( 1 )

[node name="Фон1" type="Sprite" parent="."]
position = Vector2( 168.5, 538.5 )
scale = Vector2( 0.335, 1.43333 )
texture = ExtResource( 3 )

[node name="Фон2" type="Sprite" parent="."]
position = Vector2( 1314.25, 541 )
scale = Vector2( 0.3275, 1.43333 )
texture = ExtResource( 3 )

[node name="todel_enemy" type="ColorRect" parent="."]
margin_left = 332.0
margin_right = 1147.0
margin_bottom = 402.0
color = Color( 0.858824, 0.239216, 0.239216, 1 )

[node name="todel_health" type="ColorRect" parent="."]
margin_left = 1478.0
margin_top = 621.0
margin_right = 1926.0
margin_bottom = 804.0
color = Color( 0.313726, 0.243137, 0.933333, 1 )

[node name="todel_turns" type="ColorRect" parent="."]
margin_left = 1476.0
margin_top = 805.0
margin_right = 1924.0
margin_bottom = 1074.0

[node name="Cпособности" type="VBoxContainer" parent="."]
margin_left = 1482.0
margin_right = 1919.0
margin_bottom = 610.0

[node name="Button4" type="Button" parent="Cпособности"]
margin_right = 437.0
margin_bottom = 20.0

[node name="Button" type="Button" parent="Cпособности"]
margin_top = 24.0
margin_right = 437.0
margin_bottom = 44.0

[node name="Button2" type="Button" parent="Cпособности"]
margin_top = 48.0
margin_right = 437.0
margin_bottom = 68.0

[node name="Button3" type="Button" parent="Cпособности"]
margin_top = 72.0
margin_right = 437.0
margin_bottom = 92.0

[node name="Dots_container" type="GridContainer" parent="."]
margin_left = 335.0
margin_top = 402.0
margin_right = 1148.0
margin_bottom = 1080.0

[node name="Dots2" parent="Dots_container" instance=ExtResource( 2 )]
rect_scale = Vector2( 1, 1 )

[node name="Dots" parent="Dots_container" instance=ExtResource( 2 )]
margin_top = 24.0
margin_bottom = 44.0
rect_scale = Vector2( 1, 1 )
             [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              [remap]

path="res://Dot.gdc"
  [remap]

path="res://Main.gdc"
 �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name         me_clown   application/run/main_scene         res://Main.tscn    application/config/icon         res://icon.png     display/window/size/width      �     display/window/size/height      8  +   gui/common/drop_mouse_on_gui_input_disabled         )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres  
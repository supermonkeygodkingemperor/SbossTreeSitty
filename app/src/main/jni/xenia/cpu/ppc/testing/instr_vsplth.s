test_vsplth_1:
  #_ REGISTER_IN v4 [00010203, 04050607, 08090A0B, 0C0D0E0F]
  vsplth v3, v4, 0
  blr
  #_ REGISTER_OUT v3 [00010001, 00010001, 00010001, 00010001]
  #_ REGISTER_OUT v4 [00010203, 04050607, 08090A0B, 0C0D0E0F]

test_vsplth_2:
  #_ REGISTER_IN v4 [00010203, 04050607, 08090A0B, 0C0D0E0F]
  vsplth v3, v4, 1
  blr
  #_ REGISTER_OUT v3 [02030203, 02030203, 02030203, 02030203]
  #_ REGISTER_OUT v4 [00010203, 04050607, 08090A0B, 0C0D0E0F]

test_vsplth_3:
  #_ REGISTER_IN v4 [00010203, 04050607, 08090A0B, 0C0D0E0F]
  vsplth v3, v4, 7
  blr
  #_ REGISTER_OUT v3 [0E0F0E0F, 0E0F0E0F, 0E0F0E0F, 0E0F0E0F]
  #_ REGISTER_OUT v4 [00010203, 04050607, 08090A0B, 0C0D0E0F]

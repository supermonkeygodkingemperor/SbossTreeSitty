test_vslw_1:
  #_ REGISTER_IN v3 [FFFFFFFF, FFFFFFFF, FFFFFFFF, FFFFFFFF]
  #_ REGISTER_IN v4 [00000000, 00000000, 00000000, 00000000]
  vslw v3, v3, v4
  blr
  #_ REGISTER_OUT v3 [FFFFFFFF, FFFFFFFF, FFFFFFFF, FFFFFFFF]
  #_ REGISTER_OUT v4 [00000000, 00000000, 00000000, 00000000]

test_vslw_2:
  #_ REGISTER_IN v3 [FFFFFFFF, FFFFFFFF, FFFFFFFF, FFFFFFFF]
  #_ REGISTER_IN v4 [00000001, 00000001, 00000001, 00000001]
  vslw v3, v3, v4
  blr
  #_ REGISTER_OUT v3 [FFFFFFFE, FFFFFFFE, FFFFFFFE, FFFFFFFE]
  #_ REGISTER_OUT v4 [00000001, 00000001, 00000001, 00000001]

test_vslw_3:
  #_ REGISTER_IN v3 [FFFFFFFF, FFFFFFFF, FFFFFFFF, FFFFFFFF]
  #_ REGISTER_IN v4 [0000001F, 0000001F, 0000001F, 0000001F]
  vslw v3, v3, v4
  blr
  #_ REGISTER_OUT v3 [80000000, 80000000, 80000000, 80000000]
  #_ REGISTER_OUT v4 [0000001F, 0000001F, 0000001F, 0000001F]

test_vslw_4:
  #_ REGISTER_IN v3 [FFFFFFFF, FFFFFFFF, FFFFFFFF, FFFFFFFF]
  #_ REGISTER_IN v4 [00000020, 00000020, 00000020, 00000020]
  vslw v3, v3, v4
  blr
  #_ REGISTER_OUT v3 [FFFFFFFF, FFFFFFFF, FFFFFFFF, FFFFFFFF]
  #_ REGISTER_OUT v4 [00000020, 00000020, 00000020, 00000020]

test_vslw_5:
  #_ REGISTER_IN v3 [FFFFFFFF, FFFFFFFF, FFFFFFFF, FFFFFFFF]
  #_ REGISTER_IN v4 [00000009, 00000009, 00000009, 00000009]
  vslw v3, v3, v4
  blr
  #_ REGISTER_OUT v3 [FFFFFE00, FFFFFE00, FFFFFE00, FFFFFE00]
  #_ REGISTER_OUT v4 [00000009, 00000009, 00000009, 00000009]

test_vslw_6:
  #_ REGISTER_IN v3 [FFFFFFFF, FFFFFFFF, FFFFFFFF, FFFFFFFF]
  #_ REGISTER_IN v4 [00000021, 00000021, 00000021, 00000021]
  vslw v3, v3, v4
  blr
  #_ REGISTER_OUT v3 [FFFFFFFE, FFFFFFFE, FFFFFFFE, FFFFFFFE]
  #_ REGISTER_OUT v4 [00000021, 00000021, 00000021, 00000021]

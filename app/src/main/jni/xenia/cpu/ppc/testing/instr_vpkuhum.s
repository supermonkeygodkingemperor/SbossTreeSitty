test_vpkuhum_1:
  # {0, 1, 2, 3, 4, 5, 6, 7}
  #_ REGISTER_IN v3 [00000001, 00020003, 00040005, 00060007]
  # {8, 9, 10, 11, 12, 13, 14, 15}
  #_ REGISTER_IN v4 [00080009, 000A000B, 000C000D, 000E000F]
  vpkuhum v5, v3, v4
  blr
  #_ REGISTER_OUT v3 [00000001, 00020003, 00040005, 00060007]
  #_ REGISTER_OUT v4 [00080009, 000A000B, 000C000D, 000E000F]
  # {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
  #_ REGISTER_OUT v5 [00010203, 04050607, 08090A0B, 0C0D0E0F]
  blr

test_vpkuhum_2:
  # {-8, -7, -6, -5, -4, -3, -2, -1}
  #_ REGISTER_IN v3 [FFF8FFF9, FFFAFFFB, FFFCFFFD, FFFEFFFF]
  # {0, 1, 2, 3, 4, 5, 6, 7}
  #_ REGISTER_IN v4 [00000001, 00020003, 00040005, 00060007]
  vpkuhum v5, v3, v4
  blr
  #_ REGISTER_OUT v3 [FFF8FFF9, FFFAFFFB, FFFCFFFD, FFFEFFFF]
  #_ REGISTER_OUT v4 [00000001, 00020003, 00040005, 00060007]
  # {-8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7}
  #_ REGISTER_OUT v5 [F8F9FAFB, FCFDFEFF, 00010203, 04050607]
  blr

test_vpkuhum_3:
  # {0, 65535, 65535, 0, 0, 0, 65535, 0}
  #_ REGISTER_IN v3 [0000FFFF, FFFF0000, 00000000, FFFF0000]
  # {65535, 0, 0, 65535, 65535, 65535, 0, 65535}
  #_ REGISTER_IN v4 [FFFF0000, 0000FFFF, FFFFFFFF, 0000FFFF]
  vpkuhum v5, v3, v4
  blr
  #_ REGISTER_OUT v3 [0000FFFF, FFFF0000, 00000000, FFFF0000]
  #_ REGISTER_OUT v4 [FFFF0000, 0000FFFF, FFFFFFFF, 0000FFFF]
  # {0, 255, 255, 0, 0, 0, 255, 0, 255, 0, 0, 255, 255, 255, 0, 255}
  #_ REGISTER_OUT v5 [00FFFF00, 0000FF00, FF0000FF, FFFF00FF]
  blr

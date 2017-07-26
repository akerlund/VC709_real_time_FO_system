library ieee;
use ieee.std_logic_1164.all;
entity synenc is
    port(
        in_data     :    in  std_logic_vector(246 downto 0);
        out_data    :    out std_logic_vector(254 downto 0)
);
end entity;

architecture arch of synenc is
begin
out_data(246 downto 0) <= in_data;
out_data(254)<= in_data(246) xor in_data(244) xor in_data(243) xor in_data(239) xor in_data(238) xor in_data(237) xor in_data(236) xor in_data(234) xor in_data(229) xor in_data(228) xor in_data(227) xor in_data(226) xor in_data(225) xor in_data(224) xor in_data(223) xor in_data(222) xor in_data(219) xor in_data(214) xor in_data(212) xor in_data(209) xor in_data(208) xor in_data(207) xor in_data(206) xor in_data(205) xor in_data(203) xor in_data(201) xor in_data(199) xor in_data(197) xor in_data(196) xor in_data(195) xor in_data(189) xor in_data(188) xor in_data(184) xor in_data(182) xor in_data(180) xor in_data(179) xor in_data(176) xor in_data(175) xor in_data(172) xor in_data(170) xor in_data(169) xor in_data(168) xor in_data(167) xor in_data(166) xor in_data(165) xor in_data(163) xor in_data(162) xor in_data(161) xor in_data(160) xor in_data(157) xor in_data(156) xor in_data(154) xor in_data(153) xor in_data(152) xor in_data(150) xor in_data(149) xor in_data(148) xor in_data(145) xor in_data(143) xor in_data(141) xor in_data(138) xor in_data(136) xor in_data(132) xor in_data(129) xor in_data(127) xor in_data(126) xor in_data(124) xor in_data(120) xor in_data(119) xor in_data(116) xor in_data(115) xor in_data(114) xor in_data(111) xor in_data(110) xor in_data(109) xor in_data(108) xor in_data(104) xor in_data(103) xor in_data(101) xor in_data(100) xor in_data(95) xor in_data(91) xor in_data(89) xor in_data(88) xor in_data(87) xor in_data(85) xor in_data(83) xor in_data(82) xor in_data(81) xor in_data(80) xor in_data(78) xor in_data(77) xor in_data(75) xor in_data(74) xor in_data(73) xor in_data(72) xor in_data(71) xor in_data(66) xor in_data(65) xor in_data(63) xor in_data(60) xor in_data(59) xor in_data(57) xor in_data(55) xor in_data(54) xor in_data(52) xor in_data(51) xor in_data(49) xor in_data(47) xor in_data(41) xor in_data(38) xor in_data(37) xor in_data(36) xor in_data(34) xor in_data(33) xor in_data(30) xor in_data(27) xor in_data(24) xor in_data(23) xor in_data(16) xor in_data(15) xor in_data(14) xor in_data(12) xor in_data(9) xor in_data(5) xor in_data(4) xor in_data(3);

out_data(253)<= in_data(245) xor in_data(243) xor in_data(242) xor in_data(238) xor in_data(237) xor in_data(236) xor in_data(235) xor in_data(233) xor in_data(228) xor in_data(227) xor in_data(226) xor in_data(225) xor in_data(224) xor in_data(223) xor in_data(222) xor in_data(221) xor in_data(218) xor in_data(213) xor in_data(211) xor in_data(208) xor in_data(207) xor in_data(206) xor in_data(205) xor in_data(204) xor in_data(202) xor in_data(200) xor in_data(198) xor in_data(196) xor in_data(195) xor in_data(194) xor in_data(188) xor in_data(187) xor in_data(183) xor in_data(181) xor in_data(179) xor in_data(178) xor in_data(175) xor in_data(174) xor in_data(171) xor in_data(169) xor in_data(168) xor in_data(167) xor in_data(166) xor in_data(165) xor in_data(164) xor in_data(162) xor in_data(161) xor in_data(160) xor in_data(159) xor in_data(156) xor in_data(155) xor in_data(153) xor in_data(152) xor in_data(151) xor in_data(149) xor in_data(148) xor in_data(147) xor in_data(144) xor in_data(142) xor in_data(140) xor in_data(137) xor in_data(135) xor in_data(131) xor in_data(128) xor in_data(126) xor in_data(125) xor in_data(123) xor in_data(119) xor in_data(118) xor in_data(115) xor in_data(114) xor in_data(113) xor in_data(110) xor in_data(109) xor in_data(108) xor in_data(107) xor in_data(103) xor in_data(102) xor in_data(100) xor in_data(99) xor in_data(94) xor in_data(90) xor in_data(88) xor in_data(87) xor in_data(86) xor in_data(84) xor in_data(82) xor in_data(81) xor in_data(80) xor in_data(79) xor in_data(77) xor in_data(76) xor in_data(74) xor in_data(73) xor in_data(72) xor in_data(71) xor in_data(70) xor in_data(65) xor in_data(64) xor in_data(62) xor in_data(59) xor in_data(58) xor in_data(56) xor in_data(54) xor in_data(53) xor in_data(51) xor in_data(50) xor in_data(48) xor in_data(46) xor in_data(40) xor in_data(37) xor in_data(36) xor in_data(35) xor in_data(33) xor in_data(32) xor in_data(29) xor in_data(26) xor in_data(23) xor in_data(22) xor in_data(15) xor in_data(14) xor in_data(13) xor in_data(11) xor in_data(8) xor in_data(4) xor in_data(3) xor in_data(2);

out_data(252)<= in_data(244) xor in_data(242) xor in_data(241) xor in_data(237) xor in_data(236) xor in_data(235) xor in_data(234) xor in_data(232) xor in_data(227) xor in_data(226) xor in_data(225) xor in_data(224) xor in_data(223) xor in_data(222) xor in_data(221) xor in_data(220) xor in_data(217) xor in_data(212) xor in_data(210) xor in_data(207) xor in_data(206) xor in_data(205) xor in_data(204) xor in_data(203) xor in_data(201) xor in_data(199) xor in_data(197) xor in_data(195) xor in_data(194) xor in_data(193) xor in_data(187) xor in_data(186) xor in_data(182) xor in_data(180) xor in_data(178) xor in_data(177) xor in_data(174) xor in_data(173) xor in_data(170) xor in_data(168) xor in_data(167) xor in_data(166) xor in_data(165) xor in_data(164) xor in_data(163) xor in_data(161) xor in_data(160) xor in_data(159) xor in_data(158) xor in_data(155) xor in_data(154) xor in_data(152) xor in_data(151) xor in_data(150) xor in_data(148) xor in_data(147) xor in_data(146) xor in_data(143) xor in_data(141) xor in_data(139) xor in_data(136) xor in_data(134) xor in_data(130) xor in_data(127) xor in_data(125) xor in_data(124) xor in_data(122) xor in_data(118) xor in_data(117) xor in_data(114) xor in_data(113) xor in_data(112) xor in_data(109) xor in_data(108) xor in_data(107) xor in_data(106) xor in_data(102) xor in_data(101) xor in_data(99) xor in_data(98) xor in_data(93) xor in_data(89) xor in_data(87) xor in_data(86) xor in_data(85) xor in_data(83) xor in_data(81) xor in_data(80) xor in_data(79) xor in_data(78) xor in_data(76) xor in_data(75) xor in_data(73) xor in_data(72) xor in_data(71) xor in_data(70) xor in_data(69) xor in_data(64) xor in_data(63) xor in_data(61) xor in_data(58) xor in_data(57) xor in_data(55) xor in_data(53) xor in_data(52) xor in_data(50) xor in_data(49) xor in_data(47) xor in_data(45) xor in_data(39) xor in_data(36) xor in_data(35) xor in_data(34) xor in_data(32) xor in_data(31) xor in_data(28) xor in_data(25) xor in_data(22) xor in_data(21) xor in_data(14) xor in_data(13) xor in_data(12) xor in_data(10) xor in_data(7) xor in_data(3) xor in_data(2) xor in_data(1);

out_data(251)<= in_data(243) xor in_data(241) xor in_data(240) xor in_data(236) xor in_data(235) xor in_data(234) xor in_data(233) xor in_data(231) xor in_data(226) xor in_data(225) xor in_data(224) xor in_data(223) xor in_data(222) xor in_data(221) xor in_data(220) xor in_data(219) xor in_data(216) xor in_data(211) xor in_data(209) xor in_data(206) xor in_data(205) xor in_data(204) xor in_data(203) xor in_data(202) xor in_data(200) xor in_data(198) xor in_data(196) xor in_data(194) xor in_data(193) xor in_data(192) xor in_data(186) xor in_data(185) xor in_data(181) xor in_data(179) xor in_data(177) xor in_data(176) xor in_data(173) xor in_data(172) xor in_data(169) xor in_data(167) xor in_data(166) xor in_data(165) xor in_data(164) xor in_data(163) xor in_data(162) xor in_data(160) xor in_data(159) xor in_data(158) xor in_data(157) xor in_data(154) xor in_data(153) xor in_data(151) xor in_data(150) xor in_data(149) xor in_data(147) xor in_data(146) xor in_data(145) xor in_data(142) xor in_data(140) xor in_data(138) xor in_data(135) xor in_data(133) xor in_data(129) xor in_data(126) xor in_data(124) xor in_data(123) xor in_data(121) xor in_data(117) xor in_data(116) xor in_data(113) xor in_data(112) xor in_data(111) xor in_data(108) xor in_data(107) xor in_data(106) xor in_data(105) xor in_data(101) xor in_data(100) xor in_data(98) xor in_data(97) xor in_data(92) xor in_data(88) xor in_data(86) xor in_data(85) xor in_data(84) xor in_data(82) xor in_data(80) xor in_data(79) xor in_data(78) xor in_data(77) xor in_data(75) xor in_data(74) xor in_data(72) xor in_data(71) xor in_data(70) xor in_data(69) xor in_data(68) xor in_data(63) xor in_data(62) xor in_data(60) xor in_data(57) xor in_data(56) xor in_data(54) xor in_data(52) xor in_data(51) xor in_data(49) xor in_data(48) xor in_data(46) xor in_data(44) xor in_data(38) xor in_data(35) xor in_data(34) xor in_data(33) xor in_data(31) xor in_data(30) xor in_data(27) xor in_data(24) xor in_data(21) xor in_data(20) xor in_data(13) xor in_data(12) xor in_data(11) xor in_data(9) xor in_data(6) xor in_data(2) xor in_data(1) xor in_data(0);

out_data(250)<= in_data(246) xor in_data(244) xor in_data(243) xor in_data(242) xor in_data(240) xor in_data(238) xor in_data(237) xor in_data(236) xor in_data(235) xor in_data(233) xor in_data(232) xor in_data(230) xor in_data(229) xor in_data(228) xor in_data(227) xor in_data(226) xor in_data(221) xor in_data(220) xor in_data(218) xor in_data(215) xor in_data(214) xor in_data(212) xor in_data(210) xor in_data(209) xor in_data(207) xor in_data(206) xor in_data(204) xor in_data(202) xor in_data(196) xor in_data(193) xor in_data(192) xor in_data(191) xor in_data(189) xor in_data(188) xor in_data(185) xor in_data(182) xor in_data(179) xor in_data(178) xor in_data(171) xor in_data(170) xor in_data(169) xor in_data(167) xor in_data(164) xor in_data(160) xor in_data(159) xor in_data(158) xor in_data(154) xor in_data(146) xor in_data(144) xor in_data(143) xor in_data(139) xor in_data(138) xor in_data(137) xor in_data(136) xor in_data(134) xor in_data(129) xor in_data(128) xor in_data(127) xor in_data(126) xor in_data(125) xor in_data(124) xor in_data(123) xor in_data(122) xor in_data(119) xor in_data(114) xor in_data(112) xor in_data(109) xor in_data(108) xor in_data(107) xor in_data(106) xor in_data(105) xor in_data(103) xor in_data(101) xor in_data(99) xor in_data(97) xor in_data(96) xor in_data(95) xor in_data(89) xor in_data(88) xor in_data(84) xor in_data(82) xor in_data(80) xor in_data(79) xor in_data(76) xor in_data(75) xor in_data(72) xor in_data(70) xor in_data(69) xor in_data(68) xor in_data(67) xor in_data(66) xor in_data(65) xor in_data(63) xor in_data(62) xor in_data(61) xor in_data(60) xor in_data(57) xor in_data(56) xor in_data(54) xor in_data(53) xor in_data(52) xor in_data(50) xor in_data(49) xor in_data(48) xor in_data(45) xor in_data(43) xor in_data(41) xor in_data(38) xor in_data(36) xor in_data(32) xor in_data(29) xor in_data(27) xor in_data(26) xor in_data(24) xor in_data(20) xor in_data(19) xor in_data(16) xor in_data(15) xor in_data(14) xor in_data(11) xor in_data(10) xor in_data(9) xor in_data(8) xor in_data(4) xor in_data(3) xor in_data(1) xor in_data(0);

out_data(249)<= in_data(246) xor in_data(245) xor in_data(244) xor in_data(242) xor in_data(241) xor in_data(238) xor in_data(235) xor in_data(232) xor in_data(231) xor in_data(224) xor in_data(223) xor in_data(222) xor in_data(220) xor in_data(217) xor in_data(213) xor in_data(212) xor in_data(211) xor in_data(207) xor in_data(199) xor in_data(197) xor in_data(196) xor in_data(192) xor in_data(191) xor in_data(190) xor in_data(189) xor in_data(187) xor in_data(182) xor in_data(181) xor in_data(180) xor in_data(179) xor in_data(178) xor in_data(177) xor in_data(176) xor in_data(175) xor in_data(172) xor in_data(167) xor in_data(165) xor in_data(162) xor in_data(161) xor in_data(160) xor in_data(159) xor in_data(158) xor in_data(156) xor in_data(154) xor in_data(152) xor in_data(150) xor in_data(149) xor in_data(148) xor in_data(142) xor in_data(141) xor in_data(137) xor in_data(135) xor in_data(133) xor in_data(132) xor in_data(129) xor in_data(128) xor in_data(125) xor in_data(123) xor in_data(122) xor in_data(121) xor in_data(120) xor in_data(119) xor in_data(118) xor in_data(116) xor in_data(115) xor in_data(114) xor in_data(113) xor in_data(110) xor in_data(109) xor in_data(107) xor in_data(106) xor in_data(105) xor in_data(103) xor in_data(102) xor in_data(101) xor in_data(98) xor in_data(96) xor in_data(94) xor in_data(91) xor in_data(89) xor in_data(85) xor in_data(82) xor in_data(80) xor in_data(79) xor in_data(77) xor in_data(73) xor in_data(72) xor in_data(69) xor in_data(68) xor in_data(67) xor in_data(64) xor in_data(63) xor in_data(62) xor in_data(61) xor in_data(57) xor in_data(56) xor in_data(54) xor in_data(53) xor in_data(48) xor in_data(44) xor in_data(42) xor in_data(41) xor in_data(40) xor in_data(38) xor in_data(36) xor in_data(35) xor in_data(34) xor in_data(33) xor in_data(31) xor in_data(30) xor in_data(28) xor in_data(27) xor in_data(26) xor in_data(25) xor in_data(24) xor in_data(19) xor in_data(18) xor in_data(16) xor in_data(13) xor in_data(12) xor in_data(10) xor in_data(8) xor in_data(7) xor in_data(5) xor in_data(4) xor in_data(2) xor in_data(0);

out_data(248)<= in_data(246) xor in_data(245) xor in_data(241) xor in_data(240) xor in_data(239) xor in_data(238) xor in_data(236) xor in_data(231) xor in_data(230) xor in_data(229) xor in_data(228) xor in_data(227) xor in_data(226) xor in_data(225) xor in_data(224) xor in_data(221) xor in_data(216) xor in_data(214) xor in_data(211) xor in_data(210) xor in_data(209) xor in_data(208) xor in_data(207) xor in_data(205) xor in_data(203) xor in_data(201) xor in_data(199) xor in_data(198) xor in_data(197) xor in_data(191) xor in_data(190) xor in_data(186) xor in_data(184) xor in_data(182) xor in_data(181) xor in_data(178) xor in_data(177) xor in_data(174) xor in_data(172) xor in_data(171) xor in_data(170) xor in_data(169) xor in_data(168) xor in_data(167) xor in_data(165) xor in_data(164) xor in_data(163) xor in_data(162) xor in_data(159) xor in_data(158) xor in_data(156) xor in_data(155) xor in_data(154) xor in_data(152) xor in_data(151) xor in_data(150) xor in_data(147) xor in_data(145) xor in_data(143) xor in_data(140) xor in_data(138) xor in_data(134) xor in_data(131) xor in_data(129) xor in_data(128) xor in_data(126) xor in_data(122) xor in_data(121) xor in_data(118) xor in_data(117) xor in_data(116) xor in_data(113) xor in_data(112) xor in_data(111) xor in_data(110) xor in_data(106) xor in_data(105) xor in_data(103) xor in_data(102) xor in_data(97) xor in_data(93) xor in_data(91) xor in_data(90) xor in_data(89) xor in_data(87) xor in_data(85) xor in_data(84) xor in_data(83) xor in_data(82) xor in_data(80) xor in_data(79) xor in_data(77) xor in_data(76) xor in_data(75) xor in_data(74) xor in_data(73) xor in_data(68) xor in_data(67) xor in_data(65) xor in_data(62) xor in_data(61) xor in_data(59) xor in_data(57) xor in_data(56) xor in_data(54) xor in_data(53) xor in_data(51) xor in_data(49) xor in_data(43) xor in_data(40) xor in_data(39) xor in_data(38) xor in_data(36) xor in_data(35) xor in_data(32) xor in_data(29) xor in_data(26) xor in_data(25) xor in_data(18) xor in_data(17) xor in_data(16) xor in_data(14) xor in_data(11) xor in_data(7) xor in_data(6) xor in_data(5) xor in_data(1);

out_data(247)<= in_data(245) xor in_data(244) xor in_data(240) xor in_data(239) xor in_data(238) xor in_data(237) xor in_data(235) xor in_data(230) xor in_data(229) xor in_data(228) xor in_data(227) xor in_data(226) xor in_data(225) xor in_data(224) xor in_data(223) xor in_data(220) xor in_data(215) xor in_data(213) xor in_data(210) xor in_data(209) xor in_data(208) xor in_data(207) xor in_data(206) xor in_data(204) xor in_data(202) xor in_data(200) xor in_data(198) xor in_data(197) xor in_data(196) xor in_data(190) xor in_data(189) xor in_data(185) xor in_data(183) xor in_data(181) xor in_data(180) xor in_data(177) xor in_data(176) xor in_data(173) xor in_data(171) xor in_data(170) xor in_data(169) xor in_data(168) xor in_data(167) xor in_data(166) xor in_data(164) xor in_data(163) xor in_data(162) xor in_data(161) xor in_data(158) xor in_data(157) xor in_data(155) xor in_data(154) xor in_data(153) xor in_data(151) xor in_data(150) xor in_data(149) xor in_data(146) xor in_data(144) xor in_data(142) xor in_data(139) xor in_data(137) xor in_data(133) xor in_data(130) xor in_data(128) xor in_data(127) xor in_data(125) xor in_data(121) xor in_data(120) xor in_data(117) xor in_data(116) xor in_data(115) xor in_data(112) xor in_data(111) xor in_data(110) xor in_data(109) xor in_data(105) xor in_data(104) xor in_data(102) xor in_data(101) xor in_data(96) xor in_data(92) xor in_data(90) xor in_data(89) xor in_data(88) xor in_data(86) xor in_data(84) xor in_data(83) xor in_data(82) xor in_data(81) xor in_data(79) xor in_data(78) xor in_data(76) xor in_data(75) xor in_data(74) xor in_data(73) xor in_data(72) xor in_data(67) xor in_data(66) xor in_data(64) xor in_data(61) xor in_data(60) xor in_data(58) xor in_data(56) xor in_data(55) xor in_data(53) xor in_data(52) xor in_data(50) xor in_data(48) xor in_data(42) xor in_data(39) xor in_data(38) xor in_data(37) xor in_data(35) xor in_data(34) xor in_data(31) xor in_data(28) xor in_data(25) xor in_data(24) xor in_data(17) xor in_data(16) xor in_data(15) xor in_data(13) xor in_data(10) xor in_data(6) xor in_data(5) xor in_data(4) xor in_data(0);

end;
library ieee;
use ieee.std_logic_1164.all;
entity synenc is
    port(
        in_data     :    in  std_logic_vector(112 downto 0);
        out_data    :    out std_logic_vector(126 downto 0)
);
end entity;

architecture arch of synenc is
begin
out_data(112 downto 0) <= in_data;
out_data(126)<= in_data(112) xor in_data(111) xor in_data(109) xor in_data(107) xor in_data(106) xor in_data(104) xor in_data(103) xor in_data(102) xor in_data(101) xor in_data(100) xor in_data(99) xor in_data(92) xor in_data(91) xor in_data(87) xor in_data(85) xor in_data(80) xor in_data(79) xor in_data(77) xor in_data(76) xor in_data(74) xor in_data(71) xor in_data(69) xor in_data(67) xor in_data(65) xor in_data(63) xor in_data(60) xor in_data(58) xor in_data(56) xor in_data(52) xor in_data(50) xor in_data(49) xor in_data(47) xor in_data(45) xor in_data(44) xor in_data(43) xor in_data(42) xor in_data(38) xor in_data(36) xor in_data(33) xor in_data(32) xor in_data(29) xor in_data(28) xor in_data(27) xor in_data(26) xor in_data(21) xor in_data(18) xor in_data(17) xor in_data(16) xor in_data(14) xor in_data(13) xor in_data(12) xor in_data(8) xor in_data(7) xor in_data(5) xor in_data(4);

out_data(125)<= in_data(111) xor in_data(110) xor in_data(108) xor in_data(106) xor in_data(105) xor in_data(103) xor in_data(102) xor in_data(101) xor in_data(100) xor in_data(99) xor in_data(98) xor in_data(91) xor in_data(90) xor in_data(86) xor in_data(84) xor in_data(79) xor in_data(78) xor in_data(76) xor in_data(75) xor in_data(73) xor in_data(70) xor in_data(68) xor in_data(66) xor in_data(64) xor in_data(62) xor in_data(59) xor in_data(57) xor in_data(55) xor in_data(51) xor in_data(49) xor in_data(48) xor in_data(46) xor in_data(44) xor in_data(43) xor in_data(42) xor in_data(41) xor in_data(37) xor in_data(35) xor in_data(32) xor in_data(31) xor in_data(28) xor in_data(27) xor in_data(26) xor in_data(25) xor in_data(20) xor in_data(17) xor in_data(16) xor in_data(15) xor in_data(13) xor in_data(12) xor in_data(11) xor in_data(7) xor in_data(6) xor in_data(4) xor in_data(3);

out_data(124)<= in_data(110) xor in_data(109) xor in_data(107) xor in_data(105) xor in_data(104) xor in_data(102) xor in_data(101) xor in_data(100) xor in_data(99) xor in_data(98) xor in_data(97) xor in_data(90) xor in_data(89) xor in_data(85) xor in_data(83) xor in_data(78) xor in_data(77) xor in_data(75) xor in_data(74) xor in_data(72) xor in_data(69) xor in_data(67) xor in_data(65) xor in_data(63) xor in_data(61) xor in_data(58) xor in_data(56) xor in_data(54) xor in_data(50) xor in_data(48) xor in_data(47) xor in_data(45) xor in_data(43) xor in_data(42) xor in_data(41) xor in_data(40) xor in_data(36) xor in_data(34) xor in_data(31) xor in_data(30) xor in_data(27) xor in_data(26) xor in_data(25) xor in_data(24) xor in_data(19) xor in_data(16) xor in_data(15) xor in_data(14) xor in_data(12) xor in_data(11) xor in_data(10) xor in_data(6) xor in_data(5) xor in_data(3) xor in_data(2);

out_data(123)<= in_data(109) xor in_data(108) xor in_data(106) xor in_data(104) xor in_data(103) xor in_data(101) xor in_data(100) xor in_data(99) xor in_data(98) xor in_data(97) xor in_data(96) xor in_data(89) xor in_data(88) xor in_data(84) xor in_data(82) xor in_data(77) xor in_data(76) xor in_data(74) xor in_data(73) xor in_data(71) xor in_data(68) xor in_data(66) xor in_data(64) xor in_data(62) xor in_data(60) xor in_data(57) xor in_data(55) xor in_data(53) xor in_data(49) xor in_data(47) xor in_data(46) xor in_data(44) xor in_data(42) xor in_data(41) xor in_data(40) xor in_data(39) xor in_data(35) xor in_data(33) xor in_data(30) xor in_data(29) xor in_data(26) xor in_data(25) xor in_data(24) xor in_data(23) xor in_data(18) xor in_data(15) xor in_data(14) xor in_data(13) xor in_data(11) xor in_data(10) xor in_data(9) xor in_data(5) xor in_data(4) xor in_data(2) xor in_data(1);

out_data(122)<= in_data(108) xor in_data(107) xor in_data(105) xor in_data(103) xor in_data(102) xor in_data(100) xor in_data(99) xor in_data(98) xor in_data(97) xor in_data(96) xor in_data(95) xor in_data(88) xor in_data(87) xor in_data(83) xor in_data(81) xor in_data(76) xor in_data(75) xor in_data(73) xor in_data(72) xor in_data(70) xor in_data(67) xor in_data(65) xor in_data(63) xor in_data(61) xor in_data(59) xor in_data(56) xor in_data(54) xor in_data(52) xor in_data(48) xor in_data(46) xor in_data(45) xor in_data(43) xor in_data(41) xor in_data(40) xor in_data(39) xor in_data(38) xor in_data(34) xor in_data(32) xor in_data(29) xor in_data(28) xor in_data(25) xor in_data(24) xor in_data(23) xor in_data(22) xor in_data(17) xor in_data(14) xor in_data(13) xor in_data(12) xor in_data(10) xor in_data(9) xor in_data(8) xor in_data(4) xor in_data(3) xor in_data(1) xor in_data(0);

out_data(121)<= in_data(112) xor in_data(111) xor in_data(109) xor in_data(103) xor in_data(100) xor in_data(98) xor in_data(97) xor in_data(96) xor in_data(95) xor in_data(94) xor in_data(92) xor in_data(91) xor in_data(86) xor in_data(85) xor in_data(82) xor in_data(79) xor in_data(77) xor in_data(76) xor in_data(75) xor in_data(72) xor in_data(67) xor in_data(66) xor in_data(65) xor in_data(64) xor in_data(63) xor in_data(62) xor in_data(56) xor in_data(55) xor in_data(53) xor in_data(52) xor in_data(51) xor in_data(50) xor in_data(49) xor in_data(43) xor in_data(40) xor in_data(39) xor in_data(37) xor in_data(36) xor in_data(32) xor in_data(31) xor in_data(29) xor in_data(26) xor in_data(24) xor in_data(23) xor in_data(22) xor in_data(18) xor in_data(17) xor in_data(14) xor in_data(11) xor in_data(9) xor in_data(5) xor in_data(4) xor in_data(3) xor in_data(2) xor in_data(0);

out_data(120)<= in_data(112) xor in_data(110) xor in_data(109) xor in_data(108) xor in_data(107) xor in_data(106) xor in_data(104) xor in_data(103) xor in_data(101) xor in_data(100) xor in_data(97) xor in_data(96) xor in_data(95) xor in_data(94) xor in_data(93) xor in_data(92) xor in_data(90) xor in_data(87) xor in_data(84) xor in_data(81) xor in_data(80) xor in_data(79) xor in_data(78) xor in_data(77) xor in_data(75) xor in_data(69) xor in_data(67) xor in_data(66) xor in_data(64) xor in_data(62) xor in_data(61) xor in_data(60) xor in_data(58) xor in_data(56) xor in_data(55) xor in_data(54) xor in_data(51) xor in_data(48) xor in_data(47) xor in_data(45) xor in_data(44) xor in_data(43) xor in_data(39) xor in_data(35) xor in_data(33) xor in_data(32) xor in_data(31) xor in_data(30) xor in_data(29) xor in_data(27) xor in_data(26) xor in_data(25) xor in_data(23) xor in_data(22) xor in_data(18) xor in_data(14) xor in_data(12) xor in_data(10) xor in_data(7) xor in_data(5) xor in_data(3) xor in_data(2) xor in_data(1);

out_data(119)<= in_data(111) xor in_data(109) xor in_data(108) xor in_data(107) xor in_data(106) xor in_data(105) xor in_data(103) xor in_data(102) xor in_data(100) xor in_data(99) xor in_data(96) xor in_data(95) xor in_data(94) xor in_data(93) xor in_data(92) xor in_data(91) xor in_data(89) xor in_data(86) xor in_data(83) xor in_data(80) xor in_data(79) xor in_data(78) xor in_data(77) xor in_data(76) xor in_data(74) xor in_data(68) xor in_data(66) xor in_data(65) xor in_data(63) xor in_data(61) xor in_data(60) xor in_data(59) xor in_data(57) xor in_data(55) xor in_data(54) xor in_data(53) xor in_data(50) xor in_data(47) xor in_data(46) xor in_data(44) xor in_data(43) xor in_data(42) xor in_data(38) xor in_data(34) xor in_data(32) xor in_data(31) xor in_data(30) xor in_data(29) xor in_data(28) xor in_data(26) xor in_data(25) xor in_data(24) xor in_data(22) xor in_data(21) xor in_data(17) xor in_data(13) xor in_data(11) xor in_data(9) xor in_data(6) xor in_data(4) xor in_data(2) xor in_data(1) xor in_data(0);

out_data(118)<= in_data(112) xor in_data(111) xor in_data(110) xor in_data(109) xor in_data(108) xor in_data(105) xor in_data(103) xor in_data(100) xor in_data(98) xor in_data(95) xor in_data(94) xor in_data(93) xor in_data(90) xor in_data(88) xor in_data(87) xor in_data(82) xor in_data(80) xor in_data(78) xor in_data(75) xor in_data(74) xor in_data(73) xor in_data(71) xor in_data(69) xor in_data(64) xor in_data(63) xor in_data(62) xor in_data(59) xor in_data(54) xor in_data(53) xor in_data(50) xor in_data(47) xor in_data(46) xor in_data(44) xor in_data(41) xor in_data(38) xor in_data(37) xor in_data(36) xor in_data(32) xor in_data(31) xor in_data(30) xor in_data(26) xor in_data(25) xor in_data(24) xor in_data(23) xor in_data(20) xor in_data(18) xor in_data(17) xor in_data(14) xor in_data(13) xor in_data(10) xor in_data(7) xor in_data(4) xor in_data(3) xor in_data(1) xor in_data(0);

out_data(117)<= in_data(112) xor in_data(110) xor in_data(108) xor in_data(106) xor in_data(103) xor in_data(101) xor in_data(100) xor in_data(97) xor in_data(94) xor in_data(93) xor in_data(91) xor in_data(89) xor in_data(86) xor in_data(85) xor in_data(81) xor in_data(80) xor in_data(76) xor in_data(73) xor in_data(72) xor in_data(71) xor in_data(70) xor in_data(69) xor in_data(68) xor in_data(67) xor in_data(65) xor in_data(62) xor in_data(61) xor in_data(60) xor in_data(56) xor in_data(53) xor in_data(50) xor in_data(47) xor in_data(46) xor in_data(44) xor in_data(42) xor in_data(40) xor in_data(38) xor in_data(37) xor in_data(35) xor in_data(33) xor in_data(32) xor in_data(31) xor in_data(30) xor in_data(28) xor in_data(27) xor in_data(26) xor in_data(25) xor in_data(24) xor in_data(23) xor in_data(22) xor in_data(21) xor in_data(19) xor in_data(18) xor in_data(14) xor in_data(9) xor in_data(8) xor in_data(7) xor in_data(6) xor in_data(5) xor in_data(4) xor in_data(3) xor in_data(2) xor in_data(0);

out_data(116)<= in_data(112) xor in_data(106) xor in_data(105) xor in_data(104) xor in_data(103) xor in_data(101) xor in_data(96) xor in_data(93) xor in_data(91) xor in_data(90) xor in_data(88) xor in_data(87) xor in_data(84) xor in_data(77) xor in_data(76) xor in_data(75) xor in_data(74) xor in_data(72) xor in_data(70) xor in_data(68) xor in_data(66) xor in_data(65) xor in_data(64) xor in_data(63) xor in_data(61) xor in_data(59) xor in_data(58) xor in_data(56) xor in_data(55) xor in_data(50) xor in_data(47) xor in_data(46) xor in_data(44) xor in_data(42) xor in_data(41) xor in_data(39) xor in_data(38) xor in_data(37) xor in_data(34) xor in_data(33) xor in_data(31) xor in_data(30) xor in_data(28) xor in_data(25) xor in_data(24) xor in_data(23) xor in_data(22) xor in_data(20) xor in_data(16) xor in_data(14) xor in_data(12) xor in_data(6) xor in_data(3) xor in_data(2) xor in_data(1);

out_data(115)<= in_data(111) xor in_data(105) xor in_data(104) xor in_data(103) xor in_data(102) xor in_data(100) xor in_data(95) xor in_data(92) xor in_data(90) xor in_data(89) xor in_data(87) xor in_data(86) xor in_data(83) xor in_data(76) xor in_data(75) xor in_data(74) xor in_data(73) xor in_data(71) xor in_data(69) xor in_data(67) xor in_data(65) xor in_data(64) xor in_data(63) xor in_data(62) xor in_data(60) xor in_data(58) xor in_data(57) xor in_data(55) xor in_data(54) xor in_data(49) xor in_data(46) xor in_data(45) xor in_data(43) xor in_data(41) xor in_data(40) xor in_data(38) xor in_data(37) xor in_data(36) xor in_data(33) xor in_data(32) xor in_data(30) xor in_data(29) xor in_data(27) xor in_data(24) xor in_data(23) xor in_data(22) xor in_data(21) xor in_data(19) xor in_data(15) xor in_data(13) xor in_data(11) xor in_data(5) xor in_data(2) xor in_data(1) xor in_data(0);

out_data(114)<= in_data(112) xor in_data(111) xor in_data(110) xor in_data(109) xor in_data(107) xor in_data(106) xor in_data(100) xor in_data(94) xor in_data(92) xor in_data(89) xor in_data(88) xor in_data(87) xor in_data(86) xor in_data(82) xor in_data(80) xor in_data(79) xor in_data(77) xor in_data(76) xor in_data(75) xor in_data(73) xor in_data(72) xor in_data(71) xor in_data(70) xor in_data(69) xor in_data(68) xor in_data(67) xor in_data(66) xor in_data(65) xor in_data(64) xor in_data(62) xor in_data(61) xor in_data(60) xor in_data(59) xor in_data(58) xor in_data(57) xor in_data(54) xor in_data(53) xor in_data(52) xor in_data(50) xor in_data(49) xor in_data(48) xor in_data(47) xor in_data(43) xor in_data(40) xor in_data(39) xor in_data(38) xor in_data(37) xor in_data(35) xor in_data(33) xor in_data(31) xor in_data(27) xor in_data(23) xor in_data(22) xor in_data(20) xor in_data(17) xor in_data(16) xor in_data(13) xor in_data(10) xor in_data(8) xor in_data(7) xor in_data(5) xor in_data(1) xor in_data(0);

out_data(113)<= in_data(112) xor in_data(110) xor in_data(108) xor in_data(107) xor in_data(105) xor in_data(104) xor in_data(103) xor in_data(102) xor in_data(101) xor in_data(100) xor in_data(93) xor in_data(92) xor in_data(88) xor in_data(86) xor in_data(81) xor in_data(80) xor in_data(78) xor in_data(77) xor in_data(75) xor in_data(72) xor in_data(70) xor in_data(68) xor in_data(66) xor in_data(64) xor in_data(61) xor in_data(59) xor in_data(57) xor in_data(53) xor in_data(51) xor in_data(50) xor in_data(48) xor in_data(46) xor in_data(45) xor in_data(44) xor in_data(43) xor in_data(39) xor in_data(37) xor in_data(34) xor in_data(33) xor in_data(30) xor in_data(29) xor in_data(28) xor in_data(27) xor in_data(22) xor in_data(19) xor in_data(18) xor in_data(17) xor in_data(15) xor in_data(14) xor in_data(13) xor in_data(9) xor in_data(8) xor in_data(6) xor in_data(5) xor in_data(0);

end;
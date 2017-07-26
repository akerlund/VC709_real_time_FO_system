
 add_fsm_encoding \
       {i2c_master.state} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0011} {0100 0100} {0101 0110} {0110 0101} {0111 0111} {1000 1000} }

 add_fsm_encoding \
       {word_compressor_127IN_to_64OUT.bits_in_buffer} \
       { }  \
       {{00000000 00000000} {00000001 01111101} {00000010 01111011} {00000011 01111001} {00000100 01110111} {00000101 01110101} {00000110 01110011} {00000111 01110001} {00001000 01101111} {00001001 01101101} {00001010 01101011} {00001011 01101001} {00001100 01100111} {00001101 01100101} {00001110 01100011} {00001111 01100001} {00010000 01011111} {00010001 01011101} {00010010 01011011} {00010011 01011001} {00010100 01010111} {00010101 01010101} {00010110 01010011} {00010111 01010001} {00011000 01001111} {00011001 01001101} {00011010 01001011} {00011011 01001001} {00011100 01000111} {00011101 01000101} {00011110 01000011} {00011111 01000001} {00100000 00111111} {00100001 00111101} {00100010 00111011} {00100011 00111001} {00100100 00110111} {00100101 00110101} {00100110 00110011} {00100111 00110001} {00101000 00101111} {00101001 00101101} {00101010 00101011} {00101011 00101001} {00101100 00100111} {00101101 00100101} {00101110 00100011} {00101111 00100001} {00110000 00011111} {00110001 00011101} {00110010 00011011} {00110011 00011001} {00110100 00010111} {00110101 00010101} {00110110 00010011} {00110111 00010001} {00111000 00001111} {00111001 00001101} {00111010 00001011} {00111011 00001001} {00111100 00000111} {00111101 00000101} {00111110 00000011} {00111111 00000001} {01000000 01111110} {01000001 01111100} {01000010 01111010} {01000011 01111000} {01000100 01110110} {01000101 01110100} {01000110 01110010} {01000111 01110000} {01001000 01101110} {01001001 01101100} {01001010 01101010} {01001011 01101000} {01001100 01100110} {01001101 01100100} {01001110 01100010} {01001111 01100000} {01010000 01011110} {01010001 01011100} {01010010 01011010} {01010011 01011000} {01010100 01010110} {01010101 01010100} {01010110 01010010} {01010111 01010000} {01011000 01001110} {01011001 01001100} {01011010 01001010} {01011011 01001000} {01011100 01000110} {01011101 01000100} {01011110 01000010} {01011111 01000000} {01100000 00111110} {01100001 00111100} {01100010 00111010} {01100011 00111000} {01100100 00110110} {01100101 00110100} {01100110 00110010} {01100111 00110000} {01101000 00101110} {01101001 00101100} {01101010 00101010} {01101011 00101000} {01101100 00100110} {01101101 00100100} {01101110 00100010} {01101111 00100000} {01110000 00011110} {01110001 00011100} {01110010 00011010} {01110011 00011000} {01110100 00010110} {01110101 00010100} {01110110 00010010} {01110111 00010000} {01111000 00001110} {01111001 00001100} {01111010 00001010} {01111011 00001000} {01111100 00000110} {01111101 00000100} {01111110 00000010} {01111111 01111111} {10000000 11111100} {10000001 11111010} {10000010 11111000} {10000011 11110110} {10000100 11110100} {10000101 11110010} {10000110 11110000} {10000111 11101110} {10001000 11101100} {10001001 11101010} {10001010 11101000} {10001011 11100110} {10001100 11100100} {10001101 11100010} {10001110 11100000} {10001111 11011110} {10010000 11011100} {10010001 11011010} {10010010 11011000} {10010011 11010110} {10010100 11010100} {10010101 11010010} {10010110 11010000} {10010111 11001110} {10011000 11001100} {10011001 11001010} {10011010 11001000} {10011011 11000110} {10011100 11000100} {10011101 11000010} {10011110 11000000} {10011111 10111110} {10100000 10111100} {10100001 10111010} {10100010 10111000} {10100011 10110110} {10100100 10110100} {10100101 10110010} {10100110 10110000} {10100111 10101110} {10101000 10101100} {10101001 10101010} {10101010 10101000} {10101011 10100110} {10101100 10100100} {10101101 10100010} {10101110 10100000} {10101111 10011110} {10110000 10011100} {10110001 10011010} {10110010 10011000} {10110011 10010110} {10110100 10010100} {10110101 10010010} {10110110 10010000} {10110111 10001110} {10111000 10001100} {10111001 10001010} {10111010 10001000} {10111011 10000110} {10111100 10000100} {10111101 10000010} {10111110 10000000} {10111111 11111101} {11000000 11111011} {11000001 11111001} {11000010 11110111} {11000011 11110101} {11000100 11110011} {11000101 11110001} {11000110 11101111} {11000111 11101101} {11001000 11101011} {11001001 11101001} {11001010 11100111} {11001011 11100101} {11001100 11100011} {11001101 11100001} {11001110 11011111} {11001111 11011101} {11010000 11011011} {11010001 11011001} {11010010 11010111} {11010011 11010101} {11010100 11010011} {11010101 11010001} {11010110 11001111} {11010111 11001101} {11011000 11001011} {11011001 11001001} {11011010 11000111} {11011011 11000101} {11011100 11000011} {11011101 11000001} {11011110 10111111} {11011111 10111101} {11100000 10111011} {11100001 10111001} {11100010 10110111} {11100011 10110101} {11100100 10110011} {11100101 10110001} {11100110 10101111} {11100111 10101101} {11101000 10101011} {11101001 10101001} {11101010 10100111} {11101011 10100101} {11101100 10100011} {11101101 10100001} {11101110 10011111} {11101111 10011101} {11110000 10011011} {11110001 10011001} {11110010 10010111} {11110011 10010101} {11110100 10010011} {11110101 10010001} {11110110 10001111} {11110111 10001101} {11111000 10001011} {11111001 10001001} {11111010 10000111} {11111011 10000101} {11111100 10000011} {11111101 10000001} {11111110 11111110} }

 add_fsm_encoding \
       {word_compressor_113IN_to_64OUT.bits_in_buffer} \
       { }  \
       {{00000000 00000000} {00000001 00011110} {00000010 00111100} {00000011 01011010} {00000100 00000111} {00000101 00100101} {00000110 01000011} {00000111 01100001} {00001000 00001110} {00001001 00101100} {00001010 01001010} {00001011 01101000} {00001100 00010101} {00001101 00110011} {00001110 01010001} {00001111 01101111} {00010000 00011100} {00010001 00111010} {00010010 01011000} {00010011 00000101} {00010100 00100011} {00010101 01000001} {00010110 01011111} {00010111 00001100} {00011000 00101010} {00011001 01001000} {00011010 01100110} {00011011 00010011} {00011100 00110001} {00011101 01001111} {00011110 01101101} {00011111 00011010} {00100000 00111000} {00100001 01010110} {00100010 00000011} {00100011 00100001} {00100100 00111111} {00100101 01011101} {00100110 00001010} {00100111 00101000} {00101000 01000110} {00101001 01100100} {00101010 00010001} {00101011 00101111} {00101100 01001101} {00101101 01101011} {00101110 00011000} {00101111 00110110} {00110000 01010100} {00110001 00000001} {00110010 00011111} {00110011 00111101} {00110100 01011011} {00110101 00001000} {00110110 00100110} {00110111 01000100} {00111000 01100010} {00111001 00001111} {00111010 00101101} {00111011 01001011} {00111100 01101001} {00111101 00010110} {00111110 00110100} {00111111 01010010} {01000000 01110000} {01000001 00011101} {01000010 00111011} {01000011 01011001} {01000100 00000110} {01000101 00100100} {01000110 01000010} {01000111 01100000} {01001000 00001101} {01001001 00101011} {01001010 01001001} {01001011 01100111} {01001100 00010100} {01001101 00110010} {01001110 01010000} {01001111 01101110} {01010000 00011011} {01010001 00111001} {01010010 01010111} {01010011 00000100} {01010100 00100010} {01010101 01000000} {01010110 01011110} {01010111 00001011} {01011000 00101001} {01011001 01000111} {01011010 01100101} {01011011 00010010} {01011100 00110000} {01011101 01001110} {01011110 01101100} {01011111 00011001} {01100000 00110111} {01100001 01010101} {01100010 00000010} {01100011 00100000} {01100100 00111110} {01100101 01011100} {01100110 00001001} {01100111 00100111} {01101000 01000101} {01101001 01100011} {01101010 00010000} {01101011 00101110} {01101100 01001100} {01101101 01101010} {01101110 00010111} {01101111 00110101} {01110000 01010011} {01110001 01110001} {01110010 10001111} {01110011 10101101} {01110100 11001011} {01110101 01111000} {01110110 10010110} {01110111 10110100} {01111000 11010010} {01111001 01111111} {01111010 10011101} {01111011 10111011} {01111100 11011001} {01111101 10000110} {01111110 10100100} {01111111 11000010} {10000000 11100000} {10000001 10001101} {10000010 10101011} {10000011 11001001} {10000100 01110110} {10000101 10010100} {10000110 10110010} {10000111 11010000} {10001000 01111101} {10001001 10011011} {10001010 10111001} {10001011 11010111} {10001100 10000100} {10001101 10100010} {10001110 11000000} {10001111 11011110} {10010000 10001011} {10010001 10101001} {10010010 11000111} {10010011 01110100} {10010100 10010010} {10010101 10110000} {10010110 11001110} {10010111 01111011} {10011000 10011001} {10011001 10110111} {10011010 11010101} {10011011 10000010} {10011100 10100000} {10011101 10111110} {10011110 11011100} {10011111 10001001} {10100000 10100111} {10100001 11000101} {10100010 01110010} {10100011 10010000} {10100100 10101110} {10100101 11001100} {10100110 01111001} {10100111 10010111} {10101000 10110101} {10101001 11010011} {10101010 10000000} {10101011 10011110} {10101100 10111100} {10101101 11011010} {10101110 10000111} {10101111 10100101} {10110000 11000011} {10110001 11100001} {10110010 10001110} {10110011 10101100} {10110100 11001010} {10110101 01110111} {10110110 10010101} {10110111 10110011} {10111000 11010001} {10111001 01111110} {10111010 10011100} {10111011 10111010} {10111100 11011000} {10111101 10000101} {10111110 10100011} {10111111 11000001} {11000000 11011111} {11000001 10001100} {11000010 10101010} {11000011 11001000} {11000100 01110101} {11000101 10010011} {11000110 10110001} {11000111 11001111} {11001000 01111100} {11001001 10011010} {11001010 10111000} {11001011 11010110} {11001100 10000011} {11001101 10100001} {11001110 10111111} {11001111 11011101} {11010000 10001010} {11010001 10101000} {11010010 11000110} {11010011 01110011} {11010100 10010001} {11010101 10101111} {11010110 11001101} {11010111 01111010} {11011000 10011000} {11011001 10110110} {11011010 11010100} {11011011 10000001} {11011100 10011111} {11011101 10111101} {11011110 11011011} {11011111 10001000} {11100000 10100110} {11100001 11000100} {11100010 11100010} }

 add_fsm_encoding \
       {FBERT.FBERT_STATE} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} }

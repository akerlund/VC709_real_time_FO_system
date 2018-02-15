"""	Generates the synchronization data for the system.
"""
import random

print(random.randint(1024,2**63))

start = """
	type sync_vector_type i array 0 to 127 of std_logic_vector(63 downto 0)
    signal sync_vector_64 : std_logic_vector(63 downto 0) := 
    """

for i in range(128):
	cool_number = "{0:b}".format(random.randint(1024,2**64)).zfill(64)
	cooler_number = ""
	current = cool_number[0]
	same = 0
	for i in range(64):
		if cool_number[i] == current:
			same += 1
			if same == 3:
				same = 0
				if cool_number[i] == '0':
					cooler_number += '1'
					current = '1'
				else:
					cooler_number += '0'
					current = '0'
			else:
				cooler_number += cool_number[i]
		else:
			if current == '0':
				current = '1'
			else:
				current = '0'			
			same = 0
			cooler_number += cool_number[i]
	start += "    \""+cooler_number + "\",\n"

print(start)

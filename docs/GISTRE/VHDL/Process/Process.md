---
title: Process
Owner: "Florian "
---
A **VHDL process** executes only when a signal in its **sensitivity list** changes. Inside the process, statements run sequentially, but **signal assignments do not take effect immediately**. Instead, all output values update **only at the end of the process execution**.
This means that if a signal is assigned a new value, other assignments within the same process will still use its **old value** until the process completes. This behavior models real hardware, where registers update simultaneously on a clock edge.
### **Basic Process Example**
```VHDL
process(A, B)  -- Process runs when A or B changes
begin
  X <= A and B;  -- X updates only when A or B changes
end process;
```
📌 **Key Rule:** The process **only executes when** `**A**` **or** `**B**` **changes**. If `A` and `B` remain the same, `X` does not update.
---
### **Using a Clock in a Process**
In digital circuits, registers and flip-flops update on clock edges. We use `rising_edge(clk)` to ensure that updates happen **only when the clock transitions from** `**0**` **to** `**1**`.
```VHDL
process(clk)
begin
  if rising_edge(clk) then
    Q <= D;  -- Q updates only on a rising clock edge
  end if;
end process;
```
📌 **Key Rule:** The process executes whenever `clk` changes
---
### **Adding an Asynchronous Reset**
A reset allows the circuit to start from a known state. When `rst = '1'`, `Q` is reset to `0`. Otherwise, `Q` updates on a rising clock edge.
```VHDL
process(clk, rst)
begin
  if rst = '1' then
    Q <= '0';  -- Reset Q immediately when rst = 1
  elsif rising_edge(clk) then
    Q <= D;  -- Otherwise, update Q on clock rising edge
  end if;
end process;
```
📌 **Key Rules:**
- The process runs whenever `clk` **or** `rst` changes.
- If `rst = '1'`, `Q` resets **immediately**, even if the clock is not changing.
- Otherwise, `Q` updates **only on a rising clock edge**.
---
### **Key Takeaways**
✅ A process **executes only when a signal in its sensitivity list changes**.
✅ `rising_edge(clk)` ensures updates happen **only on clock rising edges**.
✅ A reset condition (`rst = '1'`) takes **priority** and executes immediately.
✅ The process does **not loop continuously**; it waits for signal changes.
This is how VHDL models real digital circuits!
  
## Delays
```VHDL
process (A,B)
	B <= A after 10 ns;
	C <= B afters 5 ms;
end process;
```
The process is called three times. One more time for every delayed values.
```VHDL
process
begin
	reset <= '0';
	reset <= '1' after 10 ns;
	reset <= '0' after 20 ns;
	wait;
end process;
```
This would not work as it is a process, only the last ‘0’ assignment is considered. A signal takes its value at the very end of the process only (on the wait).
```Shell
process
begin
	reset <= '0';
	wait for 10 ns;
	reset <= '1';
	wait for 20 ns;
	reset <= '0';
	wait;
end process;
```
This would have the expected behavior.

> [!important] The wait is blocking. It allows the process to end and not loop

> [!important] The `wait` command is not usable for synthesizing, only for tests !
A **delta delay** is a very small delay between the instructions of a process.
## Variables
A variable is **only declared in a process** !
The variable affectation is immediate.
```VHDL
process (A,B,C)
-- zone de declartaion des variables
	variable  V: STD_LOGIC;
begin
	V := A nand B;
	V := V nor C;
	F <= not V;
end process; 
```
![[image 8.png|image 8.png]]


> [!important] The assignment is done with `:=`
  
```VHDL
Entity parite is
	PORT ( a : IN std_logic_vector(0 TO 3) ;
	s : OUT std_logic );
END enttity;
architecture behaviour of parite is
begin
	process(a)
		variable parite : std_logic ;
	begin
		parite := ‘1' ;
		FOR i in 0 to 3 LOOP
			if a(i) = '1' then
				parite := not parite;
			end if;
		END LOOP;
		s <= parite;
	end process;
END architecture;
```
As a liaison series is made of a starting `0`, then `D0` to `D7` then a `parity` then an ending `1` , computing the parity of a byte might be useful. This example is on `4 bits`.

> [!important] The number of `1` in the data + the parity bit **must be** an `odd` number !
---
title: "Fundamentals of the language"
---
Last edited time: April 8, 2025 1:04 PM

# Language

The **entity** defines the **interface** of the component, specifying:

- The **name** of the design unit.
- The **inputs** and **outputs** (also called **ports**).
- The **data types** of the ports.

The **architecture** describes the **internal behavior** or **structure** of the design. It defines **how** the entity works.

## Port declaration

In **VHDL**, signals inside an **entity** are declared as **ports** to define how the component interacts with other components. Each port has a **mode** that specifies its direction and behavior.

---

| Mode | Description | Usage |
| --- | --- | --- |
| `in` | Input signal **only**. The component **reads** but cannot modify it. | Used for inputs like switches, sensors, or data received from another component. |
| `out` | Output signal **only**. The component **writes** to it but cannot read its own value. | Used for controlling LEDs, displays, or signals sent to another component. |
| `inout` | **Bidirectional** signal, can be both read and written. Requires a **tri-state buffer** (high-impedance state). | Used for data buses, bidirectional communication (e.g., GPIO in microcontrollers). |
| `buffer` | Similar to `out`, but the signal can be **read internally** by the component. **Should be avoided**, as it causes issues when instantiating components. | Not recommended; use `out` with an internal signal instead. |

<aside>
⚠️

- `buffer` allows the component to **both read and write** the signal, unlike `out`, which only writes.
- The issue arises when **instantiating** a component inside another design:
    - If `buffer` is used, it **cannot** be connected to a standard `out` port.
    - The solution is to use **`out` with an internal signal** inside the architecture.
</aside>

```vhdl
entity Example_Component is
    Port (
        A   : in  STD_LOGIC;   -- Input signal
        B   : in  STD_LOGIC;   -- Input signal
        Y   : out STD_LOGIC;   -- Output signal
        Z   : inout STD_LOGIC; -- Bidirectional signal
        W   : buffer STD_LOGIC -- Buffer (not recommended)
    );
end Example_Component;
```

## Data types

In **VHDL**, `STD_LOGIC` and `STD_LOGIC_VECTOR` are data types defined in the **IEEE 1164 standard library** (`IEEE.STD_LOGIC_1164.ALL`). They are widely used because they allow **more than just binary values (0 and 1)**, making them useful for simulation and synthesis.

### **1. `STD_LOGIC`**

- Represents **a single digital signal** (one wire).
- Can take multiple values (not just 0 or 1), making it useful for **tri-state logic, unknown states, and simulation**.

### **2. `STD_LOGIC_VECTOR (N-1 DOWNTO 0)`**

- Represents a **bus or multi-bit signal** (multiple wires).
- It is an **array** of `STD_LOGIC` elements.
- Each bit in the vector behaves like an individual `STD_LOGIC`.
- Example:
    
    ```vhdl
    signal data : STD_LOGIC_VECTOR(7 downto 0); -- 8-bit bus
    ```
    

Possible Values in **`STD_LOGIC`** and Their Meanings:

| Value | Meaning |
| --- | --- |
| **`0`** | Logic **low**, digital **0**, strong drive |
| **`1`** | Logic **high**, digital **1**, strong drive |
| **`L`** | **Weak 0**, pulled low (not strongly driven) |
| **`H`** | **Weak 1**, pulled high (not strongly driven) |
| **`X`** | **Unknown** (conflict: could be 0 or 1) |
| **`W`** | **Weak unknown** (conflict but weakly driven) |
| **`U`** | **Uninitialized**, default state before simulation starts |
| **`Z`** | **High impedance**, floating (used for tri-state buffers) |
| **`-`** | **Don't care**, used in testbenches for comparisons |

## Processing

Logical operators **`and`**, **`or`**, **`not`**, and **`nor`** can be used on `STD_LOGIC` values, handling unknown states (`X`, `Z`, etc.) correctly.

Between `begin` and `end` in the **architecture**, all statements are **concurrent** and execute **simultaneously**, not sequentially.

The `<=` is the affectation operator.

```vhdl
S <= E2;
S <= '0';
S <= '1';
```

For signal of single bit, use ‘1’ and ‘1’, for several bits, use “…”, for hexadecimal, use x…

The `relational operators` are `=` `/=` `<` `<=` `>` `>=` and are used to make some conditional assignments and selective assignments.

```vhdl
-- Conditionnal assignments.
SIGNAL <= expression when condition
	[else expression when condition
	[else expression]
-- Selective assignments.
with SIGNAL_DE_SELECTION select
	SIGNAL <= expression when valeur_de_selection,
	[expression when valeur_de_selection,]
	[expression when others];

```

## Tips

- Give the same name to the file that the entity is called
    - If entity is called `counter`, call the file `coutner.vhd`
- When using a negative logic (like $\bar A$), please name it `A_n`

## Example

**Basic AND gate**

```vhdl
library IEEE; -- name of the library
use IEEE.STD_LOGIC_1164.ALL; -- minimal library required

entity AND_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC -- CAREFUL no ';' on the last line before the ')'
    );
end AND_Gate;

architecture Behavioral of AND_Gate is
begin
    Y <= A and B;
end Behavioral;
```

**Decoder 7 segments**

```vhdl
Entity decod7seg is
port (
    Data : in std_logic_vector(3 downto 0);  -- Expected within 0 .. 9
    Segout : out std_logic_vector(1 to 7)    -- Segments A, B, C, D, E, F, G
);
end entity;

Architecture behavior of decod7seg is
begin
    with Data select
        Segout <= "1111110" when x"0",
                  "0110000" when x"1",
                  "1101101" when x"2",
                  "1111001" when x"3",
                  "0110011" when x"4",
                  "1011011" when x"5",
                  "1011111" when x"6",
                  "1110000" when x"7",
                  "1111111" when x"8",
                  "1111011" when x"9",
                  "-------" when others;
End architecture;
```

# Instantiating

![image.png](Fundamentals%20of%20the%20language/image.png)

```vhdl
entity MUX2 is
	port ( SEL,IP1,IP2 : in STD_LOGIC; op : out STD_LOGIC);
end entity;

architecture DIRECTE of MUX2 is
    signal SELB, N : STD_LOGIC;
begin
    G1: entity WORK.INV(V1) port map (A => SEL, F => SELB);
    G2: entity WORK.AOI(V1) port map (
        A => SELB, B => IP1,
        C => SEL, D => IP2,
        F => N);
    G3: entity WORK.INV(V1) port map (A => N, F => OP);
end architecture DIRECTE;
```

![image.png](Fundamentals%20of%20the%20language/image%201.png)

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity LOGIC is
	port (
	J,K,L,M,N in std_logic;
	P,Q : out std_logic);
end entity;

architecture STRUCT of LOGIC is
	signal Pi : std_logic; -- internal signal (because P cannot be read)
	begin
	U1 : entity work.andor port map (A => J, B => K, C => L, F => Pi)
	U2 : entity work.andor port map (A => Pi, B => M, C => N, F => Q);
	P <= Pi;
end architecture;
```

```bash
vcom -93 xxx # Compiles file xxx
vsim xxx.tb # Simulate xxx
add wave * # Add all signal to the waves
run -all # Run all tests
```

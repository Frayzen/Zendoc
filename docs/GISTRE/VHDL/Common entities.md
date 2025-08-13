---
Owner: "Florian "
---
### 🔁 **D Latch (Level-Triggered)**
- **Triggered by level** of the control signal (usually called `Enable` or `Clock`).
- When **Enable = 1**, the latch is **transparent** — the output `Q` immediately follows the input `D`.
- When **Enable = 0**, the latch **freezes** the value — it holds the last value of `D`.
```VHDL
entity D_Latch is
    Port (
        D     : in  STD_LOGIC;
        En    : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end D_Latch;
architecture Behavioral of D_Latch is
begin
    process(D, En)
    begin
        if En = '1' then
            Q <= D;
        end if;
    end process;
end Behavioral;
```
### ⏱️ **D Flip-Flop (Edge-Triggered)**
- **Triggered on an edge** (usually the rising edge ↑ or falling edge ↓ of the `Clock` signal).
- The output `Q` **only updates** on a clock edge, not when the clock is stable.
- Between clock edges, `Q` **stays constant**, regardless of `D`.
```VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity D_FF is
    Port (
        D     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end D_FF;
architecture Behavioral of D_FF is
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            Q <= D;
        end if;
    end process;
end Behavioral;
```
  
# Multiplexer
A **multiplexer** (often called a **MUX**) is a digital switch — it **selects one input from many**, and passes it to the output based on a **select signal**.
### 📌 **8-to-1 Multiplexer using** `**STD_LOGIC_VECTOR**`
### ✅ Inputs:
- `D`: `STD_LOGIC_VECTOR(7 downto 0)` — 8 input bits
- `Sel`: `STD_LOGIC_VECTOR(2 downto 0)` — 3-bit selector (since 2³ = 8)
- `Y`: `STD_LOGIC` — selected output
```VHDL
entity Mux8to1 is
    Port (
        D   : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8 inputs
        Sel : in  STD_LOGIC_VECTOR(2 downto 0);  -- 3-bit select
        Y   : out STD_LOGIC                     -- output
    );
end Mux8to1;
architecture Behavioral of Mux8to1 is
begin
    process(D, Sel)
    begin
        Y <= D(to_integer(unsigned(Sel)));  -- use Sel as index
    end process;
end Behavioral;
```
  
# Summary
### **1. Combinatorial Process**
- **No clock** (no `**rising_edge()**` or `**falling_edge()**`).
- **Sensitivity list** includes **all input signals** (any change triggers the process).
- Typically uses **conditional assignments** (`**if**`, `**case**`, `**when**`).
### **2. Sequential (Synchronous) Process**
- Has an internal state
- For example if sensibility list does not include all of the used signal
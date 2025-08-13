---
title: Synchronous - Asynchronous process
Owner: "Florian "
---
### 🔍 **How to Tell if a VHDL Process is Synchronous**
A **synchronous process** typically has a structure like this:
```Plain
process(clk)
begin
    if rising_edge(clk) then
        -- synchronous behavior here
        q <= d;
    end if;
end process;
```
### ✅ Key characteristics of synchronous VHDL:
- The **clock signal** (e.g. `clk`) is in the **sensitivity list**, or `rising_edge(clk)` / `falling_edge(clk)` is explicitly used.
- Updates to signals (like `q <= d`) happen **inside** the `if rising_edge(clk)` block.
- Sometimes, there's also a **reset condition**, like:
```VHDL
process(clk, reset)
begin
    if reset = '1' then
        q <= '0';  -- async reset
    elsif rising_edge(clk) then
        q <= d;
    end if;
end process;
```
### 🚫 What is not synchronous?
A purely **combinational or asynchronous** process might look like this:
```VHDL
process(a, b, c)
begin
    y <= a and b or c;
end process;
```
```VHDL
process(clk)
begin
    if clk = '1' then  -- level-sensitive, not edge-sensitive
        q <= d;
    end if;
end process;
```
In this second example, it's **not synchronous** — it's **level-sensitive**, so it behaves like a **latch**, not a flip-flop.
### ✅ In summary
An entity/process is **synchronous** in VHDL if:
- It uses `rising_edge(clk)` or `falling_edge(clk)`
- Signal assignments happen **only** inside that edge condition
- Optional: it may have asynchronous reset logic
# Synchronous nomenclature
![[image 11.png|image 11.png]]
![[image 1 4.png|image 1 4.png]]
# Time constraints
![[image 2 4.png|image 2 4.png]]
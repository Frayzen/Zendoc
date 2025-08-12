---
title: "Synchronous / Asynchronous process"
---
Last edited time: April 8, 2025 3:03 PM

### 🔍 **How to Tell if a VHDL Process is Synchronous**

A **synchronous process** typically has a structure like this:

```
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

```vhdl
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

```vhdl
process(a, b, c)
begin
    y <= a and b or c;
end process;
```

```vhdl
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

![image.png](Synchronous%20Asynchronous%20process/image.png)

![image.png](Synchronous%20Asynchronous%20process/image%201.png)

# Time constraints

![image.png](Synchronous%20Asynchronous%20process/image%202.png)

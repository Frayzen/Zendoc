---
title: "RS-232 Protocol"
---
Last edited time: May 25, 2024 10:15 AM

# Overview

The RS-232 Protocol is associated with old-school wire cable called “Serial Port”. It is a protocol that allows communications between two devices. It can be seen as the ancestor of USB.

<aside>
🧠 This is also called an UART (Universal asynchronous receiver-transmitter).

</aside>

## Pins

![Untitled](RS-232%20Protocol/Untitled.png)

![Untitled](RS-232%20Protocol/Untitled%201.png)

There is several pins on the cable.

| **Sender side name** | **Receiver side name** | **Usage** |
| --- | --- | --- |
| Tx
Transmitter | Rx
Receiver | Transmit the 0 and 1 representing the data |
| DTR
Data Terminal Ready | DST
Data Set Ready | Constantly up to notify the sender of the presence / absence of the receiver. |
| RTS
Request To Send | CTS
Clear To Set | This wires specify the sender if he can or not send data. That allows the receiver to process the data at any rate and avoid buffer overflow on its side. |

<aside>
🧠 There is 2 other pins related to the modem.

</aside>

## Registers

[Serial Programming/8250 UART Programming - Wikibooks, open books for an open world](https://en.wikibooks.org/wiki/Serial_Programming/8250_UART_Programming)

The UART chip has a total of 12 different registers that are mapped into 8 different Port I/O locations. Obviously that means there is more than one register that uses the same Port I/O location, and affects how the UART can be configured.

![Untitled](RS-232%20Protocol/Untitled%202.png)

In reality, two of the registers are really the same one but in a different context, as the Port I/O address that you transmit the characters to be sent out of the serial data port is the same address that you can read in the characters that are sent to the computer. Another I/O port address has a different context when you write data to it than when you read data from it... and the number will be different after writing the data to it than when you read data from it.

![Untitled](RS-232%20Protocol/Untitled%203.png)

- DLAB column
    
    One of the issues that came up when this chip was originally being designed was that the designer needed to be able to send information about the baud rate of the serial data with 16 bits.
    
    This actually takes up two different "registers" and is toggled by what is called the "Divisor Latch Access Bit" or "DLAB".
    
    When the DLAB is set to "1", the baud rate registers can be set and when it is "0" the registers have a different context. 
    

- Each serial communication port will have its own set of these registers.
    
    To access the Line Status Register (LSR) for COM1, the I/O Port address to get the information in this register would be:
    
    $3F8 + $05 or $3FD.
    

<aside>
💡 The "x" in the DLAB column means that the status of the DLAB has no effect on what register is going to be accessed for that offset range

</aside>

## Register specifications

- **THR / RBR +0**
    
    The Transmit and Receive buffers are related, and often even use the very same memory
    
    <aside>
    ⚠️ If the receive buffer is occupied or the FIFO is full, the incoming data is discarded and the Receiver Line Status interrupt is written to the IIR register. The Overrun Error bit is also set in the Line Status Register.
    
    </aside>
    
- **DLL + 0**
    
    The Divisor Latch Bytes are what control the baud rate.
    
    It is used as a divisor to determine what baud rate that the chip is going to be transmitting at
    
    Each time a bit is sent, a count-down register is reset to this value and then counts down to zero. This clock is running typically at 115.2 kHz. In other words, at 115 thousand times per second a counter is going down to determine when to send the next bit.
    
    If you use the following mathematical formula, you can determine what numbers you need to put into the Divisor Latch Bytes:
    
    $$
    DivisorLatchValue=\frac{115200}{BaudRate}
    $$
    
    ![Untitled](RS-232%20Protocol/Untitled%204.png)
    
    <aside>
    ⚠️ Do not forget to assign the High Byte to zero for baud rates 600 and above
    
    </aside>
    
- **IER +1**
    
    This register allows you to control when and how the UART is going to trigger an interrupt event with the hardware interrupt associated with the serial COM port.
    
    ![Untitled](RS-232%20Protocol/Untitled%205.png)
    
    - The Received Data interrupt is a way to let you know that there is some data waiting for you to pull off of the UART.
    - The Transmitter Holding Register Empty Interrupt is to let you know that the output buffer (on more advanced models of the chip like the 16550) has finished sending everything that you pushed into the buffer.
    - The Receiver Line Status Interrupt indicates that something in the LSR register has probably changed. This is usually an error condition.
- **IIR +2**
    
     This register has two uses
    
    - Identification of why the UART triggered an interrupt
    - Identification of the UART chip itself
    
    <aside>
    💡 When you are writing an interrupt handler for the 8250 chip (and later), this is the register that you need to look at in order to determine what exactly was the trigger for the interrupt
    
    </aside>
    
    ![Untitled](RS-232%20Protocol/Untitled%206.png)
    
- **FFC +2**
    
    This is a relatively "new" register that was not a part of the original 8250 UART implementation. The purpose of this register is to control how the First In/First Out (FIFO) buffers will behave on the chip and to help you fine-tune their performance in your application. This even gives you the ability to "turn on" or "turn off" the FIFO.
    
    <aside>
    🧠 Keep in mind that this is a "write only" register
    
    </aside>
    
    ![Untitled](RS-232%20Protocol/Untitled%207.png)
    
- **LCR +3**
    
    This register has two major purposes: 
    
    - Setting the Divisor Latch Access Bit (DLAB), allowing you to set the values of the Divisor Latch Bytes.
    - Setting the bit patterns that will be used for both receiving and transmitting the serial data. In other words, the serial data protocol you will be using (8-1-None, 5-2-Even, etc.).
    
    ![Untitled](RS-232%20Protocol/Untitled%208.png)
    
    - The first two bits (Bit 0 and Bit 1) control how many data bits are sent for each data "word" that is transmitted via serial protocol. For most serial data transmission, this will be 8 bits
    - Bit 2 controls how many stop bits are transmitted by the UART to the receiving device
    - Bits 3, 4, and 5 control how each serial word responds to parity information
    
- **MDR +4**
    
    This register allows you to do "hardware" flow control, under software control. Or in a more practical manner, it allows direct manipulation of four different wires on the UART that you can set to any series of independent logical states, and be able to offer control of the modem. It should also be noted that most UARTs need Auxiliary Output 2 set to a logical "1" to enable interrupts. 
    
    ![Untitled](RS-232%20Protocol/Untitled%209.png)
    
- **LSR +5**
    
    This register is used primarily to give you information on possible error conditions that may exist within the UART, based on the data that has been received.
    
    <aside>
    🧠 Keep in mind that this is a "read only" register, and any data written to this register is likely to be ignored or worse, cause different behavior in the UART
    
    </aside>
    
    ![Untitled](RS-232%20Protocol/Untitled%2010.png)
    
    - Bit 7 refers to errors that are with characters in the FIFO.
    - Bit 6 is set to a logical "1" if all characters have been transmitted (including the FIFO, if active), and the "shift register" is done transmitting as well.
    - Bit 5 merely tells you that the UART is capable of receiving more characters, including into the FIFO for transmitting.
    
    - The Break Interrupt (Bit 4) gets to a logical state of "1" when the serial data input line has received "0" bits for a period of time that is at least as long as an entire serial data "word", including the start bit, data bits, parity bit, and stop bits, for the given baud rate in the Divisor Latch Bytes
    - Framing errors (Bit 3) occur when the last bit is not a stop bit.
    - Parity errors (Bit 2) can also indicate a mismatched baud rate like the framing errors.
    - Overrun errors (Bit 1) are a sign of poor programming or an operating system that is not giving you proper access to the UART. This error condition occurs when there is a character waiting to be read, and the incoming shift register is attempting to move the contents of the next character into the Receiver Buffer (RBR). On UARTs with a FIFO, this also indicates that the FIFO is full as well
    - The Data Ready Bit (Bit 0) is really the simplest part here. This is a way to simply inform you that there is data available for your software to extract from the UART. When this bit is a logical "1", it is time to read the Receiver Buffer (RBR). On UARTs with a FIFO that is active, this bit will remain in a logical "1" state until you have read all of the contents of the FIFO.
- **MSR +6**
    
    This register is another read-only register that is here to inform your software about the current status of the modem.
    
    ![Untitled](RS-232%20Protocol/Untitled%2011.png)
    
    - Carrier Detect will stay in a logical state of "1" while the modem is "connect" to another modem
    - The Ring Indicator bit is directly tied to the RS-232 wire also labeled "RI" or Ring Indicator
    - The "Data Set Ready" and "Clear To Send" bits (Bits 4 and 5) are found directly on an RS-232 cable, and are matching wires to "Request To Send" and "Data Terminal Ready". Those value are transmitted with the "Modem Control Register (MCR).
    
    <aside>
    💡 A note regarding the "delta" bits (Bits 0, 1, 2, and 3). In this case the word "delta" means change, as in a change in the status of one of the bits
    
    </aside>
    
- **SR +7**
    
    The Scratch Register is an interesting enigma. So much effort was done to try and squeeze a whole bunch of registers into all of the other I/O port addresses that the designers had an extra "register" that they didn't know what to do with.
    
    Keep in mind that when dealing with computer architecture, it is easier when dealing with powers of 2, so they were "stuck" with having to address 8 I/O ports.
    
    Allowing another device to use this extra I/O port would make the motherboard design far too complicated. 
    

## Serial driver

We need to create a driver that configures how we are provide it with data.

Initially the driver has an output on the screen where we can write output.

Serial is another device where we can write to communicate.

- We are gonna create “inline” ASM. It is basically the idea of including ASM instructions in C.
    - The **asm** keyword exists for that.
    - The **volatile** keyword specify to the compiler to NOT optimize the asm code.
    
    ```c
    __asm__ volatile("[assembly code]", output, intput, list of clobbered);
    /* The 3 last params are optional */
    ```
    
- We can specify size of values in structure.
    
    ```c
    struct {
    	unsigned char a : 1; // max value is 0b1
    	unsigned char b : 2; // max value is 0b11
    	unsigned char c : 5; // max value is 0b1F
    } bitfields;
    // The size of the structure is 1 byte. sizeof(bitfields) == sizeof(unsigned char)
    ```
    
- We can ask the compiler to not optimize the structures.
    
    ```c
    struct {
    	unsigned char a; // Here, the structure has 3 bytes of padding to be aligned on 4 bytes
    	unsigned char b;
    } food; // Total size: 8 bytes 
    
    struct {
    ...
    } food ((packed)) ; // To avoid this behavior
    ```
    

The “ports” are a bus of secondary address which devices can be connected at.

To be able to configure the driver to the serial port. We want to send data to 2 ports.

![Untitled](RS-232%20Protocol/Untitled%2012.png)

<aside>
💡 Here, the % are replaced by the values.
Here, it is GNU syntax: the source is on left and destination on right.

</aside>

Here, we send 1 byte and receive 1 byte from a port.

The implementation of outb is already implemented in the io.h file.

![Untitled](RS-232%20Protocol/Untitled%2013.png)

serial_init three first lines setup the divisor latch.

![Untitled](RS-232%20Protocol/Untitled%2014.png)

![Untitled](RS-232%20Protocol/Untitled%2015.png)

![Untitled](RS-232%20Protocol/Untitled%2016.png)

## PortIO

- **inb** instruction
- **outb** instruction

<aside>
💡 We can redirect qemu serial port with “ -serial stdio ” parameter.

</aside>

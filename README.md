# DMA-Engine

The DMA Engine is my project work during the 2 months internship in IIT Madras from May to July 2018 for the SHAKTI C-class processor.

Direct Memory Access (DMA) is a method for transfer of data between memory and peripherals, bypassing the CPU
for faster memory operations. This keeps the CPU available to perform other operations while performing the data transfer.
The process is managed by the DMA Controller (DMAC).

This DMA model is parameterized for upto 7 channels for managing the memory access requests from upto 16 peripherals connected to the channels.
The DMA has an arbiter which manages the requests of the peripherals by selecting the channel based on the priority levels.
This model also supports configurable bursts.

P.S. To know more about the DMA Engine, find the file Direct Memory Access.pdf in the repo. 

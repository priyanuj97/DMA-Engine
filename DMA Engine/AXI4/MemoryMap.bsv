package MemoryMap;
	/*=== Project imports ==== */
	import defined_types::*;
	`include "defined_parameters.bsv"
	/*========================= */

	`ifdef simulate
		typedef 5 Num_Slaves;
		typedef 3 Num_Masters; 
	`else
		typedef 6 Num_Slaves;
		typedef 3 Num_Masters;
	`endif


function Tuple2 #(Bool, Bit#(TLog#(Num_Slaves))) fn_addr_to_slave_num  (Bit#(`PADDR) addr);

	`ifdef simulate
		if(addr>=`SDRAMMemBase && addr<=`SDRAMMemEnd)
			return tuple2(True,`Sdram_slave_num);
		else if(addr>=`BootRomBase && addr<=`BootRomEnd)
			return tuple2(True,`BootRom_slave_num);
		`ifdef Debug
		else if(addr>=`DebugBase && addr<=`DebugEnd)
			return tuple2(True,`Debug_slave_num);
		`endif
		else if(addr>=`UART0Base && addr<=`UART0End)
			return tuple2(True,fromInteger(`Uart0_slave_num));
		else if(addr>=`UART1Base && addr<=`UART1End)
			return tuple2(True,fromInteger(`Uart1_slave_num));
	`else
		if(addr>=`SDRAMMemBase && addr<=`SDRAMMemEnd)
			return tuple2(True,`Sdram_slave_num);
		else if(addr>=`BootRomBase && addr<=`BootRomEnd)
			return tuple2(True,`BootRom_slave_num);
		`ifdef Debug
		else if(addr>=`DebugBase && addr<=`DebugEnd)
			return tuple2(True,`Debug_slave_num);
		`endif
		else if(addr>=`UART0Base && addr<=`UART0End)
			return tuple2(True,fromInteger(`Uart0_slave_num));
		else if(addr>=`UART1Base && addr<=`UART1End)
			return tuple2(True,fromInteger(`Uart1_slave_num));
		else if(addr>=`QSPI0MemBase && addr<=`QSPI0MemEnd)
			return tuple2(True,fromInteger(`Qspi0_slave_num));

//		if(addr>=`UART0Base && addr<=`UART0End)
//			return tuple2(True,fromInteger(`Uart0_slave_num));
//		else if(addr>=`UART1Base && addr<=`UART1End)
//			return tuple2(True,fromInteger(`Uart1_slave_num));
//		else if(addr>=`DebugBase && addr<=`DebugEnd)
//			return tuple2(True,`Debug_slave_num);
//		else if(addr>=`QSPI0CfgBase && addr<=`QSPI0CfgEnd)
//			return tuple2(True,fromInteger(`Qspi0_slave_num));
//		else if(addr>=`QSPI1CfgBase && addr<=`QSPI1CfgEnd)
//			return tuple2(True,fromInteger(`Qspi1_slave_num));
//		else if(addr>=`QSPI0MemBase && addr<=`QSPI0MemEnd)
//			return tuple2(True,fromInteger(`Qspi0_slave_num));
//		else if(addr>=`QSPI1MemBase && addr<=`QSPI1MemEnd)
//			return tuple2(True,fromInteger(`Qspi1_slave_num));
//		else if(addr>=`I2C0Base && addr<=`I2C0End)
//			return tuple2(True,fromInteger(`I2c0_slave_num));
//		else if(addr>=`I2C1Base && addr<=`I2C1End)
//			return tuple2(True,fromInteger(`I2c1_slave_num));
//		else if(addr>=`SDRAMCfgBase && addr<=`SDRAMCfgEnd )
//			return tuple2(True,fromInteger(`Sdram_cfg_slave_num));
//		else if(addr>=`SDRAMMemBase && addr<=`SDRAMMemEnd)
//			return tuple2(True,fromInteger(`Sdram_slave_num));
//		else if(addr>=`HyperCfgBase && addr<=`HyperCfgEnd)
//			return tuple2(True,fromInteger(`Hyperflash_reg_slave_num));
//		else if(addr>=`HyperMemBase && addr<=`HyperMemEnd)
//			return tuple2(True,fromInteger(`Hyperflash_mem_slave_num));
//		else if(addr>=`DMABase && addr<=`DMAEnd)
//			return tuple2(True,fromInteger(`Dma_slave_num));
//		else if(addr>=`AxiExp1Base && addr<=`AxiExp1End)
//			return tuple2(True,fromInteger(`AxiExp1_slave_num));
//		else if(addr>=`AxiExp2Base && addr<=`AxiExp2End)
//			return tuple2(True,fromInteger(`AxiExp2_slave_num));
//		else if(addr>=`GPIOBase && addr<=`GPIOEnd)
//			return tuple2(True,fromInteger(`GPIO_slave_num));
//		else if(addr>=`PLICBase && addr<=`PLICEnd)
//			return tuple2(True,fromInteger(`PLIC_slave_num));
//		else if(addr>=`BootRomBase && addr<=`BootRomEnd)
//			return tuple2(True,fromInteger(`BootRom_slave_num));
	`endif
	else
		return tuple2(False,?);
endfunction

function Bool is_IO_Addr(Bit#(`PADDR) addr); // TODO Shuold be PADDR
	`ifdef simulate
		`ifdef Debug
		if(addr>=`DebugBase && addr<=`DebugEnd)
			return (True);
		else
		`endif
		if(addr>=`UART0Base && addr<=`UART0End)
			return (True);
		else if(addr>=`UART1Base && addr<=`UART1End)
			return (True);
		else
			return False;
	`else
		`ifdef Debug
		if(addr>=`DebugBase && addr<=`DebugEnd)
			return (True);
		else
		`endif
		if(addr>=`UART0Base && addr<=`UART0End)
			return (True);
		else if(addr>=`UART1Base && addr<=`UART1End)
			return (True);
		else if(addr>=`QSPI0MemBase && addr<=`QSPI0MemEnd)
			return (True);
		else
			return False;
//		if(addr>=`UART0Base && addr<=`UART0End)
//			return (True);
//		else if(addr>=`DebugBase && addr<=`DebugEnd)
//			return (True);
//		else if(addr>=`UART1Base && addr<=`UART1End)
//			return (True);
//		else if(addr>=`QSPI0CfgBase && addr<=`QSPI0CfgEnd)
//			return (True);
//		else if(addr>=`QSPI1CfgBase && addr<=`QSPI1CfgEnd)
//			return (True);
//		else if(addr>=`QSPI0MemBase && addr<=`QSPI0MemEnd)
//			return (True);
//		else if(addr>=`SDRAMMemBase && addr<=`SDRAMMemEnd)	//TODO Arjun. delete this
//			return (True);
//		else if(addr>=`QSPI1MemBase && addr<=`QSPI1MemEnd)
//			return (True);
//		else if(addr>=`I2C0Base && addr<=`I2C0End)
//			return (True);
//		else if(addr>=`I2C1Base && addr<=`I2C1End)
//			return (True);
//		else if(addr>=`SDRAMCfgBase && addr<=`SDRAMCfgEnd)
//			return (True);
//		else if(addr>=`HyperCfgBase && addr<=`HyperCfgEnd)
//			return (True);
//		else if(addr>=`HyperMemBase && addr<=`HyperMemEnd)
//			return (True);
//		else if(addr>=`DMABase && addr<=`DMAEnd)
//			return (True);
//		else if(addr>=`AxiExp1Base && addr<=`AxiExp1End)
//			return (True);
//		else if(addr>=`AxiExp2Base && addr<=`AxiExp2End)
//			return (True);
//		else if(addr>=`GPIOBase && addr<=`GPIOEnd)
//			return (True);
//		else if(addr>=`PLICBase && addr<=`PLICEnd)
//			return (True);
//		else
//			return (False);
	`endif
endfunction

	
endpackage

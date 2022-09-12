\m4_TLV_version 1d --fmtFlatSignals --bestsv --noline: tl-x.org
\SV
///////////Dsp_macros//////////////

// MULT: Multiply Function implemented in a DSP48
\TLV mult($_p,$_a,$_b,$_rst,#_pipeline,$_ce,#_awidth,#_bwidth)
   \SV_plus
      MULT_MACRO #(
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .LATENCY(m4_defaulted_arg(['#_pipeline'], ['0'])),        // Desired clock cycle latency, 0-4
         .WIDTH_A(m4_defaulted_arg(['#_awidth'], ['25'])),       // Multiplier A-input bus width, 1-25
         .WIDTH_B(m4_defaulted_arg(['#_bwidth'], ['18'])),       // Multiplier B-input bus width, 1-18
      ) MULT_MACRO_inst (
         .P($['']$_p),     // MACC output bus, width determined by WIDTH_P parameter 
         .A($_a),     // MACC input A bus, width determined by WIDTH_A parameter 
         .B($_b),     // MACC input B bus, width determined by WIDTH_B parameter 
         .CE(m4_defaulted_arg(['$_ce'], ['1'])),     // 1-bit active high input clock enable
         .CLK(*clk),   // 1-bit positive edge clock input       \
         .RST($_rst)    // 1-bit input active high reset
      );

// MACC: Multiply Accumulate Function implemented in a DSP48E
\TLV macc($_p,$_a,$_addsub,$_b,$_carryin,$_load,$_loaddata,$_rst,#_pipeline,$_ce,#_awidth,#_bwidth,#_pwidth)
   \SV_plus
      MACC_MACRO #(
          .DEVICE("7SERIES"), // Target Device: "7SERIES" 
          .LATENCY(m4_defaulted_arg(['#_pipeline'], ['1'])),        // Desired clock cycle latency, 1-4
          .WIDTH_A(m4_defaulted_arg(['#_awidth'], ['25'])),       // Multiplier A-input bus width, 1-25
          .WIDTH_B(m4_defaulted_arg(['#_bwidth'], ['18'])),       // Multiplier B-input bus width, 1-18
          .WIDTH_P(m4_defaulted_arg(['#_pwidth'], ['48']))        // Accumulator output bus width, 1-48
       ) MACC_MACRO_inst (
          .P($['']$_p),     // MACC output bus, width determined by WIDTH_P parameter 
          .A($_a),     // MACC input A bus, width determined by WIDTH_A parameter 
          .ADDSUB($_addsub), // 1-bit add/sub input, high selects add, low selects subtract
          .B($_b),     // MACC input B bus, width determined by WIDTH_B parameter 
          .CARRYIN($_carryin), // 1-bit carry-in input to accumulator
          .CE(m4_defaulted_arg(['$_ce'], ['1'])),     // 1-bit active high input clock enable
          .CLK(*clk),   // 1-bit positive edge clock input
          .LOAD($_load), // 1-bit active high input load accumulator enable
          .LOAD_DATA($_loaddata), // Load accumulator input data, width determined by WIDTH_P parameter
          .RST($_rst)    // 1-bit input active high reset
       );
// COUNTER_LOAD: Loadable variable counter implemented in a DSP48E
\TLV counter_load($_q,$_direction,$_load,$_loaddata,$_rst,$_ce,#_width_data)
   \SV_plus
      COUNTER_LOAD_MACRO #(
         .COUNT_BY(48'h000000000001), // Count by value
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .WIDTH_DATA(m4_defaulted_arg(['#_width_data'], ['48']))     // Counter output bus width, 1-48
      ) COUNTER_LOAD_MACRO_inst (
         .Q($['']$_q),                 // Counter output, width determined by WIDTH_DATA parameter 
         .CLK(*clk),             // 1-bit clock input
         .CE(m4_defaulted_arg(['$_ce'], ['1'])),               // 1-bit clock enable input
         .DIRECTION($_direction), // 1-bit up/down count direction input, high is count up
         .LOAD($_load),           // 1-bit active high load input
         .LOAD_DATA($_loaddata), // Counter load data, width determined by WIDTH_DATA parameter 
         .RST($_rst)              // 1-bit active high synchronous reset
      );

// EQ_COMPARE_MACRO: Equality Comparator implemented in a DSP48E  
\TLV  eq_compare($_q,$_datain,$_dynamicpattern,$_rst,#_pipeline,$_ce,#_width,#_selpattern) 
   \SV_plus
      EQ_COMPARE_MACRO #(
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .LATENCY(m4_defaulted_arg(['#_pipeline'], ['0'])),              // Desired clock cycle latency, 0-2
         .MASK(48'h000000000000),  // Select bits to be masked, must set SEL_MASK="MASK" 
         .SEL_MASK("MASK"),        // "MASK" = use MASK parameter,
                                   //   "DYNAMIC_PATTERN" = use DYNAMIC_PATTERN input bus
        .SEL_PATTERN(m4_defaulted_arg(['#_selpattern'], ['24'])), // 1-24 Controls width of PREADD1 and PREADD2 inputs

         //.SEL_PATTERN("STATIC_PATTERN"), // "STATIC_PATTERN" = use STATIC_PATTERN parameter,
                                         //   "DYNAMIC_PATTERN = use DYNAMIC_PATTERN input bus
         .STATIC_PATTERN(48'h000000000000), // Specify static pattern, must set SEL_PATTERN = "STATIC_PATTERN" 
         .WIDTH(m4_defaulted_arg(['#_width'], ['48']))                // Comparator output bus width, 1-48
      ) EQ_COMPARE_MACRO_inst (
         .Q($['']$_q),     // 1-bit output indicating a match
         .CE(m4_defaulted_arg(['$_ce'], ['1'])),   // 1-bit active high input clock enable
         .CLK(*clk), // 1-bit positive edge clock input
         .DATA_IN($_datain), // Input Data Bus, width determined by WIDTH parameter 
         .DYNAMIC_PATTERN($_dynamicpattern), // Input Dynamic Match/Mask Bus, width determined by WIDTH parameter 
         .RST($_rst)  // 1-bit input active high reset
      );

// COUNTER_TC_MACRO: Counter with terminal count implemented in a DSP48E
\TLV  counter_tc($_q,$_tc,$_rst,#_pipeline,$_ce,#_width_data)
   \SV_plus
      COUNTER_TC_MACRO #(
          .COUNT_BY(48'h000000000001), // Count by value
          .DEVICE("7SERIES"), // Target Device: "7SERIES" 
          .DIRECTION("UP"),            // Counter direction, "UP" or "DOWN" 
          .RESET_UPON_TC("FALSE"), // Reset counter upon terminal count, "TRUE" or "FALSE" 
          .TC_VALUE(48'h000000000000), // Terminal count value
          .WIDTH_DATA(m4_defaulted_arg(['#_width_data'], ['48']))              // Counter output bus width, 1-48
       ) COUNTER_TC_MACRO_inst (
          .Q($['']$_q),     // Counter output bus, width determined by WIDTH_DATA parameter 
          .TC($['']$_tc),   // 1-bit terminal count output, high = terminal count is reached
          .CLK(*clk), // 1-bit positive edge clock input
          .CE(m4_defaulted_arg(['$_ce'], ['1'])),   // 1-bit active high clock enable input
          .RST($_rst)  // 1-bit active high synchronous reset
       );

// ADDSUB_MACRO: Variable width & latency - Adder / Subtracter implemented in a DSP48E
\TLV addsub($_carryout,$result,$_a,$_addsub,$_b,$_carryin,$_rst,#_pipeline,$_ce,#_width)
   \SV_plus
      ADDSUB_MACRO #(
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .LATENCY(m4_defaulted_arg(['#_pipeline'], ['0'])),        // Desired clock cycle latency, 0-2
         .WIDTH(m4_defaulted_arg(['#_width'], ['48']))          // Input / output bus width, 1-48
      ) ADDSUB_MACRO_inst (
         .CARRYOUT($['']$carryout), // 1-bit carry-out output signal
         .RESULT($['']$result),     // Add/sub result output, width defined by WIDTH parameter
         .A($_a),               // Input A bus, width defined by WIDTH parameter
         .ADD_SUB($_addsub),   // 1-bit add/sub input, high selects add, low selects subtract
         .B($_b),               // Input B bus, width defined by WIDTH parameter
         .CARRYIN($_carryin),   // 1-bit carry-in input
         .CE(m4_defaulted_arg(['$_ce'], ['1'])),             // 1-bit clock enable input
         .CLK(*clk),           // 1-bit clock input
         .RST( $_rst)ADDMACC            // 1-bit active high synchronous reset
      );
// ADDMACC_MACRO: Variable width & latency - Pre-Add -> Multiplier -> Accumulate
\TLV addmacc ($_product,$_carryin,$_direction,$_load,$_loaddata,$_multiplier,$_preadd2,$_preadd1,$_rst,#_pipeline,$_ce,#_width_preadd,#_width_multiplier,#_width_product)
   \SV_plus
      ADDMACC_MACRO #(
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .LATENCY(m4_defaulted_arg(['#_pipeline'], ['0'])),           // Desired clock cycle latency, 0-4
         .WIDTH_PREADD(m4_defaulted_arg(['#_width_preadd'], ['24'])),     // Pre-adder input width, 1-24
         .WIDTH_MULTIPLIER(m4_defaulted_arg(['#_width_multiplier'], ['18'])), // Multiplier input width, 1-18
         .WIDTH_PRODUCT(m4_defaulted_arg(['#_width_product'], ['48']))     // MACC output width, 1-48
      ) ADDMACC_MACRO_inst (
         .PRODUCT($['']$_product),   // MACC result output, width defined by WIDTH_PRODUCT parameter
         .CARRYIN($_carryin),   // 1-bit carry-in input
         .CLK(*clk),           // 1-bit clock input
         .CE(m4_defaulted_arg(['$_ce'], ['1'])),             // 1-bit clock enable input
         .LOAD($_load),         // 1-bit accumulator load input
         .LOAD_DATA($_loaddata),   // Accumulator load data input, width defined by WIDTH_PRODUCT parameter
         .MULTIPLIER($_multiplier), // Multiplier data input, width defined by WIDTH_MULTIPLIER parameter
         .PREADD2($_preadd2),   // Preadder data input, width defined by WIDTH_PREADD parameter
         .PREADD1($_preadd1),   // Preadder data input, width defined by WIDTH_PREADD parameter
         .RST($_rst)            // 1-bit active high synchronous reset
      );
//////////RAM_macros//////////////
\TLV ram128b($_d,$_we,$_a,$_dpra,$_dp0,$_sp0,#_wclk_inverted)
   \SV_plus
      RAM128X1D #(
      .INIT(128’h0)
      // .IS_WCLK_INVERTED(1’b['']m4_defaulted_arg(['#_wclk_inverted'], ['0'])) // Specifies active high/low WCLK
      ) RAM128X1D_inst (
      .DPO($['']$_dp0), // Read port 1-bit output
      .SPO($['']$_sp0), // Read/write port 1-bit output
      .A($_a), // Read/write port 7-bit address input
      .D($_d), // RAM data input
      .DPRA($_dpra), // Read port 7-bit address input
      .WCLK(*clk), // Write clock input
      .WE($_we) // Write enable input
      );

// FIFO_DUALCLOCK_MACRO: Dual Clock First-In, First-Out (FIFO) RAM Buffer
\TLV fifo_dualclock($_almostempty,$_almostfull,$_do,$_empty,$_full,$_rdcount,$_rderr,$_wrcount,$_wrerr,$_di,$_rdclk,$_rden,$_rst,$_wrclk,$_wren)
   /////////////////////////////////////////////////////////////////
   // DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width //
   // ===========|===========|============|=======================//
   //   37-72    |  "36Kb"   |     512    |         9-bit         //
   //   19-36    |  "36Kb"   |    1024    |        10-bit         //
   //   19-36    |  "18Kb"   |     512    |         9-bit         //
   //   10-18    |  "36Kb"   |    2048    |        11-bit         //
   //   10-18    |  "18Kb"   |    1024    |        10-bit         //
   //    5-9     |  "36Kb"   |    4096    |        12-bit         //
   //    5-9     |  "18Kb"   |    2048    |        11-bit         //
   //    1-4     |  "36Kb"   |    8192    |        13-bit         //
   //    1-4     |  "18Kb"   |    4096    |        12-bit         //
   /////////////////////////////////////////////////////////////////
   \SV_plus
      FIFO_DUALCLOCK_MACRO  #(
         .ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
         .ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
         .DATA_WIDTH(0),   // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .FIFO_SIZE ("18Kb"), // Target BRAM: "18Kb" or "36Kb" 
         .FIRST_WORD_FALL_THROUGH ("FALSE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
      ) FIFO_DUALCLOCK_MACRO_inst (
         .ALMOSTEMPTY($['']$_almostempty), // 1-bit output almost empty
         .ALMOSTFULL($['']$_almostfull),   // 1-bit output almost full
         .DO($['']$_do),                   // Output data, width defined by DATA_WIDTH parameter
         .EMPTY($['']$_empty),             // 1-bit output empty
         .FULL($['']$_full),               // 1-bit output full
         .RDCOUNT($['']$_rdcount),         // Output read count, width determined by FIFO depth
         .RDERR($['']$_rderr),             // 1-bit output read error
         .WRCOUNT($['']$_wrcount),         // Output write count, width determined by FIFO depth
         .WRERR($['']$_wrerr),             // 1-bit output write error
         .DI($_di),                   // Input data, width defined by DATA_WIDTH parameter
         .RDCLK($_rdclk),             // 1-bit input read clock
         .RDEN($_rden),               // 1-bit input read enable
         .RST($_rst),                 // 1-bit input reset
         .WRCLK($_wrclk),             // 1-bit input write clock
         .WREN($_wren)                // 1-bit input write enable
      );
      
   // End of FIFO_DUALCLOCK_MACRO_inst instantiation
   
// BRAM_SDP_MACRO: Simple Dual Port RAM
\TLV bram_sdp(data_width, $_wrdata, $_wraddr, $_wren, $_rddata, $_rden, $_rdaddr)
   m4_pushdef(['m4_we'], m4_ifelse(m4_eval(data_width > 36), 1, 8, m4_eval(data_width > 18), 1, 4, m4_eval(data_width > 9), 1, 2, 1))

   ///////////////////////////////////////////////////////////////////////
   //  READ_WIDTH | BRAM_SIZE | READ Depth  | RDADDR Width |            //
   // WRITE_WIDTH |           | WRITE Depth | WRADDR Width |  WE Width  //
   // ============|===========|=============|==============|============//
   //    37-72    |  "36Kb"   |      512    |     9-bit    |    8-bit   //
   //    19-36    |  "36Kb"   |     1024    |    10-bit    |    4-bit   //
   //    19-36    |  "18Kb"   |      512    |     9-bit    |    4-bit   //
   //    10-18    |  "36Kb"   |     2048    |    11-bit    |    2-bit   //
   //    10-18    |  "18Kb"   |     1024    |    10-bit    |    2-bit   //
   //     5-9     |  "36Kb"   |     4096    |    12-bit    |    1-bit   //
   //     5-9     |  "18Kb"   |     2048    |    11-bit    |    1-bit   //
   //     3-4     |  "36Kb"   |     8192    |    13-bit    |    1-bit   //
   //     3-4     |  "18Kb"   |     4096    |    12-bit    |    1-bit   //
   //       2     |  "36Kb"   |    16384    |    14-bit    |    1-bit   //
   //       2     |  "18Kb"   |     8192    |    13-bit    |    1-bit   //
   //       1     |  "36Kb"   |    32768    |    15-bit    |    1-bit   //
   //       1     |  "18Kb"   |    16384    |    14-bit    |    1-bit   //
   ///////////////////////////////////////////////////////////////////////
   \SV_plus
      BRAM_SDP_MACRO #(
         .BRAM_SIZE("36Kb"), // Target BRAM, "18Kb" or "36Kb" 
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .WRITE_WIDTH(data_width),    // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
         .READ_WIDTH(data_width),     // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
         .DO_REG(0),         // Optional output register (0 or 1)
         .INIT_FILE ("NONE"),
         .SIM_COLLISION_CHECK ("ALL"), // Collision check enable "ALL", "WARNING_ONLY", 
                                       //   "GENERATE_X_ONLY" or "NONE" 
         .WRITE_MODE("READ_FIRST")  // Specify "READ_FIRST" for same clock or synchronous clocks
                                     //   Specify "WRITE_FIRST for asynchronous clocks on ports
       )BRAM_SDP_MACRO_inst (
         .DO(>>1$['']$_rddata),    // Output read data port, width defined by READ_WIDTH parameter
         .DI($_wrdata),     // Input write data port, width defined by WRITE_WIDTH parameter
         .RDADDR($_rdaddr), // Input read address, width defined by read port depth
         .RDCLK(*clk),      // 1-bit input read clock
         .RDEN($_rden),     // 1-bit input read port enable
         .REGCE(1'b1),      // 1-bit input read output register enable
         .RST(*reset),      // 1-bit input reset      
         .WE(m4_we),        // Input write enable, width defined by write port depth
         .WRADDR($_wraddr), // Input write address, width defined by write port depth
         .WRCLK(*clk),      // 1-bit input write clock
         .WREN($_wren)      // 1-bit input write port enable
      );
   // End of BRAM_SDP_MACRO_inst instantiation
   m4_popdef(['m4_we'])


   

// BRAM_SINGLE_MACRO: Single Port RAM
\TLV bram_single($_do,$_addr,$_clk,$_di,$_en,$_regce,$_rst,$_we)
   /////////////////////////////////////////////////////////////////////
   //  READ_WIDTH | BRAM_SIZE | READ Depth  | ADDR Width |            //
   // WRITE_WIDTH |           | WRITE Depth |            |  WE Width  //
   // ============|===========|=============|============|============//
   //    37-72    |  "36Kb"   |      512    |    9-bit   |    8-bit   //
   //    19-36    |  "36Kb"   |     1024    |   10-bit   |    4-bit   //
   //    19-36    |  "18Kb"   |      512    |    9-bit   |    4-bit   //
   //    10-18    |  "36Kb"   |     2048    |   11-bit   |    2-bit   //
   //    10-18    |  "18Kb"   |     1024    |   10-bit   |    2-bit   //
   //     5-9     |  "36Kb"   |     4096    |   12-bit   |    1-bit   //
   //     5-9     |  "18Kb"   |     2048    |   11-bit   |    1-bit   //
   //     3-4     |  "36Kb"   |     8192    |   13-bit   |    1-bit   //
   //     3-4     |  "18Kb"   |     4096    |   12-bit   |    1-bit   //
   //       2     |  "36Kb"   |    16384    |   14-bit   |    1-bit   //
   //       2     |  "18Kb"   |     8192    |   13-bit   |    1-bit   //
   //       1     |  "36Kb"   |    32768    |   15-bit   |    1-bit   //
   //       1     |  "18Kb"   |    16384    |   14-bit   |    1-bit   //
   /////////////////////////////////////////////////////////////////////
   \SV_plus
      BRAM_SINGLE_MACRO #(
         .BRAM_SIZE("36Kb"), // Target BRAM, "18Kb" or "36Kb" 
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .DO_REG(0), // Optional output register (0 or 1)
         .INIT(36'h000000000), // Initial values on output port
         .INIT_FILE ("NONE"),
         .WRITE_WIDTH(0), // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
         .READ_WIDTH(0),  // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
         .SRVAL(36'h000000000), // Set/Reset value for port output
         .WRITE_MODE("WRITE_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
         .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         
         // The next set of INIT_xx are valid when configured as 36Kb
         .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         
         // The next set of INITP_xx are for the parity bits
         .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
   
         // The next set of INIT_xx are valid when configured as 36Kb
         .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000)
      ) BRAM_SINGLE_MACRO_inst (
         .DO($['']$_do),       // Output data, width defined by READ_WIDTH parameter
         .ADDR($_addr),   // Input address, width defined by read/write port depth
         .CLK($_clk),     // 1-bit input clock
         .DI($_di),       // Input data port, width defined by WRITE_WIDTH parameter
         .EN($_en),       // 1-bit input RAM enable
         .REGCE($_regce), // 1-bit input output register enable
         .RST($_rst),     // 1-bit input reset
         .WE($_we)        // Input write enable, width defined by write port depth
      );
   
   


// FIFO_SYNC_MACRO: Synchronous First-In, First-Out (FIFO) RAM Buffer
\TLV fifo_sync($_do,$_empty,$_full,$_rdcount,$_rderr,$_wrcount,$_wrerr,$_di,$_rden,$_rst,$_wren)
   /////////////////////////////////////////////////////////////////
   // DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width //
   // ===========|===========|============|=======================//
   //   37-72    |  "36Kb"   |     512    |         9-bit         //
   //   19-36    |  "36Kb"   |    1024    |        10-bit         //
   //   19-36    |  "18Kb"   |     512    |         9-bit         //
   //   10-18    |  "36Kb"   |    2048    |        11-bit         //
   //   10-18    |  "18Kb"   |    1024    |        10-bit         //
   //    5-9     |  "36Kb"   |    4096    |        12-bit         //
   //    5-9     |  "18Kb"   |    2048    |        11-bit         //
   //    1-4     |  "36Kb"   |    8192    |        13-bit         //
   //    1-4     |  "18Kb"   |    4096    |        12-bit         //
   /////////////////////////////////////////////////////////////////
   \SV_plus
      FIFO_SYNC_MACRO  #(
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
         .ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
         .DATA_WIDTH(0), // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
         .DO_REG(0),     // Optional output register (0 or 1)
         .FIFO_SIZE ("18Kb")  // Target BRAM: "18Kb" or "36Kb" 
      ) FIFO_SYNC_MACRO_inst (
         .ALMOSTEMPTY($['']$_almostempty), // 1-bit output almost empty
         .ALMOSTFULL($['']$_almostfull),   // 1-bit output almost full
         .DO($['']$_do),                   // Output data, width defined by DATA_WIDTH parameter
         .EMPTY($['']$_empty),             // 1-bit output empty
         .FULL($['']$_full),               // 1-bit output full
         .RDCOUNT($['']$_rdcount),         // Output read count, width determined by FIFO depth
         .RDERR($['']$_rderr),             // 1-bit output read error
         .WRCOUNT($['']$_wrcount),         // Output write count, width determined by FIFO depth
         .WRERR($['']$_wrerr),             // 1-bit output write error
         .CLK(*clk),                 // 1-bit input clock
         .DI($_di),                   // Input data, width defined by DATA_WIDTH parameter
         .RDEN($_rden),               // 1-bit input read enable
         .RST($_rst),                 // 1-bit input reset
         .WREN($_wren)                // 1-bit input write enable
       );
      // End of FIFO_SYNC_MACRO_inst instantiation

   
   
   
   
   
// BRAM_TDP_MACRO: True Dual Port RAM
\TLV bram_tdb($_almostempty,$_almostfull,$_do,$_empty,$_full,$_rdcount,$_rderr,$_wrcount,$_wrerr,$_di,$_rden,$_rst,$_wren)
   //////////////////////////////////////////////////////////////////////////
   // DATA_WIDTH_A/B | BRAM_SIZE | RAM Depth | ADDRA/B Width | WEA/B Width //
   // ===============|===========|===========|===============|=============//
   //     19-36      |  "36Kb"   |    1024   |    10-bit     |    4-bit    //
   //     10-18      |  "36Kb"   |    2048   |    11-bit     |    2-bit    //
   //     10-18      |  "18Kb"   |    1024   |    10-bit     |    2-bit    //
   //      5-9       |  "36Kb"   |    4096   |    12-bit     |    1-bit    //
   //      5-9       |  "18Kb"   |    2048   |    11-bit     |    1-bit    //
   //      3-4       |  "36Kb"   |    8192   |    13-bit     |    1-bit    //
   //      3-4       |  "18Kb"   |    4096   |    12-bit     |    1-bit    //
   //        2       |  "36Kb"   |   16384   |    14-bit     |    1-bit    //
   //        2       |  "18Kb"   |    8192   |    13-bit     |    1-bit    //
   //        1       |  "36Kb"   |   32768   |    15-bit     |    1-bit    //
   //        1       |  "18Kb"   |   16384   |    14-bit     |    1-bit    //
   //////////////////////////////////////////////////////////////////////////
   \SV_plus
      BRAM_TDP_MACRO #(
         .BRAM_SIZE("36Kb"), // Target BRAM: "18Kb" or "36Kb" 
         .DEVICE("7SERIES"), // Target Device: "7SERIES" 
         .DOA_REG(0),        // Optional port A output register (0 or 1)
         .DOB_REG(0),        // Optional port B output register (0 or 1)
         .INIT_A(36'h0000000),  // Initial values on port A output port
         .INIT_B(36'h00000000), // Initial values on port B output port
         .INIT_FILE ("NONE"),
         .READ_WIDTH_A (0),   // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
         .READ_WIDTH_B (0),   // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
         .SIM_COLLISION_CHECK ("ALL"), // Collision check enable "ALL", "WARNING_ONLY", 
                                       //   "GENERATE_X_ONLY" or "NONE" 
         .SRVAL_A(36'h00000000), // Set/Reset value for port A output
         .SRVAL_B(36'h00000000), // Set/Reset value for port B output
         .WRITE_MODE_A("WRITE_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
         .WRITE_MODE_B("WRITE_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
         .WRITE_WIDTH_A(0), // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
         .WRITE_WIDTH_B(0), // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
         .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         
         // The next set of INIT_xx are valid when configured as 36Kb
         .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),        
         // The next set of INITP_xx are for the parity bits      .INIT_FF(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
        
        // The next set of INITP_xx are valid when configured as 36Kb
         .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),  
         .INITP_09(256'h00000000000000000000000000000000000000  00000000000000000000000000),
         .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
         .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000)
      ) BRAM_TDP_MACRO_inst (
         .DOA($_doa),       // Output port-A data, width defined by READ_WIDTH_A parameter
         .DOB($_dop),       // Output port-B data, width defined by READ_WIDTH_B parameter
         .ADDRA($_addra),   // Input port-A address, width defined by Port A depth
         .ADDRB($_addrb),   // Input port-B address, width defined by Port B depth
         .CLKA($_clka),     // 1-bit input port-A clock
         .CLKB($_clkb),     // 1-bit input port-B clock
         .DIA($_dia),       // Input port-A data, width defined by WRITE_WIDTH_A parameter
         .DIB($_dip),       // Input port-B data, width defined by WRITE_WIDTH_B parameter
         .ENA($_ena),       // 1-bit input port-A enable
         .ENB($_end),       // 1-bit input port-B enable
         .REGCEA($_regcea), // 1-bit input port-A output register enable
         .REGCEB($_regceb), // 1-bit input port-B output register enable
         .RSTA($_rsta),     // 1-bit input port-A reset
         .RSTB($_rstb),     // 1-bit input port-B reset
         .WEA($_wea),       // Input port-A write enable, width defined by Port A depth
         .WEB($_web)        // Input port-B write enable, width defined by Port B depth
      );
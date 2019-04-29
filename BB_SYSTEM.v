/*
Caja negra de Frogger. Reune y conecta todos y cada uno de los bloques necesarios para esta implementacion del juego Frogger
*/

//=======================================================
//  MODULE Definition
//=======================================================
module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_upButton_InLow,
	BB_SYSTEM_downButton_InLow,
	BB_SYSTEM_leftButton_InLow,
	BB_SYSTEM_rightButton_InLow
);

//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_BUS = 8;

//=======================================================
//  PORT declarations
//=======================================================

output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;

input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_upButton_InLow;
input		BB_SYSTEM_downButton_InLow;
input		BB_SYSTEM_leftButton_InLow;
input		BB_SYSTEM_rightButton_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================

wire BB_SYSTEM_startButton_InLow_cwire;
wire BB_SYSTEM_upButton_InLow_cwire;
wire BB_SYSTEM_downButton_InLow_cwire;
wire BB_SYSTEM_leftButton_InLow_cwire;
wire BB_SYSTEM_rightButton_InLow_cwire;

wire BB_SYSTEM_resetMachina;
wire BB_SYSTEM_JUEGO;
wire BB_SYSTEM_MORI_TRANSICION;
wire BB_SYSTEM_EMPEZAR_TRANSICION;
wire BB_SYSTEM_ARRANQUE_NIVEL;
wire BB_SYSTEM_ADD_ROW;
wire BB_SYSTEM_SUB_ROW;
wire BB_SYSTEM_REINICIAR_SUMADOR;
wire BB_SYSTEM_SUMAR_NIVEL;
wire BB_SYSTEM_SUMAR_RANA;
wire BB_SYSTEM_MOVE;

wire BB_SYSTEM_MORI;
wire BB_SYSTEM_LLEGUE_CASA;
wire BB_SYSTEM_TERMINO_CARGA;
wire [2:0] BB_SYSTEM_NUM_NIVEL;
wire BB_SYSTEM_FIN_TRANSICION;
wire BB_SYSTEM_NUM_RANA;

wire [2:0] BB_SYSTEM_NUM_FILA;

wire BB_SYSTEM_CONT_FREC;

wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANA_1;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANA_2;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANA_3;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANA_4;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANA_5;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANA_6;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANA_7;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_RANA_8;

wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_TRANSICION_1;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_TRANSICION_2;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_TRANSICION_3;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_TRANSICION_4;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_TRANSICION_5;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_TRANSICION_6;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_TRANSICION_7;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_TRANSICION_8;

wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_CARROS_1;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_CARROS_2;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_CARROS_3;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_CARROS_4;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_CARROS_5;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_CARROS_6;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_CARROS_7;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_CARROS_8;

wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_NIVEL_1;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_NIVEL_2;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_NIVEL_3;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_NIVEL_4;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_NIVEL_5;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_NIVEL_6;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_NIVEL_7;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_NIVEL_8;

wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_FILA_1;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_FILA_2;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_FILA_3;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_FILA_4;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_FILA_5;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_FILA_6;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_FILA_7;
wire [DATAWIDTH_BUS-1:0] BB_SYSTEM_FILA_8;


wire 	[7:0] data_max;
wire 	[2:0] add;

//=======================================================
//  Structural coding
//=======================================================


//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_upButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_upButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_downButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_downButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u3 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u4 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_InLow)
);

//######################################################################
//#	MAQUINA DE ESTADOS
//######################################################################
SC_STATEMACHINE SC_STATEMACHINE_u0 (
	
	.SC_STATEMACHINE_MORI_TRANSICION_BIT_out(BB_SYSTEM_MORI_TRANSICION),
	.SC_STATEMACHINE_JUEGO_BIT_out(BB_SYSTEM_JUEGO),
	.SC_STATEMACHINE_EMPEZAR_TRANSICION_BIT_out(BB_SYSTEM_EMPEZAR_TRANSICION),
	.SC_STATEMACHINE_ARRANQUE_NIVEL_BIT_out(BB_SYSTEM_ARRANQUE_NIVEL),
	.SC_STATEMACHINE_SUMAR_NIVEL_BIT_out(BB_SYSTEM_SUMAR_NIVEL),
	.SC_STATEMACHINE_SUMAR_RANA_BIT_out(BB_SYSTEM_SUMAR_RANA),
	.SC_STATEMACHINE_MOVE_BIT_out(BB_SYSTEM_MOVE),
	.SC_STATEMACHINE_RESET_MACHINA_BIT_out(BB_SYSTEM_resetMachina),
	.SC_STATEMACHINE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_RESET_In(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_DEBOUNCE_LEFT_BUTTON_BIT_In(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_STATEMACHINE_DEBOUNCE_RIGHT_BUTTON_BIT_In(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_STATEMACHINE_DEBOUNCE_DOWN_BUTTON_BIT_In(BB_SYSTEM_downButton_InLow_cwire),
	.SC_STATEMACHINE_DEBOUNCE_UP_BUTTON_BIT_In(BB_SYSTEM_upButton_InLow_cwire),
	.SC_STATEMACHINE_DEBOUNCE_START_BUTTON_BIT_In(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINE_MORI_BIT_In(BB_SYSTEM_MORI),
	.SC_STATEMACHINE_LLEGUE_CASA_BIT_In(BB_SYSTEM_LLEGUE_CASA),
	.SC_STATEMACHINE_TERMINO_CARGA_BIT_In(BB_SYSTEM_TERMINO_CARGA),
	.SC_STATEMACHINE_NUM_NIVEL_BUS_In(BB_SYSTEM_NUM_NIVEL),
	.SC_STATEMACHINE_NUM_RANA_BIT_In(BB_SYSTEM_NUM_RANA),
	.SC_STATEMACHINE_FIN_TRANSICION_BIT_In(BB_SYSTEM_FIN_TRANSICION),
	.SC_STATEMACHINE_CONT_FREC_In(BB_SYSTEM_CONT_FREC)
);	

//######################################################################
//#	FROGGER
//######################################################################
CV_RANA CV_RANA_u0 (
// port map - connection between master ports and signals/registers   
	.CV_RANA_ARRANQUE_NIVEL_in(BB_SYSTEM_ARRANQUE_NIVEL),
	.CV_RANA_NUM_FILA_BUS_in(BB_SYSTEM_NUM_FILA),
	.CV_RANA_MOVE_BIT_in(BB_SYSTEM_MOVE),
	.CV_RANA_RESET_MACHINA_BIT(BB_SYSTEM_resetMachina),
	.CV_RANA_CONT_FREC(BB_SYSTEM_CONT_FREC),
	.CV_RANA_CLk(BB_SYSTEM_CLOCK_50),
	.CV_RANA_upButton(BB_SYSTEM_upButton_InLow_cwire),
	.CV_RANA_downButton(BB_SYSTEM_downButton_InLow_cwire),
	.CV_RANA_leftButton(BB_SYSTEM_leftButton_InLow_cwire),
	.CV_RANA_rightButton(BB_SYSTEM_rightButton_InLow_cwire),
	.CV_RANA_ADD_ROW_out(BB_SYSTEM_ADD_ROW),
	.CV_RANA_SUB_ROW_out(BB_SYSTEM_SUB_ROW),
	.CV_RANA_REINICIAR_SUMADOR(BB_SYSTEM_REINICIAR_SUMADOR),
	.CV_RANA_FILA1_BUS_out(BB_SYSTEM_RANA_1),
	.CV_RANA_FILA2_BUS_out(BB_SYSTEM_RANA_2),
	.CV_RANA_FILA3_BUS_out(BB_SYSTEM_RANA_3),
	.CV_RANA_FILA4_BUS_out(BB_SYSTEM_RANA_4),
	.CV_RANA_FILA5_BUS_out(BB_SYSTEM_RANA_5),
	.CV_RANA_FILA6_BUS_out(BB_SYSTEM_RANA_6),
	.CV_RANA_FILA7_BUS_out(BB_SYSTEM_RANA_7),
	.CV_RANA_FILA8_BUS_out(BB_SYSTEM_RANA_8)
);

//######################################################################
//#	CONTADOR
//######################################################################


CV_CONTADOR CV_CONTADOR_u0 (
	.CV_CONTADOR_SUMAR_NIVEL_BIT_in(BB_SYSTEM_SUMAR_NIVEL),
	.CV_CONTADOR_JUEGO_BIT_in(BB_SYSTEM_JUEGO),
	.CV_CONTADOR_SUMAR_RANA_BIT_in(BB_SYSTEM_SUMAR_RANA),
	.CV_CONTADOR_RESET_MACHINA_BIT(BB_SYSTEM_resetMachina),
	.CV_CONTADOR_CONT_FRECUENCIA_BIT_out(BB_SYSTEM_CONT_FREC),
	.CV_CONTADOR_NUM_NIVEL_BUS_out(BB_SYSTEM_NUM_NIVEL),
	.CV_CONTADOR_NUM_RANAS_BIT_out(BB_SYSTEM_NUM_RANA),
	.CV_CONTADOR_TERMINO_TRANSICION_BIT_out(BB_SYSTEM_FIN_TRANSICION),
	.CV_CONTADOR_CLK(BB_SYSTEM_CLOCK_50)
);

//######################################################################
//#	TRANSICION
//######################################################################

CV_TRANSICION CV_TRANSICION_u0 (
.CV_TRANSICION_CONTADOR_FRECUENCIA_BIT_in(BB_SYSTEM_CONT_FREC),
.CV_TRANSICION_NUM_NIVEL_BUS_in(BB_SYSTEM_NUM_NIVEL),
.CV_TRANSICION_EMPEZAR_TRANSICION_BIT_in(BB_SYSTEM_EMPEZAR_TRANSICION),
.CV_TRANSICION_MORI_TRANSICION_BIT_in(BB_SYSTEM_MORI_TRANSICION),
.CV_TRANSICION_CLK(BB_SYSTEM_CLOCK_50),
.CV_TRANSICION_RESET_MACHINA_BIT(BB_SYSTEM_resetMachina),
.CV_TRANSICION_FILA_1_BUS_out(BB_SYSTEM_TRANSICION_1),
.CV_TRANSICION_FILA_2_BUS_out(BB_SYSTEM_TRANSICION_2),
.CV_TRANSICION_FILA_3_BUS_out(BB_SYSTEM_TRANSICION_3),
.CV_TRANSICION_FILA_4_BUS_out(BB_SYSTEM_TRANSICION_4),
.CV_TRANSICION_FILA_5_BUS_out(BB_SYSTEM_TRANSICION_5),
.CV_TRANSICION_FILA_6_BUS_out(BB_SYSTEM_TRANSICION_6),
.CV_TRANSICION_FILA_7_BUS_out(BB_SYSTEM_TRANSICION_7),
.CV_TRANSICION_FILA_8_BUS_out(BB_SYSTEM_TRANSICION_8)
);

//######################################################################
//#	FILA
//######################################################################

CV_FILA CV_FILA_u0 (
	.CV_FILA_NUM_FILA(BB_SYSTEM_NUM_FILA),
	.CV_FILA_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.CV_FILA_RESET_InHigh(BB_SYSTEM_resetMachina),
	.CV_FILA_ADDROW_InLow(BB_SYSTEM_ADD_ROW),
	.CV_FILA_SUBROW_InLow(BB_SYSTEM_SUB_ROW),
	.CV_FILA_ARRANQUE_NIVEL(BB_SYSTEM_ARRANQUE_NIVEL),
	.CV_FILA_REINICIAR_SUMADOR(BB_SYSTEM_REINICIAR_SUMADOR)
);

//######################################################################
//#	CARROS&CASAS
//######################################################################

CV_CARS_HOUSES CV_CARS_HOUSES_u0(
.CV_CARS_HOUSES_CONTADOR_FRECUENCIA_BIT_in(BB_SYSTEM_CONT_FREC),
.CV_CARS_HOUSES_NUM_NIVEL_BUS_in(BB_SYSTEM_NUM_NIVEL),
.CV_CARS_HOUSES_NUM_RANAS_in(BB_SYSTEM_NUM_RANA),
.CV_CARS_HOUSES_CLK(BB_SYSTEM_CLOCK_50),
.CV_CARS_HOUSES_RESET_MACHINA_BIT(BB_SYSTEM_resetMachina),
.CV_CARS_HOUSES_NIVEL_FILA8_BUS_in(BB_SYSTEM_NIVEL_1),
.CV_CARS_HOUSES_LOAD_EXTRA(BB_SYSTEM_LLEGUE_CASA),
.CV_CARS_HOUSES_FILA1_BUS_out(BB_SYSTEM_CARROS_1),
.CV_CARS_HOUSES_FILA2_BUS_out(BB_SYSTEM_CARROS_2),
.CV_CARS_HOUSES_FILA3_BUS_out(BB_SYSTEM_CARROS_3),
.CV_CARS_HOUSES_FILA4_BUS_out(BB_SYSTEM_CARROS_4),
.CV_CARS_HOUSES_FILA5_BUS_out(BB_SYSTEM_CARROS_5),
.CV_CARS_HOUSES_FILA6_BUS_out(BB_SYSTEM_CARROS_6),
.CV_CARS_HOUSES_FILA7_BUS_out(BB_SYSTEM_CARROS_7),
.CV_CARS_HOUSES_FILA8_BUS_out(BB_SYSTEM_CARROS_8)
);



//######################################################################
//#	NIVEL
//######################################################################

CV_NIVEL CV_NIVEL_u0 (
	.ARRANQUE_NIVEL_in(BB_SYSTEM_ARRANQUE_NIVEL),
	.NUM_FILA_BUS_in(BB_SYSTEM_NUM_FILA),
	.CONT_FREC(BB_SYSTEM_CONT_FREC),
	.RANA_FILA1_BUS_in(BB_SYSTEM_RANA_1),
	.RANA_FILA2_BUS_in(BB_SYSTEM_RANA_2),
	.RANA_FILA3_BUS_in(BB_SYSTEM_RANA_3),
	.RANA_FILA4_BUS_in(BB_SYSTEM_RANA_4),
	.RANA_FILA5_BUS_in(BB_SYSTEM_RANA_5),
	.RANA_FILA6_BUS_in(BB_SYSTEM_RANA_6),
	.RANA_FILA7_BUS_in(BB_SYSTEM_RANA_7),
	.RANA_FILA8_BUS_in(BB_SYSTEM_RANA_8),
	.CARROS_FILA1_BUS_in(BB_SYSTEM_CARROS_1),
	.CARROS_FILA2_BUS_in(BB_SYSTEM_CARROS_2),
	.CARROS_FILA3_BUS_in(BB_SYSTEM_CARROS_3),
	.CARROS_FILA4_BUS_in(BB_SYSTEM_CARROS_4),
	.CARROS_FILA5_BUS_in(BB_SYSTEM_CARROS_5),
	.CARROS_FILA6_BUS_in(BB_SYSTEM_CARROS_6),
	.CARROS_FILA7_BUS_in(BB_SYSTEM_CARROS_7),
	.CARROS_FILA8_BUS_in(BB_SYSTEM_CARROS_8),
	.NIVEL_FILA1_BUS_out(BB_SYSTEM_NIVEL_1),
	.NIVEL_FILA2_BUS_out(BB_SYSTEM_NIVEL_2),
	.NIVEL_FILA3_BUS_out(BB_SYSTEM_NIVEL_3),
	.NIVEL_FILA4_BUS_out(BB_SYSTEM_NIVEL_4),
	.NIVEL_FILA5_BUS_out(BB_SYSTEM_NIVEL_5),
	.NIVEL_FILA6_BUS_out(BB_SYSTEM_NIVEL_6),
	.NIVEL_FILA7_BUS_out(BB_SYSTEM_NIVEL_7),
	.NIVEL_FILA8_BUS_out(BB_SYSTEM_NIVEL_8),
	.MORI_BIT_out(BB_SYSTEM_MORI),
	.LLEGUE_CASA_BIT_out(BB_SYSTEM_LLEGUE_CASA),
	.TERMINO_CARGA_BIT_out(BB_SYSTEM_TERMINO_CARGA),
	.RESET_MACHINA_BIT(BB_SYSTEM_resetMachina),
	.CLK(BB_SYSTEM_CLOCK_50)
);

//######################################################################
//#	MATRIZ LEDS
//######################################################################

CV_MATRIZ_LEDS CV_MATRIZ_LEDS_u0 (
.CV_MATRIZ_LEDS_JUEGO_BIT_in(BB_SYSTEM_JUEGO),
.CV_MATRIZ_LEDS_TRANSICION_FILA1_in(BB_SYSTEM_TRANSICION_1),
.CV_MATRIZ_LEDS_TRANSICION_FILA2_in(BB_SYSTEM_TRANSICION_2),
.CV_MATRIZ_LEDS_TRANSICION_FILA3_in(BB_SYSTEM_TRANSICION_3),
.CV_MATRIZ_LEDS_TRANSICION_FILA4_in(BB_SYSTEM_TRANSICION_4),
.CV_MATRIZ_LEDS_TRANSICION_FILA5_in(BB_SYSTEM_TRANSICION_5),
.CV_MATRIZ_LEDS_TRANSICION_FILA6_in(BB_SYSTEM_TRANSICION_6),
.CV_MATRIZ_LEDS_TRANSICION_FILA7_in(BB_SYSTEM_TRANSICION_7),
.CV_MATRIZ_LEDS_TRANSICION_FILA8_in(BB_SYSTEM_TRANSICION_8),
.CV_MATRIZ_LEDS_NIVEL_FILA1_in(BB_SYSTEM_NIVEL_1),
.CV_MATRIZ_LEDS_NIVEL_FILA2_in(BB_SYSTEM_NIVEL_2),
.CV_MATRIZ_LEDS_NIVEL_FILA3_in(BB_SYSTEM_NIVEL_3),
.CV_MATRIZ_LEDS_NIVEL_FILA4_in(BB_SYSTEM_NIVEL_4),
.CV_MATRIZ_LEDS_NIVEL_FILA5_in(BB_SYSTEM_NIVEL_5),
.CV_MATRIZ_LEDS_NIVEL_FILA6_in(BB_SYSTEM_NIVEL_6),
.CV_MATRIZ_LEDS_NIVEL_FILA7_in(BB_SYSTEM_NIVEL_7),
.CV_MATRIZ_LEDS_NIVEL_FILA8_in(BB_SYSTEM_NIVEL_8),
.CV_MATRIZ_LEDS_FILA1_out(BB_SYSTEM_FILA_1),
.CV_MATRIZ_LEDS_FILA2_out(BB_SYSTEM_FILA_2),
.CV_MATRIZ_LEDS_FILA3_out(BB_SYSTEM_FILA_3),
.CV_MATRIZ_LEDS_FILA4_out(BB_SYSTEM_FILA_4),
.CV_MATRIZ_LEDS_FILA5_out(BB_SYSTEM_FILA_5),
.CV_MATRIZ_LEDS_FILA6_out(BB_SYSTEM_FILA_6),
.CV_MATRIZ_LEDS_FILA7_out(BB_SYSTEM_FILA_7),
.CV_MATRIZ_LEDS_FILA8_out(BB_SYSTEM_FILA_8),
.CV_MATRIZ_LEDS_RESET(BB_SYSTEM_resetMachina),
.CV_MATRIZ_LEDS_CLK(BB_SYSTEM_CLOCK_50)
);

//######################################################################
//#	IMAGEN
//######################################################################

IMAGEN IMAGEN_u0(
    .act_add(add),
	 .max_in(data_max),
	 .MATRIZ_FILA1(BB_SYSTEM_FILA_1),
	 .MATRIZ_FILA2(BB_SYSTEM_FILA_2),
	 .MATRIZ_FILA3(BB_SYSTEM_FILA_3),
	 .MATRIZ_FILA4(BB_SYSTEM_FILA_4),
	 .MATRIZ_FILA5(BB_SYSTEM_FILA_5),
	 .MATRIZ_FILA6(BB_SYSTEM_FILA_6),
	 .MATRIZ_FILA7(BB_SYSTEM_FILA_7),
	 .MATRIZ_FILA8(BB_SYSTEM_FILA_8)
    );

//######################################################################
//#	CONTROLADOR MATRIZ
//######################################################################

matrix_ctrl matrix_ctrl_unit_0( 
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_resetMachina) //~lowRst_System
 ); 

endmodule

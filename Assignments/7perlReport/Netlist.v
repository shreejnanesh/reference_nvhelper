DFFQX1 \result_reg[2] (.CK (clk), .D (n_30), .Q (result[2]));
DFFQX1 \result_reg[1] (.CK (clk), .D (n_38), .Q (result[1]));
DFFQX1 \result_reg[6] (.CK (clk), .D (n_36), .Q (result[6]));
DFFQX2 \result_reg[3] (.CK (clk), .D (n_31), .Q (result[3]));
DFFQX1 \result_reg[0] (.CK (clk), .D (n_29), .Q (result[0]));
DFFQX1 \result_reg[5] (.CK (clk), .D (n_33), .Q (result[5]));
DFFQX1 \result_reg[4] (.CK (clk), .D (n_32), .Q (result[4]));
DFFQX2 \result_reg[7] (.CK (clk), .D (n_28), .Q (result[7]));
DFFQX1 \temp_reg[4] (.CK (clk), .D (n_23), .Q (temp[4]));
DFFQX1 \temp_reg[3] (.CK (clk), .D (n_27), .Q (temp[3]));
DFFQX1 \temp_reg[2] (.CK (clk), .D (n_21), .Q (temp[2]));
DFFQX3 \temp_reg[5] (.CK (clk), .D (n_22), .Q (temp[5]));
DFFQX1 \temp_reg[1] (.CK (clk), .D (n_18), .Q (temp[1]));
DFFQX1 \temp_reg[0] (.CK (clk), .D (n_19), .Q (temp[0]));
DFFQX3 \temp_reg[6] (.CK (clk), .D (n_26), .Q (temp[6]));
DFFQX1 \temp_reg[7] (.CK (clk), .D (n_20), .Q (temp[7]));
DFFXL \temp_reg[3] (.CK (clk), .D (n_66), .Q (temp[3]), .QN (n_51));
DFFXL \temp_reg[5] (.CK (clk), .D (n_69), .Q (temp[5]), .QN (n_63));
DFFXL \temp_reg[6] (.CK (clk), .D (n_213), .Q (temp[6]), .QN (n_54));
SDFFQXL \digital_out_reg[0] (.CK (clk), .D (digital_out[0]), .SI
       (result[0]), .SE (n_323), .Q (digital_out[0]));
SDFFQXL \digital_out_reg[6] (.CK (clk), .D (digital_out[6]), .SI
       (result[6]), .SE (n_323), .Q (digital_out[6]));
SDFFQXL \digital_out_reg[7] (.CK (clk), .D (digital_out[7]), .SI
     (result[7]), .SE (n_323), .Q (digital_out[7]));
SDFFQXL \digital_out_reg[1] (.CK (clk), .D (digital_out[1]), .SI
       (result[1]), .SE (n_323), .Q (digital_out[1]));
SDFFQXL \digital_out_reg[3] (.CK (clk), .D (digital_out[3]), .SI
       (result[3]), .SE (n_323), .Q (digital_out[3]));
SDFFQXL \digital_out_reg[2] (.CK (clk), .D (digital_out[2]), .SI
       (result[2]), .SE (n_323), .Q (digital_out[2]));
SDFFQXL \digital_out_reg[5] (.CK (clk), .D (digital_out[5]), .SI
       (result[5]), .SE (n_323), .Q (digital_out[5]));
SDFFQXL \digital_out_reg[4] (.CK (clk), .D (digital_out[4]), .SI
  (result[4]), .SE (n_323), .Q (digital_out[4]));
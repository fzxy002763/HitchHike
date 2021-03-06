module main_clock( clock, reset, clock_out );
input clock, reset;
output reg clock_out;

reg[7:0] counter;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        counter <= 8'h00;
        clock_out <= 1'h0;
    end
    else
    begin
        if (counter==8'h00)
        begin
            counter <= 0;
            clock_out <= ~clock_out;
        end
        else        
        begin
            counter <= counter+1;
            clock_out <= clock_out;
        end
    end
end

endmodule


module popout();
always@(time_t) begin
  if((ENABLE_FULL == 0) && (q_memctrl.size()!=0)) begin
   if(time_t % 2 == 0) toggle_out_from_memctrl_q(); 
end
  end

always@(time_t) begin
  if(q_memctrl.size() == 0) begin 
    empty_qu =1; 
  end
  else empty_qu =0;
  if(q_memctrl.size == 15) begin
    full_qu=1;
     $display(" memory controller queue is full");
   //q_memctrl.delete();
  end
  else full_qu =0;
end
endmodule

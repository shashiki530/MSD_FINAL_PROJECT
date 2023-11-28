//push logic
task mem_ctrl_store(); 
     temp = {q_oper.pop_front(), q_addr.pop_front()};
   q_memctrl.push_back(temp);
   if(ENABLE_TEST) $display(" %t \t  Push new item to master queue(memctrl) queue=%h, time_t=%d, memctrl_q_size=%d", $time, temp,time_t,q_memctrl.size);
endtask

// pop out each element from master queue
task toggle_out_from_memctrl_q();
   output_data= q_memctrl[0];
   foreach(q_memctrl[i]) $display("\t MASTER QUEUE [%0h] = %h",i,q_memctrl[i]);    
   if(output_data) begin
     if(ENABLE_TEST) 
       $display(" output_data=%0h", output_data);
   end
   output_cmd_format(output_data);
   q_memctrl.pop_front();
    if(output_data || (output_data==0)) begin 
      if(ENABLE_TEST) 
       $display(" %t Pop out item from queue output_data =%h, time_t=%d, q_mem_ctrl_size=%d \n", $time,output_data,time_t,q_memctrl.size());
    end
   count++;
 endtask

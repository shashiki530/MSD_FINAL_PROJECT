// Address decoding 
task output_cmd_format(input [37:0] output_data);
 if(ENABLE_TEST) begin
      file_write=$fopen("dram.txt","a");// opening file in append mode
     if(file_write!=0) begin
       if(output_data[37:36] ==0 || output_data[37:36]==2) begin 
   
        
      $display("\t\t\t -----------Read operation-------------------Operation=%d---------", output_data[37:36]);
	 

      $display(" %t \t channel=%d, ACT0 bank_group=%d, bank=%d, row=%d", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[33:18]);
      $fwrite(file_write," %t \t %d ACT0 %d %d %d\n", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[33:18]);

      $display(" %t \t channel=%d, ACT1 bank_group=%d, bank=%d, row=%d", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[33:18]);
       $fwrite(file_write," %t \t %d ACT1 %d %d %d\n", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[33:18]);

      $display(" %t \t channel=%d, RD0 bank_group=%d, bank=%d, column=%d", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[17:12]);
      $fwrite(file_write," %t \t %d RD0 %d %d %d\n", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[17:12]);

      $display(" %t \t channel=%d, RD1 bank_group=%d, bank=%d, column=%d", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[17:12]);
      $fwrite(file_write," %t \t %d RD1 %d %d %d\n", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[17:12]);

      $display(" %t \t channel=%d, PRE bank_group=%d, bank=%d", $time, output_data[6],output_data[9:7],output_data[11:10]);
       $fwrite(file_write," %t \t %d PRE %d %d\n", $time, output_data[6],output_data[9:7],output_data[11:10]);

    end

    if(output_data[37:36]==1) begin

 

      $display("\t\t\t -----------Write operation----------Operation=%d-------", output_data[37:36]);
      

      $display(" %t \t channel=%d, ACT0 bank_group=%d, bank=%d, row=%d", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[33:18]);
      $fwrite(file_write," %t \t %d ACT0 %d  %d =%d\n", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[33:18]);

      $display(" %t \t channel=%d, ACT1 bank_group=%d, bank=%d, row=%d", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[33:18]);
 	$fwrite(file_write," %t \t %d ACT1 %d %d %d\n", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[33:18]);

      	$display(" %t \t channel=%d, WR0 bank_group=%d, bank=%d, column=%d", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[17:12]);
     	 $fwrite(file_write," %t \t %d WR0 %d %d %d\n", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[17:12]);

     	 $display(" %t \t channel=%d, WR1 bank_group=%d, bank=%d, column=%d", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[17:12]);
	 $fwrite(file_write," %t \t %d WR1 %d %d %d\n", $time, output_data[6],output_data[9:7],output_data[11:10],output_data[17:12]);

     	 $display(" %t \t channel=%d, REF bank_group=%d, bank=%d", $time, output_data[6],output_data[9:7],output_data[11:10]);
	$fwrite(file_write," %t \t %d REF %d %d\n", $time, output_data[6],output_data[9:7],output_data[11:10]);

    end
$fclose(file_write);
  end else begin
   $display("error opening the file to write");
end 
end 

endtask

//Parsing file to read and write input trace file 

module parsing_tb#(parameter ENABLE_TEST=0);
int file_read;   // to read a input trace file
int file_write;  // to write into output trace file
string line;

task parsing();
  $display("Entering parsing task");
  if(ENABLE_TEST) begin    //switch to ENABLE/DISABLE 
    if($value$plusargs("input_file=%s",line))begin
      //Read a input trace file through command line
      file_read =$fopen(line,"r+");
      if(file_read) begin
        $display("trace file read =%0d",file_read);
      end
      // Writes data to output.txt file
      file_write=$fopen("dram.txt", "w");
      if(file_write) begin
        int i;
        while(1) begin
          if($fgets(line,file_read)) begin
            $fwrite(file_write,"%s",line);
            i++;
          end
          else begin
            break;    // exit after the last line
          end

        end
                        
      end
      $fclose(file_read);      
      $fclose(file_write);
    end
    else begin
      $display("error :please provide the input file using +input_file=<filename>");
    end
    $display("End of Parsing task");
  end
endtask


initial begin
  parsing();  
  $finish;
end
endmodule


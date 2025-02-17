module binary_full_adder(a,b,cin,sum,cout);

    input a;
    input b;
    input cin;
    output sum;
    output cout;

    wire sum1, cout1, sum2, cout2, carry;

    half_adder half_adder_1 (.A(a), .B(b), .SUM(sum1), .COUT(cout1));
    half_adder half_adder_1 (.A(sum1), .B(cin), .SUM(sum2), .COUT(cout2));
    
    sky130_fd_sc_hd__and2_1 U1 ( .A(cout1), .B(cin), .X(carry) );
    sky130_fd_sc_hd__nor2_1 U2 ( .A(carry), .B(cout2), .Y(cout3) );
    sky130_fd_sc_hd__inv_1 U3 ( .A(cout3),.Y(cout) );
    sky130_fd_sc_hd__xor2_1 U4 ( .A(sum2), .B(cout), .X(sum) );

endmodule

module half_adder(A,B,SUM,COUT,CC,DD);
    input A;
    input B;
    input CC;
    output SUM;
    output COUT;
    output DD;

    assign DD = CC;
    wire n1, n2, n3, n4;


    sky130_fd_sc_hd__xor2_1 U1 ( .A(A), .B(B), .X(n1) );
    sky130_fd_sc_hd__and2_1 U2 ( .A(A), .B(B), .X(COUT) );
    sky130_fd_sc_hd__inv_1 U3 ( .A(n1), .Y(n2) );
    sky130_fd_sc_hd__inv_1 U4 ( .A(n2), .Y(SUM) );
    sky130_fd_sc_hd__inv_1 U5 ( .A(n3), .Y(n4) );
    sky130_fd_sc_hd__inv_1 U6 ( .A(n4), .Y(COUT) );

endmodule
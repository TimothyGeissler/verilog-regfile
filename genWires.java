public class genWires {
    public static void main(String[] args) {
        for (int i = 0; i < 32; i++) {
            System.out.println("tristate32 triA" + i + "(sharedOut[" + ((i * 32) + 31) + ":" + (i * 32) + "], rsDecOut1[" + i + "], data_readRegA);");
            //System.out.println("register32 reg" + i + "(data_writeReg, orWire[" + i + "], 1'b1, clock, ctrl_reset, sharedOut[" + ((i * 32) + 31) + ":" + (i * 32) + "]);");
        }
    }
}
package collaborative;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
public class ImageCompMain {
	//public static void main(String[] args) throws IOException {		
		//String baseFile = "D:/imageA.PNG";
		//String changeFile = "D:/imageB.PNG";
               // String status="";
                //all method to compare above images.
		 // System.out.println(compareWithBaseImage(new File(baseFile), new File(changeFile)) );
	//}
	//ImageCompMain im= ImageCompMain();
        //here base file is first image and changefile is second image paths
        
       // im.compareWithBaseImage(File baseImage, File compareImage);
	public boolean compareWithBaseImage(File baseImage, File compareImage)
			throws IOException {
		BufferedImage bImage = ImageIO.read(baseImage);
		BufferedImage cImage = ImageIO.read(compareImage);
		int height = bImage.getHeight();
		int width = bImage.getWidth();
                String res="";
		BufferedImage rImage = new BufferedImage(width, height, BufferedImage.TYPE_4BYTE_ABGR);
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				try {
					int pixelC = cImage.getRGB(x, y);
					int pixelB = bImage.getRGB(x, y);
					if (pixelB == pixelC ) {
						rImage.setRGB(x, y,  bImage.getRGB(x, y));
                                                res="matched";
					} else {
						int a= 0xff |  bImage.getRGB(x, y)>>24 , 
						r= 0xff &  bImage.getRGB(x, y)>>16 , 
						g= 0x00 &  bImage.getRGB(x, y)>>8,
						b= 0x00 &  bImage.getRGB(x, y);	
						
						int modifiedRGB=a<<24|r<<16|g<<8|b;
						rImage.setRGB(x,y,modifiedRGB);
                                                 res="Not matched";
					}
				} catch (Exception e) {
					// handled hieght or width mismatch
					rImage.setRGB(x, y, 0x80ff0000);
				}
			}
		}
		
	if (res=="matched") {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;
        }	
	}
}
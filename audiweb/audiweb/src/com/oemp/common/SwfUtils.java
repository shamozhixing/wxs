package com.oemp.common;

import java.awt.Dimension;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;

public final class SwfUtils {
	/**
	 * 得到一个SWF文件的首选尺寸. 
	 * 算法介绍: <br>
	 * 感谢avie提供swf格式的支持 
	 * 从第9个字节起读5 bits，设值为n； 越过n bits，读n bits，设值为x； 再跳过n
	 * bits，读取n bits，设值为y。 swf的宽度和高度依次为x/20和y/20像素
	 * */
	//------------------------FWS:start
	public static Dimension getPreferredSizeByIs(InputStream is) throws IOException {
		is.skip(8);
		byte[] head = new byte[22];
		is.read(head);
		head = toBitArray(head);
		int n = (int) readBit(head, 0, 5);
		long x = readBit(head, 5 + n, n);
		long y = readBit(head, 5 + n * 3, n);
		Dimension d = new Dimension((int) (x / 20), (int) (y / 20));
		return d;
	}
	
	public static Dimension getPreferredSizeByByte(byte[] bytes) throws IOException {
		byte[] head = new byte[30];
		if(bytes.length<30){
			return null;
		}
		for(int i=0;i<22;i++){
			head[i]=bytes[i+8];
		}
		head = toBitArray(head);
		int n = (int) readBit(head, 0, 5);
		long x = readBit(head, 5 + n, n);
		long y = readBit(head, 5 + n * 3, n);
		Dimension d = new Dimension((int) (x / 20), (int) (y / 20));
		return d;
	}

	/**
	 * 从data的from位开始,依次读出length个bit
	 * 
	 * @param data
	 *            数组的每一个元素表示一个bit
	 * @param from
	 *            起始位置
	 * @param length
	 *            读bit的个数
	 * @return 对应的long型值
	 * @see #toBitArray
	 */
	private static long readBit(byte[] data, int from, int length) {
		long rv = 0;
		for (int i = 0; i < length; i++) {
			rv += data[from + i] << (length - i - 1);
		}
		return rv;
	}

	/**
	 * 把byte数组转为bit数组
	 * 
	 * @param data
	 *            数据流
	 * @return 对应的bit数组,长度位data.length*8
	 * */
	private static byte[] toBitArray(byte[] data) {
		byte[] rv = new byte[data.length * 8];
		for (int i = 0; i < data.length; i++) {
			rv[i * 8] = (byte) ((data[i] & 0x80) > 0 ? 1 : 0);
			rv[i * 8 + 1] = (byte) ((data[i] & 0x40) > 0 ? 1 : 0);
			rv[i * 8 + 2] = (byte) ((data[i] & 0x20) > 0 ? 1 : 0);
			rv[i * 8 + 3] = (byte) ((data[i] & 0x10) > 0 ? 1 : 0);
			rv[i * 8 + 4] = (byte) ((data[i] & 0x08) > 0 ? 1 : 0);
			rv[i * 8 + 5] = (byte) ((data[i] & 0x04) > 0 ? 1 : 0);
			rv[i * 8 + 6] = (byte) ((data[i] & 0x02) > 0 ? 1 : 0);
			rv[i * 8 + 7] = (byte) ((data[i] & 0x01) > 0 ? 1 : 0);
		}
		return rv;
	}
	//------------------------FWS:end
	//------------------------CWS:start
	public static byte[] readCWSType( String fileName ) 
   {
	  File file = new File( fileName );
      FileInputStream fis   = null;
      byte[] swf = new byte[ readFullSize( file ) - 1 ];
      try
      {
         fis = new FileInputStream( file );
         fis.read( swf );
         fis.close();
         byte[] decomp = uncompress(swf);
         return decomp;
         
      }
      catch ( IOException e )
      {
         System.err.println( e );
      }
      catch ( DataFormatException dfe )
      {
         System.err.println( dfe );
      }
      
      return null;
   }
	public static byte[] uncompress( byte[] bytes ) throws DataFormatException
   {  
      Inflater decompressor = new Inflater();
      decompressor.setInput( strip( bytes ) );//feed the Inflater the bytes
      
      ByteArrayOutputStream stream = new ByteArrayOutputStream( bytes.length - 8 );//an expandable byte array to store the uncompressed data
      
      byte[] buffer = new byte[1024];
      while ( !decompressor.finished() )//read until the end of the stream is found
      {
         try
         {
            int count = decompressor.inflate( buffer );//decompress the data into the buffer
            stream.write( buffer, 0, count );
         }
         catch( DataFormatException dfe )
         {
            dfe.printStackTrace();
         }
      }
      try
      {
         stream.close();
      }
      catch( IOException e )
      {
         e.printStackTrace();
      }
      
      //create an array to hold the header and body bytes
      byte[] swf = new byte[ 8 + stream.size() ];
      //copy the first 8 bytes which are uncompressed into the swf array
      System.arraycopy( bytes, 0, swf, 0, 8 );
      //copy the uncompressed data into the swf array
      System.arraycopy( stream.toByteArray(), 0, swf, 8, stream.size() );
      //the first byte of the swf indicates whether the swf is compressed or not
      swf[0] = 70;
      
      return swf;
   }
	public static int readFullSize( File file )
   {
      byte[] temp = new byte[8];
      
      try
      {
         FileInputStream fis = new FileInputStream( file );
         fis.read( temp );
         fis.close();
      }
      catch ( IOException e )
      {
         System.err.println( e );
      }
      return readSize( temp );
   }
	   
   public static int readSize( byte[] bytes )
   {
      int s = 0;
      for ( int i = 0; i < 4; i++ )
      {
         s = ( s << 8 ) + bytes[i + 4];
      }

      s = Integer.reverseBytes( s ) - 1;

      return s;
   }
   public static byte[] strip( byte[] bytes )
   {
      byte[] compressable = new byte[bytes.length - 8];
      System.arraycopy( bytes, 8, compressable, 0, bytes.length - 8 );//fills a byte array with data needing decompression
      return compressable;
   }
	//-----------------------CWS:end
}

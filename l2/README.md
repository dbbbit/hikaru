###［内容］

0. `端口 IO`
1. `CMOS` 时间读取
2.  写数据到内存

从 `cmos` 读取月和日数据到内存单元，并用 `gdb` 查看结果。

### ［编译］

make build	  

### ［调试］

make debug：	

在另一个 `shell` 中输入

	>	gdb
	>	target remote :1234
	>	br *0x7c00

相关`gdb` 调试命令:   
 
    x               查看内存数据  

    x/i 0x7c00      查看指令,不一定准确
    x/10i 0x7c00    同上，一次显示十条
    
    x/t 0x0         查看内存0x0 处的数据，二进制显示
    x/x 0x0         十六进制,BCD 方式显示
    
###［参考链接］

1. [`CMOS` ](http://wiki.osdev.org/CMOS)

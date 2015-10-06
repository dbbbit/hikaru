## 内容
从 `cmos` 读取月和日数据到内存单元，并用 `gdb` 查看结果。

## 调试

```bash
$ make debug：	
```

在另一个 `shell` 中输入

	>	gdb
	>	target remote :1234
	>	br *0x7c00

相关`gdb` 调试命令:   
 
    c               continue  
    si              step  

    x               查看内存数据  

    x/i 0x7c00      查看指令,不一定准确
    x/10i 0x7c00    同上，一次显示十条
    
    x/t 0x0         查看内存0x0 处的数据，二进制显示
    x/x 0x0         十六进制,BCD 方式显示
    
## 参考链接

* [`CMOS` ](http://wiki.osdev.org/CMOS)
* [`GDB Continuing and stepping`](http://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_37.html)
* [`NASM Tutorial`](http://cs.lmu.edu/~ray/notes/nasmtutorial/)

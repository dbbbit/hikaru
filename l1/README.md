###［环境准备］

- 目前只在 Mac 上实验过，其他系统请自行尝试。
- `NASM`	[汇编编译器](http://www.nasm.us/)
```sh
    brew install nasm
```

- `QEMU`	可调试的模拟器 (比 `bochs` 更容易使用)
```sh
    brew install qemu
```

- `GDB`	调试工具

### ［启动］

Makefile 已经写好了几个命令方便开发。  

	make    编译并生成可用的软盘镜像  
	make boot	启动  

这个 `bootloader` 非常简单，没有任何可见的输出，只有一行寄存器操作。接下来我们会在调试环境来查看寄存器操作的效果。

### ［调试］

make debug：	
	
	qemu 开机后会自动挂起，开始监听调试端口（默认端口1234），等待调试指令。
	具体 qemu --help 查看相关参数意义。

在另一个 `shell` 中输入

	>	gdb
	>	target remote :1234
	>	info reg   ;查看寄存器值
	>	c
	> 	^ctrl-c    ;手动执行（bootloader 无限循环中，故需终止)
	> 	info reg 	

即可查看到寄存器的数值。


### ［HOMEWORK］

1. 观察启动后的 ip 寄存器变化。
2. 修改 boot.asm, 重新编译，调试观察效果。


# Chuong trinh nhap chuoi chu thuong va xuat chu hoa
# enter a string of lowercase letters and output a string of uppercase letters
# 19120637
.data # khai báo du lieu (data declaration)
  print1: .asciiz "Input: "
  print2: .asciiz "Output: "
  str: .asciiz
  # hoac co the thay the bang cach ben duoi (or)
  str1: .space 128 
  
.text # chay chuong trinh
 
input:
  # nhap chuoi tu ban phim
  # enter a string of lowercase letters 
  la $a0, print1
  li $v0, 4
  syscall
  
  li $v0, 8
  la $a0, str 
  li $a1, 128 # do dai chuoi (length string)
  syscall
  
  # tao vong lap xu ly chuoi
  # create a loop that processes the string
  j handle

yes:
  sub $t0, $t0, 32
  sb $t0, str($t1)
  # tang bien dem $t1 them 1 don vi va tiep tuc vong lap
  # increase the counter variable $t1 by 1 and continue the loop
  add $t1, $t1, 1
  j handle

no: 
  sb $t0, str($t1)
  add $t1, $t1, 1
  j handle

handle:
  sge $t0, $t1, 127
  beq $t0, 1, output
  lbu $t0, str($t1)
  # kiem tra xem du lieu dau vao co phai chu thuong khong
  # check if input character is lowercase?
  # neu co thi dua vao ham xu ly yes
  # If yes, then switch to the yes function
  sge $t2, $t0, 97
  sle $t3, $t0, 122
  beq $t2, $t3, yes
  # neu khong thi dua vao ham xu ly ngoai le no
  # If no, then switch to the no function
  j no

output:
  # xuat chuoi ky tu ra man hinh
  # output a string of uppercase letters
  la $a0, print2
  li $v0, 4
  syscall
  
  li $v0, 4
  la $a0, str
  syscall

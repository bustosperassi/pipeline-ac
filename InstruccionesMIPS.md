#Lista de instrucciones que contemplan este trabajo

# Introduccion #

Para comenzar con el trabajo practico necesitamos saber cuales son las instrucciones que entran en juego en el pipeline. Una vez hecho esto podemos comenzar primero por un parser que verifique el estado de las instrucciones (si están correctamente escritas), para luego ejecutarlas con el pipeline.

# Instrucciones #

## Tipo I ##
### LB (Load byte) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|1 0 0 0 0 0|   base  |   rt    |             offset            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---------------16--------------+
```

**Formato:**           LB rt,offset(base)

**Propósito**:         Guarda un byte desde memoria a registro.

**Descripción:** rt ← memory[base+offset]

---


---

### LH (Load halfword) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|1 0 0 0 0 1|   base  |   rt    |             offset            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---------------16--------------+
```

**Formato:** LH rt,offset(base)

**Propósito:**: Guarda una media palabra desde memoria a registro.

**Descripción:** rt ← memory[base+offset]

---


---

### LW (Load word) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|1 0 0 0 1 1|   base  |   rt    |              offset           |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+---5-----+---------------16--------------+
```

**Formato:**  LW rt,offset(base)

**Propósito**: Guarda una palabra desde memoria a registro.

**Descripción:** rt ← memory[base+offset]

---


---

### LWU (Load word unsigned) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|1 0 0 1 1 1|   base  |  rt     |             offset            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---------------16--------------+
```

**Formato:**  LWU rt,offset(base)

**Propósito:** Guarda una palabra sin signo desde memoria a registro.

**Descripción:** rt ← memory[base+offset]

---


---

### LBU (Load byte unsigned) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|1 0 0 1 0 0|   base  |   rt    |             offset            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---------------16--------------+
```

**Formato:** LBU rt,offset(base)

**Propósito**: Guarda un byte sin signo desde memoria a registro.

**Descripción:** rt ← memory[base+offset]

---


---

### LHU (Load halfword unsigned) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|1 0 0 1 0 1|   base  |   rt    |             offset            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---------------16--------------+
```

**Formato:** LHU rt,offset(base)

**Propósito:** Guarda una media palabra sin signo desde memoria a registro.

**Descripción:** rt ← memory[base+offset]

---


---

### SB (store byte) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|1 0 1 0 0 0|  base     |   rt    |             offset          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+-----5-----+---5-----+---------------16--------------+
```

**Formato:** SB rt,offset(base)

**Propósito:** Guarda byte a memoria.

**Descripción:** memory[base+offset] ← rt

---


---

### SH(store halfword) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|1 0 1 0 0 1|  base   |   rt    |             offset            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```

**Formato:** SH rt,offset(base)

**Propósito:** Guarda media palabra en memoria.

**Descripción:** memory[base+offset] ← rt

---

### SW(store word) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|1 0 1 0 1 1|  base   |   rt    |             offset            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```

**Formato:** SW rt,offset(base)

**Propósito:** Guarda palabra en memoria.

**Descripción:** memory[base+offset] ← rt

---


---

### ADDI (Add Inmediate Word) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 1 0 0 0|   rs    |   rt    |            inmediate          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```
**Formato:** ADDI rt, rs, inmediate

**Propósito:** Suma una constante a un entero de 32 bits. Si ocurre un overflow, then trap.

**Descripción:** rt ← rs + inmediate

---


---

### ADDIU (Add Inmediate Word unsigned) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 1 0 0 1|   rs    |   rt    |            inmediate          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```
**Formato:** ADDIU rt, rs, inmediate

**Propósito:** Suma una constante a un entero de 32 bits. Si ocurre un overflow, then trap.

**Descripción:** rt ← rs + inmediate

---


---

### ANDI (And Inmediate) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 1 1 0 0|   rs    |   rt    |            inmediate          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```

**Formato:** ANDI rt, rs, inmediate

**Propósito:** Hace bit a bit la operación lógica AND con una constante.

**Description:** rt ← rs AND immediate

---


---

### ORI (OR Inmediate) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 1 1 0 1|   rs    |   rt    |            inmediate          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```

**Formato:** ORI rt, rs, immediate

**Propósito:** Hace una operación lógica OR bit a bit con una constante.

**Descripción:** rd ← rs OR immediate

---


---

### XORI (Exclusive OR Immediate) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 1 1 1 0|   rs    |   rt    |            inmediate          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```

**Formato:** XORI rt, rs, immediate

**Propósito:** Hace una operación lógica OR bit a bit con una constante.

**Descripción:** rt ← rs XOR inmediate

---


---

### LUI(Load Upper Inmediate) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 1 1 1 1|0 0 0 0 0|   rt    |           inmediate           |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```
**Formato:** LUI rt, inmediate

**Propósito:** Carga una constante en la parte alta de una media palabra.

**Descripción:** rt ← inmediate || <sub>0</sub>16

---


---

### SLTI(Set on Less Than Inmediate) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 1 0 1 0|   rs    |   rt    |           inmediate           |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```
**Formato:** SLTI rt, rs, inmediate

**Propósito:** Guarda el resultado de la comparación con la constante. Coloca 1 en rt si rs es menor que el inmediato.

**Descripción:** rt ← (rs < inmediate)

---


---

### SLTIU (Set on Less Than Inmediate Unsigned) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 1 0 1 1|   rs    |   rt    |            inmediate          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```
**Formato:** SLTIU rt, rs, inmediate

**Propósito:** Guarda el resultado sin signo de la comparacion con la constante. Coloca 1 en rt si rs es menor que el inmediato.

**Descripción:** rt ← (rs < immediate)

---


---

### BEQ(Branch on Equal) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 1 0 0|   rs    |   rt    |             offset            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```

**Formato:** BEQ rs, rt, offset

**Propósito:** Compara si son iguales y salta.

**Descripción:** if (rs = rt) luego salta.

---


---

### BNE(Branch on Not Equal) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 1 0 1|   rs    |   rt    |          offset               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---5-----+---5-----+---------------16--------------+
```
**Formato:** BNE rs, rt, offset

**Propósito:** Compara si son distintos y salta.

**Descripción:** if (rs ≠ rt) luego salta.

---


---

### J(Jump) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 1 0|            instr_index                            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+-----------------------26--------------------------+
```

**Formato:** J target

**Propósito:** Salto dentro de los siguientes 256 MB.


---


---

### JAL(Jump And Link) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 1 1|            instr_index                            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+---------------------26----------------------------+
```
**Formato:** JAL target

**Propósito:** Llama a procedimiento dentro de los siguientes 256 MB

---


---

## Tipo J ##
### JR (Jump Register) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|0 0 1 0 0 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+---------------15------------+-----6-----+
```

**Formato:** JR rs

**Propósito:** Salta a una dirección de instrucción en un registro.

**Descripción:** PC ← rs

---


---

### JALR (Jump And Link Register) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |0 0 0 0 0|   rd    |0 0 0 0 0|0 0 1 0 0 1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** JALR rs (rd=31 implícito)

**Formato:** JALR rd, rs

**Propósito:** Procedimiento llama a una dirección de instrucción en un registro.

**Descripción:** rd ← return\_addr, PC ← rs

---


---

## Tipo R ##
### SLL (Shift Word Left Logical) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|0 0 0 0 0|   rt    |   rd    |   sa    |0 0 0 0 0 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SLL rd, rt, sa

**Propósito:** Corre a la izquierda un número de bits indicado.

**Descripción:** rd ← rt << sa

---


---

### SRL (Shift Word Right Logical) ###

```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|0 0 0 0 0|   rt    |   rd    |   sa    |0 0 0 0 1 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SRL rd, rt, sa

**Propósito:**  Corre a la derecha un número de bits indicado.

**Descripción:** rd ← rt >> sa (logical)

---


---

### SRA (Shift Word Right Arithmetic) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|0 0 0 0 0|   rt    |   rd    |   sa    |0 0 0 0 1 1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SRA rd, rt, sa

**Propósito:** Corrimiento aritmetico a la derecha una palabra a un numero de bits.

**Descripción:** rd ← rt >> sa (arithmetic)

---


---

### SLLV (Shift Word Left Logical Variable) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 1 0 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SLLV rd, rt, rs

**Propósito:** To left shift a word by a variable number of bits.

**Descripción:** rd ← rt << rs

---


---

### SRLV (Shift Word Right Logical Variable) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 1 1 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SRLV rd, rt, rs

**Propósito:** To logical right shift a word by a variable number of bits.

**Descripción:** rd ← rt >> rs (logical)

---


---

### SRAV(Shift Word Right Arithmetic Variable) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 1 1 1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SRAV rd, rt, rs

**Propósito:** Corrimiento aritmético a la derecha un numero variable de bits.

**Descripción: rd ← rt >> rs (arithmetic)

---


---

### ADD(Add Word) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|  rs     |  rt     |  rd     |0 0 0 0 0|1 0 0 0 0 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```**

**Formato:** ADD rd, rs, rt

**Propósito:**  To add 32-bit integers. If overflow occurs, then trap.

**Descripción:** rd ← rs + rt

---


---

### ADDU(Add Unsigned Word) ###

```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 0 0|1 0 0 0 0 1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** ADDU rd, rs, rt

**Propósito:** To add 32-bit integers.

**Descripción:** rd ← rs + rt

---


---

### SUB(Subtract Word) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 0 0|1 0 0 0 1 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SUB rd, rs, rt

**Propósito:** Para restar enteros de 32 bits.

**Descripción:** rd ← rs - rt


---


---

### SUBU(Subtract Unsigned Word) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 0 0|1 0 0 0 1 1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SUBU rd, rs, rt

**Propósito:** Para restar enteros de 32 bits.

**Descripción:** rd ← rs - rt

---


---


### AND (And) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 0 0|1 0 0 1 0 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```
**Formato:** AND rd, rs, rt

**Propósito:** Operación lógica AND bit a bit.

**Descripción:** rd ← rs AND rt

---


---


### OR(or) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 0 0|1 0 0 1 0 1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** OR rd, rs, rt

**Proposito:** Operacion logica OR bit a bit.

**Descripcion:** rd ← rs OR rt

---


---

### XOR(Exclusive OR) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 0 0|1 0 0 1 1 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```
**Formato:** XOR rd, rs, rt

**Propósito:** Operación lógica OR EXCLUSIVA bit a bit.

**Descripción:** rd ← rs XOR rt

---


---

### NOR(Not OR) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 0 0|1 0 0 1 1 1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```
**Formato:** NOR rd, rs, rt

**Propósito:** Operación lógica bit a bit NOT OR

**Descripción:** rd ← rs NOR rt

---

### SLT(Set On Less Than) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 0 0|1 0 1 0 1 0|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SLT rd, rs, rt

**Propósito:** Guarda el resultado de la comparación. Coloca 1 en rt si rs es menor que el inmediato.

**Descripción:** rd ← (rs < rt)

---


---

### SLTU(Set On Less Than Unsigned) ###
```
32                             16                               0
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|0 0 0 0 0 0|   rs    |   rt    |   rd    |0 0 0 0 0|1 0 1 0 1 1|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+----6------+----5----+----5----+---5-----+----5----+-----6-----+
```

**Formato:** SLTU rd, rs, rt

**Propósito:** guarda el resultado de la comparación sin signo.

**Descripción:** rd ← (rs < rt)


---


---

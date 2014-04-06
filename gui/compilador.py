#!/usr/bin/python

##########################################
#
# 		PARSER v1.1
#
# Autores: Alfonzo, Marcos
#	   Cueva, Martin
#	   Morales, Nicolas
# 
# Materia: Arquitectura de Computadoras
#
##########################################

import os
import sys
# -------------------------------------------------------------
# Instrucciones tipo R
# -------------------------------------------------------------
RT={'SLL':'000000'}  # SLL rd, rt, sa - rd <- rt << sa
                    # 00000000000rtrdsa00000
RT['SRL']='000010'   # SRL rd, rt, sa - rd <-rt >> sa
                    # 00000000000rtrdsa000010
RT['SRA']='000011'   # SRA rd,rt,sa - rd <- rt >> sa
                    # 00000000000rtrdsa000011
# -------------------------------------------------------------                    
RS={'SRLV':'000110'}  # SRLV rd(5),rt(5),rs(5) - rd <- rt>>rs
                    # 000000rsrtrd00000000110
RS['SRAV']='000111'  # SRAV rd,rt,rs - rd <- rt << rs
                    # 000000rsrtrd00000000111
RS['ADD']='100000'   # ADD rd,rs,rt - rd <- rs + rt
                    # 000000rsrtrd00000100000
RS['SLLV']='000100'  # SLLV rd,rs,rt
                    # 000000rsrtrd00000000100   
RS['ADDU']='100001'  # ADDU rd,rs,rt - rd <- rs + rt
                    # 000000rsrtrd00000100001
RS['SUB']='100010'   # SUB rd,rs,rt
                    # 000000rsrtrd00000100010
RS['SUBU']='100011'  # SUBU rd,rs,rt
                    # 000000rsrtrd00000100011
RS['AND']='100100'   # AND rd,rs,rt - rd <- rs & rt
                    # 000000rsrtrd00000100100
RS['OR']='100101'    # OR rd,rs,rt - rd <- rs OR rt
                    # 000000rsrtrd00000100101
RS['XOR']='100110'   # XOR rd,rs,rt
                    # 000000rsrtrd00000100110
RS['NOR']='100111'   # NOR rd,rs,rt - rd <- rs NOR rt
                    # 000000rsrtrd00000100111
RS['SLT']='101010'   # SLT rd,rs,rt
                    # 000000rsrtrd00000101010
RS['SLTU']='101011'  # SLTU rd,rs,rt
                    # 000000rsrtrd00000101011
    
# ------------------------------------------------------------------
# Instrucciones tipo I
# ------------------------------------------------------------------
I1 = {'LB':'100000'} # LB rt,offset(base)
                    # 100000basertoffset
I1['LH']='100001'    # LH rt,offset(base)
                    # 100001basertoffset

I1['LW']='100011'    # LW rt,offset(base)
                    # 100011basertoffset
I1['LWU']='100111'   # LWU rt,offset(base)
                    # 100111basertoffset
I1['LBU']='100100'   # LBU rt,offset(base)
                    # 100100basertoffset
I1['LHU']='100101'   # LHU rt,offset(base)
                    # 100101basertoffset
I1['SB']='101000'    # SB rt,offset(base)
                    # 101000basertoffset
I1['SH']='101001'    # SH rt,offset(base)
                    # 101001basertoffset
I1['SW']='101011'    # SW rt,offset(base)
                    # 101011basertoffset

# ------------------------------------------------------------------   
I2={'ADDI':'001000'}  # ADDI rt,rs,inmediate
                    # 001000rsrtinmediate
I2['ADDIU']='001001' # ADDIU rt,rs,inmediate
                    # 001001rsrtinmediate
I2['ANDI']='001100'  # ANDI rt,rs,inmediate - rt <- rs & inmediate
                    # 001100rtrsinmediate
I2['ORI']='001101'   # ORI rt,rs,inmediate
                    # 001101rsrtinmediate
I2['XORI']='001110'  # XORI rt,rs,inmediate
                    # 001110rsrtinmediate
I2['SLTIU']='001011' # SLTIU rt,rs,inmediate
                    # 001011rsrtinmediate
I2['SLTI']='001010'  # SLTI rt,rs,inmediate
                    # 001010rsrtinmediate
#-------------------------------------------------------------------
I3={'LUI':'001111'}   # LUI rt,inmediate
                    # 00111100000rtinmediate
#-------------------------------------------------------------------    

I4={'BEQ':'000100'}   # BEQ rs,rt,offset
                    # 000100rsrtoffset
I4['BNE']='000101'   # BNE rs,rt,offset
                    # 000101rsrtoffset
# -----------------------------------------------------------------
I5={'J':'000010'}     # J target
                    # 000010target
I5['JAL']='000011'   # JAL target
                    # 000011target

# -----------------------------------------------------------------
# Instrucciones J
# -----------------------------------------------------------------
J1={'JR':'001000'}   # JR rs
                    # 000000rs000000000000000001000
    
J2={'JALR':'001001'}  # JALR rd,rs
                    # 000000rs00000rd00000001001
# ------------------------------------------------------------------
NOP={'NOP':'111111'}

################################
# Manejo de entrada del archivo
################################

if(len(sys.argv) == 2):
	try:    
    		archivo = open(sys.argv[1],'r')
    		print '[Parser] Archivo abierto correctamente'
	except:
		print '[Parser] Error: No se puede abrir el archivo', sys.argv[1]
		exit
elif(len(sys.argv) == 1):
	print 'ingrese el nombre del archivo a compilar'
	archivo = raw_input()
	try:    
    		archivo = open(archivo,'r')
    		print '[Parser] Archivo abierto correctamente'
	except:
		print '[Parser] Error: No se puede abrir el archivo', sys.argv[1]
		exit
#####################################
# Fin de manejo de entrada de archivo
#####################################

separadores=['\n','\t',' '] # Separadores de linea 

i = 1    # Para obtener el numero de linea por si hay error de sintaxis

#################################################
# Abro el archivo para sobreescribirlo si existe
#################################################

compilado = open("a.coe","w")
compilado.write("memory_initialization_radix=2;\nmemory_initialization_vector=\n")
compilado.close()

##########################################
# Localizar en el archivo tags para saltos
##########################################
tag={'init':'0'}
lineNbr = 0
linea = archivo.readline()
nroTags = 0
while linea != "":
	linea=linea.split(";")[0]  # Toma la linea y la divide en un array con ';' como delimitador, el primero siempre es el codigo.
	if ":" in linea:
		tag[linea.split(':')[0]] = str(lineNbr-nroTags)
		nroTags = nroTags + 1
	lineNbr=lineNbr+1
	linea = archivo.readline()
	
############################################

archivo.seek(0) # Vuelvo el puntero del archivo al principio

#####################################
# Comienzo el parseo de instrucciones
#####################################
linea = archivo.readline()
while linea != "":
    	if not linea: break
    	linea=linea.split(";")[0]  # Toma la linea y la divide en un array con ';' como delimitador, el primero siempre es el codigo.
    	while True:
        	try:
            		linea.remove('')
			print linea
        	except:
            		break
    
    	linea=''.join(linea)
  	
    	i = 0
    	linea=linea.replace(")"," ")
    	linea=linea.replace("("," ")
	linea=linea.replace(","," ")
	linea=linea.replace('$','')
	# En este punto estan eliminados todos los corchetes y comas que hay en la linea
    	
    	for sep in separadores:
        	linea = ''.join(linea)
        	linea=linea.split(sep)
        	while True:
        		try:
                		linea.remove('')
            		except:
                		break
	while True:
        	try:
            		linea.remove('')
        	except:
            		break
	i+=1

    	compilado = open("a.coe","a")
    
    	if len(linea)!=0:
		
		# Comienza preguntando si es una instruccion tipo RT
        	if(linea[0].upper() in RT):
            		if(len(linea)==4):
                		compilado.write("00000000000")
                		compilado.write(bin(int(linea[2]))[2:].zfill(5))
                		compilado.write(bin(int(linea[1]))[2:].zfill(5))
                		compilado.write(bin(int(linea[3]))[2:].zfill(5))
                		compilado.write(RS[linea[0]])
                		compilado.write(",\n")
            		else:
                		print "Error linea", i

        	elif(linea[0].upper() in RS):
            		if(len(linea)==4):
               			compilado.write("000000")
                		compilado.write(bin(int(linea[2]))[2:].zfill(5))
				compilado.write(bin(int(linea[3]))[2:].zfill(5))                
				compilado.write(bin(int(linea[1]))[2:].zfill(5))
                		compilado.write("00000")
                		compilado.write(RS[linea[0]])
                		compilado.write(",\n")
            		else:
                		print "Error linea", i
        	elif(linea[0].upper() in I1):
            		if(len(linea)==4):
                		compilado.write(I1[linea[0]])
                		compilado.write(bin(int(linea[3]))[2:].zfill(5))
                		compilado.write(bin(int(linea[1]))[2:].zfill(5))
		       		compilado.write(bin(int(linea[2]))[2:].zfill(16))                
		       		compilado.write(",\n")
			else:
		       		print "Error linea", i
		elif(linea[0].upper() in I2):
			if(len(linea)==4):
				compilado.write(I2[linea[0]])
			        compilado.write(bin(int(linea[2]))[2:].zfill(5))
			        compilado.write(bin(int(linea[1]))[2:].zfill(5))
			        compilado.write(bin(int(linea[3]))[2:].zfill(16))                
			        compilado.write(",\n")
			else:
				print "Error linea", i
			        print linea
		elif(linea[0].upper() in I3):
			if(len(linea)==3):
				compilado.write(I3[linea[0]])
			        compilado.write("00000")
			        compilado.write(bin(int(linea[1]))[2:].zfill(5))
			        compilado.write(bin(int(linea[2]))[2:].zfill(16))                
			        compilado.write(",\n")
			else:
			        print "Error linea", i
		        	print linea
######################## branches 
		elif(linea[0].upper() in I4): 
			if(len(linea)==4):
			        compilado.write(I4[linea[0]])
			        compilado.write(bin(int(linea[1]))[2:].zfill(5))
			        compilado.write(bin(int(linea[2]))[2:].zfill(5))
			        compilado.write(bin(int(linea[3]))[2:].zfill(16))				
			        compilado.write(",\n")
			else:
		        	print "Error linea", i
		        	print linea
		elif(linea[0].upper() in I5): # Esta es la instruccion de salto y se usa el diccionario tag para reemplazar el valor del nombre con el numero de linea
			if(len(linea)==2):
		        	compilado.write(I5[linea[0]])		
		        	compilado.write(bin(int(tag[linea[1]]))[2:].zfill(26))
		        	compilado.write(",\n")
		    	else:
		        	print "Error linea", i
		        	print linea
		elif(linea[0].upper() in J1):
			if(len(linea)==2):
			        compilado.write("000000")
			        compilado.write(bin(int(linea[1]))[2:].zfill(5))
			        compilado.write("000000000000000")
			        compilado.write(J1[linea[0]])
			        compilado.write(",\n")
			else:
			        print "Error linea", i
			        print linea
		elif(linea[0].upper() in J2):
			if(len(linea)==3):
			        compilado.write("000000")
			        compilado.write(bin(int(linea[2]))[2:].zfill(5))
			        compilado.write("00000")
			        compilado.write(bin(int(linea[1]))[2:].zfill(5))
			        compilado.write("00000")
			        compilado.write(J2[linea[0]])
			        compilado.write(",\n")
			else:
			        print "Error linea", i
			        print linea           
	    	compilado.close()
	linea = archivo.readline()		 
	    
compilado = open("a.coe","r")
a = compilado.read()
l = len(a)
compilado.close()

compilado = open("a.coe","w")
compilado.write(a[0:l-2])
compilado.write(";\n")
compilado.close()



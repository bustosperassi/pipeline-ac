#!/usr/bin/python


import gtk
import pygtk
import serial
    
class Ventana:
	def __init__(self):
		self.builder = gtk.Builder()
		self.builder.add_from_file('gui.glade')
		self.builder.connect_signals(self)
		self.programCounter = self.builder.get_object("entry1")
		self.nextProgramCounter = self.builder.get_object("entry2")
		self.instruccion = self.builder.get_object("entry3")
		self.reg = list()
		self.bytes = list()
		self.reg.append(self.builder.get_object("entry7"))
		self.reg.append(self.builder.get_object("entry8"))
		self.reg.append(self.builder.get_object("entry9"))
		self.reg.append(self.builder.get_object("entry10"))
		self.reg.append(self.builder.get_object("entry11"))
		self.reg.append(self.builder.get_object("entry12"))
		self.reg.append(self.builder.get_object("entry13"))
		self.reg.append(self.builder.get_object("entry14"))
		self.reg.append(self.builder.get_object("entry15"))
		self.reg.append(self.builder.get_object("entry16"))
		self.reg.append(self.builder.get_object("entry17"))
		self.reg.append(self.builder.get_object("entry18"))
		self.reg.append(self.builder.get_object("entry19"))
		self.reg.append(self.builder.get_object("entry20"))
		self.reg.append(self.builder.get_object("entry21"))
		self.reg.append(self.builder.get_object("entry22"))
		self.reg.append(self.builder.get_object("entry23"))
		self.reg.append(self.builder.get_object("entry24"))
		self.reg.append(self.builder.get_object("entry25"))
		self.reg.append(self.builder.get_object("entry26"))
		self.reg.append(self.builder.get_object("entry27"))
		self.reg.append(self.builder.get_object("entry28"))
		self.reg.append(self.builder.get_object("entry29"))
		self.reg.append(self.builder.get_object("entry30"))
		self.reg.append(self.builder.get_object("entry31"))
		self.reg.append(self.builder.get_object("entry32"))
		self.reg.append(self.builder.get_object("entry33"))
		self.reg.append(self.builder.get_object("entry34"))
		self.reg.append(self.builder.get_object("entry35"))
		self.reg.append(self.builder.get_object("entry36"))
		self.reg.append(self.builder.get_object("entry37"))
		self.reg.append(self.builder.get_object("entry38"))
		self.aluText = self.builder.get_object("entry4")
		self.datosText = self.builder.get_object("entry5")
		self.regDst = self.builder.get_object("entry6")
		self.aluOp = self.builder.get_object("entry39")
		self.regDstWrite = self.builder.get_object("entry40")
		self.aluSrc = self.builder.get_object("entry41")
		self.writeMem = self.builder.get_object("entry42")
		self.writeReg = self.builder.get_object("entry43")
		self.memToReg = self.builder.get_object("entry44")
		self.iterSerial =self.builder.get_object("entry45")
		self.data1 = self.builder.get_object("entry58")
		self.data2 = self.builder.get_object("entry59")
		self.signExtended = self.builder.get_object("entry60")
		self.regOut1 = self.builder.get_object("entry61")
		self.regOut2 = self.builder.get_object("entry62")
		self.Rs = self.builder.get_object("entry63")
		self.Rt = self.builder.get_object("entry64")
		self.toReg = self.builder.get_object("entry65")
		self.writeReg2 = self.builder.get_object("entry66")
		self.writeMem2 = self.builder.get_object("entry67")
		self.alu = self.builder.get_object("entry68")
		self.datos2 = self.builder.get_object("entry69")
		self.regDest2 = self.builder.get_object("entry70")

		self.ventanaPrincipal = self.builder.get_object("Pipeline")
		self.ventanaPrincipal.show()

###############################################################################
	def on_step_clicked(self, widget):
		try:
			s = serial.Serial('/dev/ttyUSB0',19200)
		except:
			print "No se puede abrir puerto serie"
		try:
			for i in range(int(self.iterSerial.get_text())):
				s.write("s")		
			self.bytes = []
			i = 172
			while i > 0:	
				try:		
					line = s.read()
					self.bytes.append(line)
				except serial.serialutil.SerialException:
					pass
				i-=1
		except:
			print "pone un numero puto"

		s.close()
		self.fillGui()
		pass
###############################################################################

	def fillGui(self):

		self.setTextProgramCounter(str(ord(self.bytes[0])))

		self.setTextInstruccion('{0:08b}'.format(ord(self.bytes[4]),'b')+'{0:08b}'.format(ord(self.bytes[3]),'b')+'{0:08b}'.format(ord(self.bytes[2]),'b')+'{0:08b}'.format(ord(self.bytes[1]),'b'))

		self.setTextNextProgramCounter(str(ord(self.bytes[5])))
		self.Rt.set_text(str(ord(self.bytes[6])))
		self.Rs.set_text(str(ord(self.bytes[7])))
		self.regOut2.set_text(str(ord(self.bytes[8])))
		self.regOut1.set_text(str(ord(self.bytes[9])))
		self.signExtended.set_text(str((ord(self.bytes[13]) << 24)+(ord(self.bytes[12]) << 16)+(ord(self.bytes[11]) << 8)+(ord(self.bytes[10]))))
		self.data2.set_text(str((ord(self.bytes[17]) << 24)+(ord(self.bytes[16]) << 16)+(ord(self.bytes[15]) << 8)+(ord(self.bytes[14]))))
		self.data1.set_text(str((ord(self.bytes[21]) << 24)+(ord(self.bytes[20]) << 16)+(ord(self.bytes[19]) << 8)+(ord(self.bytes[18]))))
		self.regDstWrite.set_text("True" if (ord(self.bytes[22]) & 16)  else "False")
		self.aluSrc.set_text("True" if (ord(self.bytes[22]) & 8)  else "False")
		self.writeMem.set_text("True" if (ord(self.bytes[22]) & 4)  else "False")
		self.writeReg.set_text("True" if (ord(self.bytes[22]) & 2)  else "False")
		self.memToReg.set_text("True" if (ord(self.bytes[22]) & 1)  else "False") #44
		self.aluOp.set_text('{0:08b}'.format(ord(self.bytes[23])))
		self.regDest2.set_text(str(ord(self.bytes[24])))
		self.datos2.set_text(str((ord(self.bytes[28]) << 24)+(ord(self.bytes[27]) << 16)+(ord(self.bytes[26]) << 8)+(ord(self.bytes[25]))))
		self.alu.set_text(str((ord(self.bytes[32]) << 24)+(ord(self.bytes[31]) << 16)+(ord(self.bytes[30]) << 8)+(ord(self.bytes[29]))))
		self.toReg.set_text("True" if (ord(self.bytes[33]) & 4)  else "False")
		self.writeReg2.set_text("True" if (ord(self.bytes[33]) & 2)  else "False")
		self.writeMem2.set_text("True" if (ord(self.bytes[33]) & 1)  else "False")
		self.regDst.set_text(str(ord(self.bytes[34])))
		self.datosText.set_text(str((ord(self.bytes[38]) << 24)+(ord(self.bytes[37]) << 16)+(ord(self.bytes[36]) << 8)+(ord(self.bytes[35]))))
		self.aluText.set_text(str((ord(self.bytes[42]) << 24)+(ord(self.bytes[41]) << 16)+(ord(self.bytes[40]) << 8)+(ord(self.bytes[39])))		)
		#faltan dos senales
		self.setTextReg()

###############################################################################
	def on_Pipeline_destroy(self, object, data=None):
    		gtk.main_quit()
###############################################################################

	def setTextProgramCounter(self, text):
		self.programCounter.set_text(text)
		pass
###############################################################################
	def setTextNextProgramCounter(self, text):
		self.nextProgramCounter.set_text(text)	
###############################################################################
	def setTextInstruccion(self, text):
		self.instruccion.set_text(text)
		pass
###############################################################################
	def setTextReg(self):
		j = 171
		a = 31
		i = 0
		for i in range(32):
			suma = (ord(self.bytes[j]) << 24)+(ord(self.bytes[j-1]) << 16)+(ord(self.bytes[j-2]) << 8)+(ord(self.bytes[j-3]))
			self.reg[a].set_text(str(suma))
			j-=4			
			a-=1
		pass
###############################################################################
	def on_rst_clicked(self, widget):
		try:
			s = serial.Serial('/dev/ttyUSB0',19200)
		except:
			print "No se puede abrir puerto serie"
		s.write("r")
		s.close()							
		pass
###############################################################################
	def on_continuo_clicked(self, widget):
			try:
				s = serial.Serial('/dev/ttyUSB0',19200)
			except:
				print "No se puede abrir puerto serie"
			s.write("c")
			self.bytes = []
			i = 172
			while i > 0:	
				try:		
					line = s.read()
					self.bytes.append(line)
				except serial.serialutil.SerialException:
					pass
				i-=1
			s.close()
			self.fillGui()

if __name__ == "__main__":
    	main = Ventana()
  	gtk.main()



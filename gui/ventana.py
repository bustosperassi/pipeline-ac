
import gtk
import pygtk
    
class Ventana:
	def __init__(self):
		self.builder = gtk.Builder()
		self.builder.add_from_file('gui.glade');
		self.builder.connect_signals(self)
		self.ventanaPrincipal = self.builder.get_object("Pipeline")
		self.ventanaPrincipal.show()

	def on_Pipeline_destroy(self, object, data=None):
    		gtk.main_quit()

if __name__ == "__main__":
    	main = Ventana()
  	gtk.main()

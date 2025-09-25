#!/usr/bin/env python3

import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk, GLib
import subprocess

class UpdateApp(Gtk.Application):
    def __init__(self):
        super().__init__(application_id="com.tuxos.update")

    def do_activate(self):
        self.show_password_dialog()

    def show_password_dialog(self):
        dialog = Gtk.MessageDialog(
            transient_for=self.get_active_window(),
            modal=True,
            buttons=Gtk.ButtonsType.OK_CANCEL,
            message_type=Gtk.MessageType.QUESTION,
            text="Atualizador de Programas do TuxOS"
        )
        dialog.format_secondary_text("Digite sua senha para continuar:")
        
        entry = Gtk.Entry()
        entry.set_visibility(False)
        entry.set_has_frame(True)
        entry.set_max_length(50)
        
        # Anexa o campo de senha ao diálogo
        box = dialog.get_content_area()
        box.add(entry)
        
        dialog.show_all()
        
        response = dialog.run()
        password = entry.get_text()
        
        dialog.destroy()
        
        if response == Gtk.ResponseType.OK:
            self.run_updates(password)
        else:
            self.show_message("Atualização cancelada.")

    def show_message(self, message):
        dialog = Gtk.MessageDialog(
            transient_for=self.get_active_window(),
            modal=True,
            buttons=Gtk.ButtonsType.OK,
            message_type=Gtk.MessageType.INFO,
            text="Atualizador de Programas do TuxOS"
        )
        dialog.format_secondary_text(message)
        dialog.run()
        dialog.destroy()

    def run_updates(self, password):
        # Mensagem de progresso
        self.show_message("Atualizando o sistema, aguarde...")
        
        # Converte a senha para bytes para usar com o subprocess
        password_bytes = password.encode('utf-8')
        
        try:
            # Roda os comandos
            print("Executando: apt update")
            subprocess.run(
                ["sudo", "-S", "apt", "update"], 
                input=password_bytes, 
                check=True
            )
            
            print("Executando: apt upgrade -y")
            subprocess.run(
                ["sudo", "-S", "apt", "upgrade", "-y"],
                input=password_bytes,
                check=True
            )
            
            print("Executando: snap refresh")
            subprocess.run(
                ["sudo", "-S", "snap", "refresh"],
                input=password_bytes,
                check=True
            )
            
            print("Executando: flatpak update -y")
            subprocess.run(
                ["flatpak", "update", "-y"],
                check=True
            )
            
            self.show_message("Atualização concluída com sucesso!")
            
        except subprocess.CalledProcessError as e:
            self.show_message(f"Erro na atualização: {e.stderr.decode('utf-8').strip()}")
        except Exception as e:
            self.show_message(f"Ocorreu um erro: {str(e)}")


if __name__ == "__main__":
    app = UpdateApp()
    app.run(None)
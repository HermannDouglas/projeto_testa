from django.contrib import admin
from agenda.models import Compromisso, Local, Convidado


# Register your models here.
admin.site.register(Compromisso)
admin.site.register(Local)
admin.site.register(Convidado)
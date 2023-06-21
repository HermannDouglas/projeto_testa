from django.contrib import admin
from agenda.models import Compromisso, Local, Convidado


# class CompromissoInline(admin.TabularInline):
#     model = Compromisso
#
# class ConvidadoAdmin(admin.ModelAdmin):
#     inlines = [CompromissoInline]

admin.site.register(Compromisso)
admin.site.register(Local)
admin.site.register(Convidado)

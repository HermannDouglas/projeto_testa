from django.db import models


# Create your models here.
class Local(models.Model):
    nome = models.CharField(max_length=255)
    rua = models.CharField(max_length=255)
    numero = models.IntegerField()

    def __str__(self):
        return f'{self.nome} na rua {self.rua}'

    class Meta:
        verbose_name_plural = "Locais"

class Compromisso(models.Model):
    descricao = models.CharField(max_length=255)
    data_inicio = models.DateTimeField(null=True)
    data_fim = models.DateTimeField(null=True)
    local = models.ForeignKey(Local, on_delete=models.CASCADE())

    def __str__(self):
        return f'{self.descricao} começa {self.data_inicio} e termina em {self.data_fim}'

from django.contrib import admin
from apps.produtor.models import Produtor
from apps.coletor.models import Coletor
from apps.coleta.models import Oferta


admin.site.register(Produtor)
admin.site.register(Coletor)
admin.site.register(Oferta)
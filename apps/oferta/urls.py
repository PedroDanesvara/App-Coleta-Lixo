from rest_framework import routers
from apps.oferta.views import OfertaViewSet

router = routers.DefaultRouter()
router.register(r'', OfertaViewSet)

urlpatterns = router.urls
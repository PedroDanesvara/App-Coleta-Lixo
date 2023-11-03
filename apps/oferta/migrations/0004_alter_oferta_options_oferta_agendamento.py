# Generated by Django 4.2.1 on 2023-11-03 04:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('oferta', '0003_alter_oferta_id'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='oferta',
            options={'verbose_name': 'Oferta', 'verbose_name_plural': 'Ofertas'},
        ),
        migrations.AddField(
            model_name='oferta',
            name='agendamento',
            field=models.CharField(default=1, help_text='Data e Horário agendados', max_length=30),
            preserve_default=False,
        ),
    ]
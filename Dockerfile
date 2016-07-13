# Preare the system and install Python tools:
FROM python
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN pip install virtualenv
# Create a virtual environment:
RUN virtualenv mezzanine_env
WORKDIR mezzanine_env    
RUN source bin/activate
RUN pip install mezzanine==4.1.0

# Create a Mezzanine project:
RUN mezzanine-project mezzanine_app
WORKDIR mezzanine_app
RUN python manage.py createdb --noinput

# Run the testing server:
CMD python manage.py runserver 0.0.0.0:8000

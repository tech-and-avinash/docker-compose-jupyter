FROM jupyter/base-notebook:latest

USER root

# Copy the entrypoint script
COPY generate_password.sh /usr/local/bin/generate_password.sh
RUN chmod +x /usr/local/bin/generate_password.sh

USER $NB_UID

ENTRYPOINT ["generate_password.sh"]
CMD ["start-notebook.sh"]

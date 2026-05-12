FROM archlinux:latest

RUN pacman -Syu --noconfirm sudo

RUN useradd -m -G wheel -s /bin/sh developer

RUN echo "developer ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer

USER developer
WORKDIR /home/developer

COPY --chown=developer:developer . .dotfiles/

RUN chmod +x .dotfiles/install.sh \
             .dotfiles/scripts/arch-installer

# 7. Use the correct path for CMD
CMD ["/home/developer/.dotfiles/install.sh"]

Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 0/2] TTY: add rpmsg tty driver
Date: Thu, 21 Mar 2019 16:47:17 +0100
Message-ID: <1553183239-13253-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch set introduces a TTY console on top of the RPMsg framework
which enables the following use cases:
- Provide a console to communicate easily with the remote processor
  application.
- Provide an interface to get the remote processor log traces without
  ring buffer limitation.
- Ease the migration from MPU + MCU processors to multi core processors
  (MPU and MCU integrated in one processor)

An alternative of this proposed solution would consist in using the virtio
console : the drawback with that solution is that it requires a specific
virtio buffer (in addition to the one already used for RPMsg) which does
not fit with remote processors with little memory.
The proposed solution allows to multiplex the console with the other rpmsg
services, optimizing the memory.

The first patch adds an API to the rpmsg framework ('get buffer size') and
the second one is the rpmsg tty driver itself.

Fabien Dessenne (2):
  rpmsg: core: add possibility to get message payload length
  tty: add rpmsg driver

 drivers/rpmsg/rpmsg_core.c       |  20 +++
 drivers/rpmsg/rpmsg_internal.h   |   2 +
 drivers/rpmsg/virtio_rpmsg_bus.c |  11 ++
 drivers/tty/Kconfig              |   9 ++
 drivers/tty/Makefile             |   1 +
 drivers/tty/rpmsg_tty.c          | 309 +++++++++++++++++++++++++++++++++++++++
 include/linux/rpmsg.h            |  10 ++
 7 files changed, 362 insertions(+)
 create mode 100644 drivers/tty/rpmsg_tty.c

-- 
2.7.4

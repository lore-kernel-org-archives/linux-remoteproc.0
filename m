Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH v2 0/2] TTY: add rpmsg tty driver
Date: Fri, 10 May 2019 17:02:55 +0200
Message-ID: <1557500577-22366-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, xiang xiao <xiaoxiang781216@gmail.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: arnaud.pouliquen@st.com, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch set introduces a TTY console on top of the RPMsg framework which
enables the following use cases:
- Provide a console to communicate easily with the remote processor
  application.
- Provide an interface to get the remote processor log traces without
  ring buffer limitation.
- Ease the migration from MPU + MCU processors to multi core processors
  (MPU and MCU integrated in one processor)

An alternative of this proposed solution would consist in using the virtio
console:
The drawback with that solution is that it requires a specific virtio buffer
(in addition to the one already used for RPMsg) which does not fit with remote
processors with little memory. The proposed solution allows to multiplex the
console with the other rpmsg services, optimizing the memory.

The first patch adds an API to the rpmsg framework ('get buffer size') and the
second one is the rpmsg tty driver itself.

History:
-V1 to V2:
	- modify message structure to allow to data transmission but also
	flow control
	- add documentation file to describe message structure for remote
	  implementation. 
	- add dtr/rts management
	- disable termios modes that generates non optimized behavior on RPMsg
	  transfers
	- replace rpmsg_send by rpmsg_trysend to not block the write
	- suppress useless spinlock on read.
	- miscellaneous fixes to improve robustness

Arnaud Pouliquen (2):
  rpmsg: core: add possibility to get message payload length
  tty: add rpmsg driver

 Documentation/serial/tty_rpmsg.txt |  38 +++
 drivers/rpmsg/rpmsg_core.c         |  20 ++
 drivers/rpmsg/rpmsg_internal.h     |   2 +
 drivers/rpmsg/virtio_rpmsg_bus.c   |  11 +
 drivers/tty/Kconfig                |   9 +
 drivers/tty/Makefile               |   1 +
 drivers/tty/rpmsg_tty.c            | 479 +++++++++++++++++++++++++++++++++++++
 include/linux/rpmsg.h              |  10 +
 8 files changed, 570 insertions(+)
 create mode 100644 Documentation/serial/tty_rpmsg.txt
 create mode 100644 drivers/tty/rpmsg_tty.c

-- 
2.7.4

Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 22 Feb 2017 04:10:18 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.11
Message-ID: <20170222121018.GA22990@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 49def1853334396f948dcb4cedb9347abb318df5:

  Linux 4.10-rc4 (2017-01-15 16:21:59 -0800)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.11

for you to fetch changes up to fa04b769f2832bf1aeb2e04b8865f6b688a752fd:

  rpmsg: rpmsg_create_ept() returns NULL on error (2017-02-13 00:52:54 -0800)

----------------------------------------------------------------
rpmsg updates for v4.11

This introduces an interface for user space to directly communicate on
rpmsg endpoints without the implementation of specific kernel drivers,
which is useful for e.g. debug channels.

----------------------------------------------------------------
Arnd Bergmann (1):
      rpmsg: char: add CONFIG_NET dependency

Bjorn Andersson (7):
      rpmsg: qcom_smd: Add support for "label" property
      rpmsg: Introduce "poll" to endpoint ops
      rpmsg: qcom_smd: Implement endpoint "poll"
      rpmsg: Driver for user space endpoint interface
      rpmsg: smd: Register rpmsg user space interface for edges
      rpmsg: qcom: smd: Return positively when not enabled
      rpmsg: rpmsg_create_ept() returns NULL on error

Dan Carpenter (1):
      rpmsg: unlock on error in rpmsg_eptdev_read()

 Documentation/ioctl/ioctl-number.txt |   1 +
 drivers/rpmsg/Kconfig                |   9 +
 drivers/rpmsg/Makefile               |   1 +
 drivers/rpmsg/qcom_smd.c             |  58 ++++
 drivers/rpmsg/rpmsg_char.c           | 584 +++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_core.c           |  22 +-
 drivers/rpmsg/rpmsg_internal.h       |  18 ++
 include/linux/rpmsg.h                |  13 +
 include/linux/rpmsg/qcom_smd.h       |   6 +-
 include/uapi/linux/rpmsg.h           |  35 +++
 10 files changed, 742 insertions(+), 5 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.c
 create mode 100644 include/uapi/linux/rpmsg.h

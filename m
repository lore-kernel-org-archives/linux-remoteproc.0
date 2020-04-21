Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 0/2] Add character device interface to remoteproc
Date: Tue, 21 Apr 2020 11:10:16 -0700
Message-Id: <1587492618-15896-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, ohad@wizery.com, tsoni@codeaurora.org, psodagud@codeaurora.org, sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series adds a character device interface to remoteproc
framework. Currently there is only a sysfs interface which the userspace
clients can use. If a usersapce application crashes after booting
the remote processor through the sysfs interface the remote processor
does not get any indication about the crash. It might still assume
that the  application is running.
For example modem uses remotefs service to data from disk/flash memory.
If the remotefs service crashes, modem still keeps on requesting data
which might lead to crash on modem. Even if the service is restarted the
file handles modem requested previously would become stale.
Adding a character device interface makes the remote processor tightly
coupled with the user space application. A crash of the application
leads to a close on the file descriptors therefore shutting down the
remoteproc.

Changelog:

v2 -> v3:
- Move booting of remoteproc from open to a write call.
- Add ioctl interface for future functionality extension.
- Add an ioctl call to default to rproc shutdown on release.

v2 -> v1:
- Fixed comments from Bjorn and Matthew.

Rishabh Bhatnagar (2):
  remoteproc: Add remoteproc character device interface
  remoteproc: core: Register the character device interface

 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 drivers/remoteproc/Kconfig                         |   9 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/remoteproc_cdev.c               | 142 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_core.c               |  10 ++
 drivers/remoteproc/remoteproc_internal.h           |  21 +++
 include/linux/remoteproc.h                         |   3 +
 include/uapi/linux/remoteproc_cdev.h               |  21 +++
 8 files changed, 208 insertions(+)
 create mode 100644 drivers/remoteproc/remoteproc_cdev.c
 create mode 100644 include/uapi/linux/remoteproc_cdev.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

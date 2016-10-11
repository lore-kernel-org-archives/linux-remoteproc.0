Return-Path: <Matt.Redfearn@imgtec.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 0/4] remoteproc: Add sysfs interface
Date: Tue, 11 Oct 2016 14:39:41 +0100
Message-ID: <1476193185-32107-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Matt
List-ID: <linux-remoteproc@vger.kernel.org>


It is often desireable to boot a remote processor with different
firmware files, depending on the needs of the system at a particular
time. This series adds a sysfs interface to the remoteproc core,
exposing interfaces to manipulate the remote processor. One interface is
the "state" file which performs the same function as the one in debugfs
(which is removed later in the series). The other is a "firmware" file
which allows retrieval of the name of the running firmware, and allows a
new firmware to be loaded when written, as long as the remote processor
is currently stopped.

Some groundwork must be laid first, changing the storage mechanism of
the firmware name such that it can be rewritten easily and then
providing an accessor function to facilitate changing the loaded
firmware. That is then wired up to the new sysfs interface.

This series is based on v4.8



Matt Redfearn (4):
  remoteproc: Use fixed length field for firmware name
  remoteproc: Introduce rproc_change_firmware
  remoteproc: Add a sysfs interface for firmware and state
  remoteproc: debugfs: Remove state entry which is duplicated is sysfs

 Documentation/ABI/testing/sysfs-class-remoteproc |  50 +++++++++
 drivers/remoteproc/Makefile                      |   1 +
 drivers/remoteproc/remoteproc_core.c             | 129 ++++++++++++++++++----
 drivers/remoteproc/remoteproc_debugfs.c          |  71 ------------
 drivers/remoteproc/remoteproc_internal.h         |   6 ++
 drivers/remoteproc/remoteproc_sysfs.c            | 132 +++++++++++++++++++++++
 include/linux/remoteproc.h                       |   4 +-
 7 files changed, 299 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-remoteproc
 create mode 100644 drivers/remoteproc/remoteproc_sysfs.c

-- 
2.7.4

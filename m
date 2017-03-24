Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 00/19] Allow master to restart without restarting slave
Date: Fri, 24 Mar 2017 12:22:16 -0700
Message-ID: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Wendy
List-ID: <linux-remoteproc@vger.kernel.org>


This patch allows remoteproc master to restart without restarting the slave

remoteproc master starts a remote, it will check the following:
* if the remote is running,
  * if yes, it will check if therere is firmware checksum in the rsc table
     * if yes, it will calculate the firmware checksum with the loadable
       firmware sections, and compare the one in the rsc table
       * if the checksum matches, remtoeproc thinks it is already running
         the firmware, and it will not reboot the remote. However, it will
         set the virtio status to request virtio remotepro reset. The
         remote should reset virtio related when it sees the virtio status
         shows the master requested reset.

* if the remote is running, but not running the expected firmware, it will
  stop the remote and then boot it.

* if the remote is not running, it will load the firmware and start the
  remote.

Wendy Liang (19):
  remoteproc: Add is_runinng to remoteproc ops
  remtoeproc: Add an operation to check if remote is running
  remoteproc: Add a running independent state
  remoteproc: sysfs: Add running independent state
  remoteproc: check if remote is running the fw before reload fw
  remoteproc: elf loader: Add get checksum firmware implementation
  remoteproc: Add firmware checksum resource entry
  remoteproc: add a function to set fw checksum rsc
  remoteproc: check firmware checksum in rproc_is_running_fw()
  remoteproc: Add rproc resource with id struct
  remoteproc: Add rproc_idr_alloc/remove wrapper
  remoteproc: use rproc_id_rsc for data got from idr_find()
  remoteproc: add config_wait_complete to rproc_vdev
  remoteproc virtio: handle rproc vdev notification
  remoteproc: virtio: rename rproc_virtio_notify to rproc_vq_notify
  remoteproc: virtio: use rproc_virtio_notify() to notify vdev changes
  remoteproc: virtio: kick in reset virtio
  remoteproc: shutdown: set state to OFFLINE after stopping remote
  remoteproc: virtio: idr_alloc for rvdev

 drivers/remoteproc/Kconfig                 |   1 +
 drivers/remoteproc/remoteproc_core.c       | 251 ++++++++++++++++++++++++-----
 drivers/remoteproc/remoteproc_elf_loader.c | 109 +++++++++++++
 drivers/remoteproc/remoteproc_internal.h   |  32 ++++
 drivers/remoteproc/remoteproc_sysfs.c      |   7 +-
 drivers/remoteproc/remoteproc_virtio.c     | 105 ++++++++++--
 include/linux/remoteproc.h                 |  24 ++-
 7 files changed, 479 insertions(+), 50 deletions(-)

-- 
1.9.1

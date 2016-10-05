Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 5 Oct 2016 15:20:28 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.9
Message-ID: <20161005222028.GO7509@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.9

for you to fetch changes up to 395317bbc200fbc164e65cc8ec31fa9d766aeaf1:

  rpmsg: smd: fix dependency on QCOM_SMD=n (2016-09-12 07:05:13 -0700)

----------------------------------------------------------------
rpmsg updates for v4.9

The bulk of these patches involve splitting the rpmsg implementation into a
framework/API part and a virtio specific backend part. It then adds the
Qualcomm Shared Memory Device (SMD) as an additional supported wire format.

Also included is a set of code style cleanups that have been lingering for a
while.

----------------------------------------------------------------
Andrew F. Davis (1):
      rpmsg: remove unneeded conversions to bool

Anna, Suman (5):
      rpmsg: remove pointless OOM prints
      rpmsg: use proper format-specifier for printing dma_addr_t
      rpmsg: align code with open parenthesis
      rpmsg: use dynamic_hex_dump for hex dump traces
      samples/rpmsg: add support for multiple instances

Arnd Bergmann (1):
      rpmsg: smd: fix dependency on QCOM_SMD=n

Bjorn Andersson (18):
      rpmsg: Drop prototypes for non-existing functions
      rpmsg: Enable matching devices with drivers based on DT
      rpmsg: Name rpmsg devices based on channel id
      rpmsg: rpmsg_send() operations takes rpmsg_endpoint
      rpmsg: Make rpmsg_create_ept() take channel_info struct
      rpmsg: Clean up rpmsg device vs channel naming
      rpmsg: Introduce indirection table for rpmsg_device operations
      rpmsg: Move rpmsg_device API to new file
      rpmsg: Indirection table for rpmsg_endpoint operations
      rpmsg: Move endpoint related interface to rpmsg core
      rpmsg: Move helper for finding rpmsg devices to core
      rpmsg: Split off generic tail of create_channel()
      rpmsg: Split rpmsg core and virtio backend
      rpmsg: Hide rpmsg indirection tables
      rpmsg: virtio: Hide vrp pointer from the public API
      rpmsg: Move virtio specifics from public header
      rpmsg: Allow callback to return errors
      rpmsg: Introduce Qualcomm SMD backend

Lee Jones (1):
      rpmsg: virtio_rpmsg_bus: Fix randomly placed semi-colon

 drivers/remoteproc/Kconfig          |    4 +-
 drivers/rpmsg/Kconfig               |   14 +
 drivers/rpmsg/Makefile              |    4 +-
 drivers/rpmsg/qcom_smd.c            | 1434 +++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_core.c          |  498 ++++++++++++
 drivers/rpmsg/rpmsg_internal.h      |   82 ++
 drivers/rpmsg/virtio_rpmsg_bus.c    |  541 ++++++-------
 include/linux/rpmsg.h               |  248 +-----
 samples/rpmsg/rpmsg_client_sample.c |   32 +-
 9 files changed, 2308 insertions(+), 549 deletions(-)
 create mode 100644 drivers/rpmsg/qcom_smd.c
 create mode 100644 drivers/rpmsg/rpmsg_core.c
 create mode 100644 drivers/rpmsg/rpmsg_internal.h

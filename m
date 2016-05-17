Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 16 May 2016 17:23:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.7
Message-ID: <20160517002322.GL1256@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 9735a22799b9214d17d3c231fe377fc852f042e9:

  Linux 4.6-rc2 (2016-04-03 09:09:40 -0500)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.7

for you to fetch changes up to b4f78259d593858feb85e02c195cf374f932feef:

  rpmsg: use module_rpmsg_driver in existing drivers and examples (2016-05-06 11:09:01 -0700)

----------------------------------------------------------------
rpmsg updates for v4.7

Refactor rpmsg module registration to follow other subsystems; by
introduction of module_rpmsg_driver and hiding of THIS_MODULE from
clients.

----------------------------------------------------------------
Andrew F. Davis (4):
      rpmsg: add THIS_MODULE to rpmsg_driver in rpmsg core
      rpmsg: drop owner assignment from rpmsg_drivers
      rpmsg: add helper macro module_rpmsg_driver
      rpmsg: use module_rpmsg_driver in existing drivers and examples

 Documentation/rpmsg.txt             | 14 +-------------
 drivers/rpmsg/virtio_rpmsg_bus.c    |  8 +++++---
 include/linux/rpmsg.h               | 18 +++++++++++++++++-
 samples/rpmsg/rpmsg_client_sample.c | 14 +-------------
 4 files changed, 24 insertions(+), 30 deletions(-)

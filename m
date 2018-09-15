Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/5] remoteproc sysfs fixes/improvements
Date: Fri, 14 Sep 2018 19:37:20 -0500
Message-ID: <20180915003725.17549-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

The following series includes couple of fixes and improvements
associated with the sysfs interfaces. Patches are based on top
of 4.19-rc1. The first 3 patches are independent of each other.

Following is the patch summary:
 - Patch 1 fixes an issue with unbalanced sysfs start/stop
   and module removal
 - Patch 2 adds a minor additional check on firmware name
   being echoed into the sysfs file
 - Patch 3 is a minor kerneldoc fix.
 - Patches 4 and 5 introduce a new request denial to sysfs
   interfaces to not allow userspace to meddle with a remoteproc
   client driven boot flow, and usage of it by Wkup M3 remoteproc
   driver

regards
Suman

Suman Anna (5):
  remoteproc: Fix unbalanced boot with sysfs for no auto-boot rprocs
  remoteproc: Check for NULL firmwares in sysfs interface
  remoteproc: Add missing kernel-doc comment for auto-boot
  remoteproc: Introduce deny_sysfs_ops flag
  remoteproc/wkup_m3: Set deny_sysfs_ops flag

 drivers/remoteproc/remoteproc_sysfs.c | 29 ++++++++++++++++++++++++++-
 drivers/remoteproc/wkup_m3_rproc.c    |  1 +
 include/linux/remoteproc.h            |  3 +++
 3 files changed, 32 insertions(+), 1 deletion(-)

-- 
2.18.0

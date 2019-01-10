Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 0/7] remoteproc: Fixes for memoy carveout management
Date: Thu, 10 Jan 2019 14:49:04 +0100
Message-ID: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

These patches fix the comments sent on remoteproc mailing
list after acceptation of memory carveout patch series [1].

In few words, series corrects:
- memory carveout allocation for rproc without iommu
- rproc_da_to_va and trace buffer access to take into account
  late carveout allocation
- resource table cast by adding warning messages

Regards,
Loic

[1] https://lkml.org/lkml/2018/7/27/612

---
Changes from v1:
- Modify way to notify resource table cast issue
- Complete trace buffer patch


Loic Pallardy (7):
  remoteproc: correct rproc_mem_entry_init() comments
  remoteproc: fix rproc_da_to_va in case of unallocated carveout
  remoteproc: fix rproc_alloc_carveout() bad variable cast
  remoteproc: add warning on resource table cast
  remoteproc: fix rproc_alloc_carveout() for rproc with iommu domain
  remoteproc: fix trace buffer va initialization
  remoteproc: fix rproc_check_carveout_da() returned error and comments

 drivers/remoteproc/remoteproc_core.c     | 108 ++++++++++++++++++-------------
 drivers/remoteproc/remoteproc_debugfs.c  |  21 ++++--
 drivers/remoteproc/remoteproc_internal.h |   9 ++-
 3 files changed, 89 insertions(+), 49 deletions(-)

-- 
2.7.4

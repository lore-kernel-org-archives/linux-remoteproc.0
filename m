Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/8] Remoteproc cleanups
Date: Fri,  5 Jan 2018 15:57:57 -0800
Message-Id: <20180105235805.9948-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The first patch removes code that became unnecessary when the recovery flow was
redesigned.

The following patches moves the assignment of cached_table to the resource
table loader, rather than core code, which allows this to made optional and
finally drops the various dummy resource tables provided by drivers.

Then finally the last patch ensures that table_ptr isn't left pointing into
memory of a stopped remoteproc.

Bjorn Andersson (8):
  remoteproc: Remove depricated crash completion
  remoteproc: Cache resource table size
  remoteproc: Clone rproc_ops in rproc_alloc()
  remoteproc: Merge rproc_ops and rproc_fw_ops
  remoteproc: Don't handle empty resource table
  remoteproc: Move resource table load logic to find
  remoteproc: Drop dangling find_rsc_table dummies
  remoteproc: Reset table_ptr on stop

 drivers/remoteproc/qcom_adsp_pil.c         |  8 +--
 drivers/remoteproc/qcom_common.c           | 19 -------
 drivers/remoteproc/qcom_common.h           |  4 --
 drivers/remoteproc/qcom_q6v5_pil.c         | 18 +------
 drivers/remoteproc/qcom_wcnss.c            |  8 +--
 drivers/remoteproc/remoteproc_core.c       | 83 ++++++++++++------------------
 drivers/remoteproc/remoteproc_elf_loader.c | 59 ++++++++++-----------
 drivers/remoteproc/remoteproc_internal.h   | 57 +++++++-------------
 drivers/remoteproc/st_slim_rproc.c         | 32 ++----------
 include/linux/remoteproc.h                 | 21 ++++++--
 10 files changed, 106 insertions(+), 203 deletions(-)

-- 
2.15.0

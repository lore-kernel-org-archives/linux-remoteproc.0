Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 0/4] remoteproc: Panic handling
Date: Mon, 23 Mar 2020 22:29:00 -0700
Message-Id: <20200324052904.738594-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for invoking a panic handler in remoteproc drivers, to allow them
to invoke e.g. cache flushing on the remote processors in response to a kernel
panic - to aid in post mortem debugging of system issues.

Bjorn Andersson (4):
  remoteproc: Traverse rproc_list under RCU read lock
  remoteproc: Introduce "panic" callback in ops
  remoteproc: qcom: q6v5: Add common panic handler
  remoteproc: qcom: Introduce panic handler for PAS and ADSP

 drivers/remoteproc/qcom_q6v5.c       | 20 ++++++++++
 drivers/remoteproc/qcom_q6v5.h       |  1 +
 drivers/remoteproc/qcom_q6v5_adsp.c  |  8 ++++
 drivers/remoteproc/qcom_q6v5_pas.c   |  8 ++++
 drivers/remoteproc/remoteproc_core.c | 57 +++++++++++++++++++++++++---
 include/linux/remoteproc.h           |  3 ++
 6 files changed, 92 insertions(+), 5 deletions(-)

-- 
2.24.0

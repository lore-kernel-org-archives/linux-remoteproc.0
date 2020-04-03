Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
From: Alex Elder <elder@linaro.org>
Subject: [PATCH 0/3] remoteproc: bug fixes
Date: Fri,  3 Apr 2020 12:50:02 -0500
Message-Id: <20200403175005.17130-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This series fixes some bugs in remoteproc error paths.  The last
patch is derived from something I posted before, but has been
updated to based on Linus' current master branch.

					-Alex

Alex Elder (3):
  remoteproc: fix a bug in rproc_alloc()
  remoteproc: qcom_q6v5_mss: fix a bug in q6v5_probe()
  remoteproc: qcom_q6v5_mss: fix q6v5_probe() error paths

 drivers/remoteproc/qcom_q6v5_mss.c   | 33 +++++++++++++++++-----------
 drivers/remoteproc/remoteproc_core.c |  4 ++--
 2 files changed, 22 insertions(+), 15 deletions(-)

-- 
2.20.1

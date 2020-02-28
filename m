Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
From: Alex Elder <elder@linaro.org>
Subject: [PATCH 0/4] remoteproc: some bug fixes
Date: Fri, 28 Feb 2020 12:33:55 -0600
Message-Id: <20200228183359.16229-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This series fixes some bugs in the remoteproc code.
  - The first patch moves some checks of the remoteproc state inside
    the protection of the mutex.
  - The second just eliminates an unsafe state check before calling
    a function, because the function will make the same check safely.
  - The third does proper recovery in the q6v5_probe() error path.
  - The last returns EINVAL if an unrecognized value is written
    into the "recovery" debugfs file.

This series is available (based on v5.6-rc3) in branch "remoteproc-v1"
in this git repository:
  https://git.linaro.org/people/alex.elder/linux.git

					-Alex

Alex Elder (4):
  remoteproc: re-check state in rproc_trigger_recovery()
  remoteproc: remoteproc debugfs file fixes
  remoteproc: qcom: fix q6v5 probe error paths
  remoteproc: return error for bad "recovery" debugfs input

 drivers/remoteproc/qcom_q6v5_mss.c      | 23 +++++++++++++++--------
 drivers/remoteproc/remoteproc_core.c    | 12 ++++++++----
 drivers/remoteproc/remoteproc_debugfs.c | 14 +++++++-------
 3 files changed, 30 insertions(+), 19 deletions(-)

-- 
2.20.1

Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/2] soc: qcom: mdt_loader: Support loading non-split firmware
Date: Fri, 21 Jun 2019 18:21:44 -0700
Message-Id: <20190622012146.19719-1-bjorn.andersson@linaro.org>
To: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Typically the firmware files for the various remoteprocs is split in a number
of files. But in some releases these files are available in their unsplit form.

Extend the mdt loader to detect the unsplit firmware and load it transparently.

Also expose the function that compose the metadata header for validation and
use this from the modem remoteproc driver, so that it can support unsplit files
as well.

Bjorn Andersson (2):
  soc: qcom: mdt_loader: Support loading non-split images
  remoteproc: qcom: q6v5-mss: Support loading non-split images

 drivers/remoteproc/qcom_q6v5_mss.c  | 33 ++++++++---
 drivers/soc/qcom/mdt_loader.c       | 88 ++++++++++++++++++++++++++++-
 include/linux/soc/qcom/mdt_loader.h |  2 +
 3 files changed, 112 insertions(+), 11 deletions(-)

-- 
2.18.0

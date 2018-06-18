Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] rpmsg: glink: fix W=1 warnings.
Date: Mon, 18 Jun 2018 13:33:36 +0100
Message-Id: <20180618123339.24115-1-srinivas.kandagatla@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,
Here are few patches for warnings which I hit while building
kernel with W=1 flag.

thanks,
srini


Srinivas Kandagatla (3):
  rpmsg: glink: correctly annotate intent members
  rpmsg: glink: Fix various kerneldoc warnings.
  rpmsg: smd: fix kerneldoc warnings

 drivers/rpmsg/qcom_glink_native.c | 45 +++++++++++++++++++++------------------
 drivers/rpmsg/qcom_smd.c          |  9 +++++++-
 2 files changed, 32 insertions(+), 22 deletions(-)

-- 
2.16.2

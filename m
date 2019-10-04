Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/6] rpmsg: glink stability fixes
Date: Fri,  4 Oct 2019 15:26:56 -0700
Message-Id: <20191004222702.8632-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Fixes for issues found in GLINK during reboot testing of a remoteproc.

Arun Kumar Neelakantam (2):
  rpmsg: glink: Fix reuse intents memory leak issue
  rpmsg: glink: Fix use after free in open_ack TIMEOUT case

Bjorn Andersson (2):
  rpmsg: glink: Don't send pending rx_done during remove
  rpmsg: glink: Free pending deferred work on remove

Chris Lew (2):
  rpmsg: glink: Put an extra reference during cleanup
  rpmsg: glink: Fix rpmsg_register_device err handling

 drivers/rpmsg/qcom_glink_native.c | 52 +++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 10 deletions(-)

-- 
2.18.0

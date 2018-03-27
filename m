Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/3] rpmsg: smd: Redeliver messages after probe
Date: Tue, 27 Mar 2018 14:06:40 -0700
Message-Id: <20180327210643.3436-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

A race condition exists in SMD where incoming messages might be processed
before we've finished executing the rpmsg device's probe function. The driver's
callback function will in this case be unable to handle the incoming message
and might return an error.

Using the announce_create ops we can invoke the handler for incoming messages
once again after probe returns, solving this issue.

With SMD and QRTR this shows a high failure rate, but there are (at least
theoretical) similar issues in glink and virtio-rpmsg, so this needs to be
further investigated.

Bjorn Andersson (3):
  rpmsg: smd: Fix container_of macros
  rpmsg: Only invoke announce_create for rpdev with endpoints
  rpmsg: smd: Use announce_create to process any receive work

 drivers/rpmsg/qcom_smd.c   | 22 ++++++++++++++++++++--
 drivers/rpmsg/rpmsg_core.c |  2 +-
 2 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.16.2

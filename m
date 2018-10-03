Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH 0/5] Add TIOCM Signals support for RPMSG char devices
Date: Wed,  3 Oct 2018 17:04:18 +0530
Message-Id: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Glink transport support signals to exchange state notification between
local and remote side clients. Adding support to send/receive the signal
command and notify the clients through callback and POLL notification.

Arun Kumar Neelakantam (5):
  rpmsg: glink: Add GLINK signal support for RPMSG
  rpmsg: Add signal callback to rpmsg char device
  rpmsg: Add TIOCMGET/TIOCMSET ioctl support
  rpmsg: wakeup poll to notify signal update
  rpmsg: glink: Convert the native signals to TIOCM

 drivers/rpmsg/qcom_glink_native.c | 109 ++++++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_char.c        |  76 ++++++++++++++++++++++++--
 drivers/rpmsg/rpmsg_core.c        |  41 ++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   5 ++
 include/linux/rpmsg.h             |  25 +++++++++
 5 files changed, 253 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V3 0/4] Add TIOCM Signals support for RPMSG char devices
Date: Fri,  5 Oct 2018 12:29:32 +0530
Message-Id: <1538722776-13648-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Glink transport support signals to exchange state notification between
local and remote side clients. Adding support to send/receive the signal
command and notify the clients through callback and POLL notification.

Changes since v1:
- Split the patches as per functional areas like core, char, glink
- Add set, clear mask for TIOCMSET
- Merge the char signal callback and POLLPRI patches

Changes since v2:
- Modify the rpmsg_get_signals function prototype

Arun Kumar Neelakantam (4):
  rpmsg: core: Add signal API support
  rpmsg: glink: Add support to handle signals command
  rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
  rpmsg: char: Add signal callback and POLLPRI support

 drivers/rpmsg/qcom_glink_native.c | 126 ++++++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_char.c        |  74 +++++++++++++++++++++-
 drivers/rpmsg/rpmsg_core.c        |  41 +++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   5 ++
 include/linux/rpmsg.h             |  26 ++++++++
 5 files changed, 269 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <0101016e92941e7c-10557a2b-9d6b-4690-9e85-e63a34c69181-000000@us-west-2.amazonses.com>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [RESEND PATCH V4 0/4] Add TIOCM Signals support for RPMSG char devices
Date: Fri, 22 Nov 2019 10:06:51 +0000
Message-ID: <0101016e92941e7c-10557a2b-9d6b-4690-9e85-e63a34c69181-000000@us-west-2.amazonses.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Glink transport support signals to exchange state notification between
local and remote side clients. Adding support to send/receive the signal
command and notify the clients through callback and POLL notification.

Changes since v3:
- Correct the TICOMGET case handling as per new rpmsg_get_signals prototype
- Update the rpmsg_get_signals function header

Changes since v2:
- Modify the rpmsg_get_signals function prototype

Changes since v1:
- Split the patches as per functional areas like core, char, glink
- Add set, clear mask for TIOCMSET
- Merge the char signal callback and POLLPRI patches

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
1.9.1

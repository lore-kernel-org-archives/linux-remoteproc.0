Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 29 Oct 2018 16:33:30 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.20
Message-ID: <20181029233330.GW12063@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Chris Lew <clew@codeaurora.org>, Colin Ian King <colin.king@canonical.com>, Rob Herring <robh@kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.20

for you to fetch changes up to 928002a5e9dab2ddc1a0fe3e00739e89be30dc6b:

  rpmsg: glink: smem: Support rx peak for size less than 4 bytes (2018-10-03 17:04:32 -0700)

----------------------------------------------------------------
rpmsg updates for v4.20

This migrates rpmsg_char to use read/write_iter to allow being operated
using aio, removes the message size alignment requirements from glink,
closes a potential memory leak in SMD and switches to %pOFn for printing
device_node names.

----------------------------------------------------------------
Arun Kumar Neelakantam (1):
      rpmsg: glink: smem: Support rx peak for size less than 4 bytes

Bjorn Andersson (1):
      rpmsg: char: Migrate to iter versions of read and write

Chris Lew (1):
      rpmsg: glink: Remove chunk size word align warning

Colin Ian King (1):
      rpmsg: smd: fix memory leak on channel create

Rob Herring (1):
      rpmsg: Convert to using %pOFn instead of device_node.name

 drivers/rpmsg/qcom_glink_native.c |  3 ---
 drivers/rpmsg/qcom_glink_smem.c   | 14 +++++---------
 drivers/rpmsg/qcom_smd.c          |  9 ++++++---
 drivers/rpmsg/rpmsg_char.c        | 27 ++++++++++++++++-----------
 4 files changed, 27 insertions(+), 26 deletions(-)

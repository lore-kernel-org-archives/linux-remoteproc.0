Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 17 Aug 2018 14:44:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.19
Message-ID: <20180817214447.GB3941@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Chris Lew <clew@codeaurora.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.19

for you to fetch changes up to 00b645e0b4e4a3e5f8d88a4e9acf7e80045c34b4:

  rpmsg: Add compat ioctl for rpmsg char driver (2018-07-30 23:40:23 -0700)

----------------------------------------------------------------
rpmsg updates for v4.19

This fixes a few compile and kerneldoc warnings, allows rpmsg devices to
handle power domains, allow for labeling GLINK edges and supports compat
for rpmsg_char.

----------------------------------------------------------------
Arun Kumar Neelakantam (1):
      rpmsg: Add compat ioctl for rpmsg char driver

Chris Lew (2):
      dt-bindings: soc: qcom: Add label for GLINK bindings
      rpmsg: glink: Store edge name for glink device

Niklas Cassel (1):
      rpmsg: smd: Add missing include of sizes.h

Srinivas Kandagatla (4):
      rpmsg: glink: correctly annotate intent members
      rpmsg: glink: Fix various kerneldoc warnings.
      rpmsg: smd: fix kerneldoc warnings
      rpmsg: core: add support to power domains for devices

 .../devicetree/bindings/soc/qcom/qcom,glink.txt    |  5 +++
 drivers/rpmsg/qcom_glink_native.c                  | 51 +++++++++++++---------
 drivers/rpmsg/qcom_smd.c                           | 10 ++++-
 drivers/rpmsg/rpmsg_char.c                         |  2 +
 drivers/rpmsg/rpmsg_core.c                         |  7 +++
 5 files changed, 53 insertions(+), 22 deletions(-)

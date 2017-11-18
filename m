Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 17 Nov 2017 16:58:59 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.15
Message-ID: <20171118005859.GA12202@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Anup Patel <anup@brainfault.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 33d930e59a98fa10a0db9f56c7fa2f21a4aef9b9:

  Linux 4.14-rc5 (2017-10-15 21:01:12 -0400)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.15

for you to fetch changes up to 38a9acb3bb7b2561a08144ff80a292889f389a9b:

  rpmsg: glink: The mbox client knows_txdone (2017-11-15 22:58:01 -0800)

----------------------------------------------------------------
rpmsg updates for v4.15

This turn RPMSG_VIRTIO into a user selectable config, fixes a few bugs in GLINK
and provides the support for specifying initial buffer sizes for GLINK
channels.

----------------------------------------------------------------
Anup Patel (1):
      rpmsg: Allow RPMSG_VIRTIO to be enabled via menuconfig or defconfig

Arun Kumar Neelakantam (1):
      rpmsg: glink: Initialize the "intent_req_comp" completion variable

Bjorn Andersson (2):
      rpmsg: glink: Add missing MODULE_LICENSE
      rpmsg: glink: The mbox client knows_txdone

Chris Lew (3):
      dt-bindings: soc: qcom: Support GLINK intents
      rpmsg: glink: Add support to preallocate intents
      rpmsg: glink: Use best fit intent during tx

 .../devicetree/bindings/soc/qcom/qcom,glink.txt    | 10 +++++
 drivers/remoteproc/Kconfig                         |  4 --
 drivers/rpmsg/Kconfig                              |  3 +-
 drivers/rpmsg/qcom_glink_native.c                  | 51 +++++++++++++++++-----
 4 files changed, 52 insertions(+), 16 deletions(-)

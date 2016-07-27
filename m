Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 27 Jul 2016 12:12:28 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v4.8
Message-ID: <20160727191228.GN13516@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit af8c34ce6ae32addda3788d54a7e340cad22516b:

  Linux 4.7-rc2 (2016-06-05 14:31:26 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/hwlock-v4.8

for you to fetch changes up to 2dbd85859fca74d3d3a9f05f399c53a89f7ed2bd:

  MAINTAINERS: Update hwspinlock paths (2016-07-12 16:42:39 -0700)

----------------------------------------------------------------
hwspinlock updates for v4.8

Add missing of_node_put() in the Qualcomm driver and update MAINTAINERS to make
sure all hwspinlock related files have a maintainer listed.

----------------------------------------------------------------
Bjorn Andersson (1):
      MAINTAINERS: Update hwspinlock paths

Peter Chen (1):
      hwspinlock: qcom_hwspinlock: add missing of_node_put after calling of_parse_phandle

 MAINTAINERS                          | 3 ++-
 drivers/hwspinlock/qcom_hwspinlock.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

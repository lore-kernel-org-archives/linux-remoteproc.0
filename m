Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 0/4] Some improvements for hwspinlock
Date: Mon, 14 Oct 2019 15:07:42 +0800
Message-Id: <cover.1571036463.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linus.walleij@linaro.org, orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch set removes the BUG_ON() from hwspinlock core and changes the
PM runtime support to be optional.

Baolin Wang (4):
  hwspinlock: Remove BUG_ON() from the hwspinlock core
  hwspinlock: Let the PM runtime can be optional
  hwspinlock: sprd: Remove redundant PM runtime implementation
  hwspinlock: u8500_hsem: Remove redundant PM runtime implementation

 drivers/hwspinlock/hwspinlock_core.c |   16 ++++++++--------
 drivers/hwspinlock/sprd_hwspinlock.c |   21 +++------------------
 drivers/hwspinlock/u8500_hsem.c      |   19 ++++---------------
 3 files changed, 15 insertions(+), 41 deletions(-)

-- 
1.7.9.5

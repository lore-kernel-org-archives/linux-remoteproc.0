Return-Path: <baolin.wang7@gmail.com>
Return-Path: <baolin.wang7@gmail.com>
From: Baolin Wang <baolin.wang7@gmail.com>
Subject: [PATCH RESEND 0/3] Some improvements for SIRF hwspinlock
Date: Wed,  8 Jan 2020 11:23:43 +0800
Message-Id: <cover.1578453662.git.baolin.wang7@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, baohua@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, baolin.wang7@gmail.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch set did some improvements for the SIRF hwspinlock driver,
including changing to use devm_xxx APIs and removing some redundant
pm runtime functions.

Baolin Wang (3):
  hwspinlock: sirf: Change to use devm_platform_ioremap_resource()
  hwspinlock: sirf: Remove redundant PM runtime functions
  hwspinlock: sirf: Use devm_hwspin_lock_register() to register hwlock
    controller

 drivers/hwspinlock/sirf_hwspinlock.c |   46 ++++++----------------------------
 1 file changed, 7 insertions(+), 39 deletions(-)

-- 
1.7.9.5

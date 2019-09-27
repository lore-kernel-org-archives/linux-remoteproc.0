Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 0/4] Some optimization for Spreadtrum hwlock controller
Date: Fri, 27 Sep 2019 15:10:43 +0800
Message-Id: <cover.1569567749.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch set did some optimization for Spreadtrum hwlock controller,
including using some devm_xxx APIs to simplify code and validating the
return value when enabling clock.

Baolin Wang (4):
  hwspinlock: sprd: Change to use devm_platform_ioremap_resource()
  hwspinlock: sprd: Check the return value of clk_prepare_enable()
  hwspinlock: sprd: Use devm_add_action_or_reset() for calls to
    clk_disable_unprepare()
  hwspinlock: sprd: Use devm_hwspin_lock_register() to register hwlock
    controller

 drivers/hwspinlock/sprd_hwspinlock.c |   33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

-- 
1.7.9.5

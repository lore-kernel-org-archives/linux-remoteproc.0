Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 0/3] Optimize the u8500_hsem hwlock driver
Date: Fri, 27 Sep 2019 16:27:40 +0800
Message-Id: <cover.1569572448.git.baolin.wang@linaro.org>
To: linus.walleij@linaro.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch set did some Optimization with changing to use devm_xxx()
APIs to simplify the code and make code more readable.

Baolin Wang (3):
  hwspinlock: u8500_hsem: Change to use
    devm_platform_ioremap_resource()
  hwspinlock: u8500_hsem: Use devm_kzalloc() to allocate memory
  hwspinlock: u8500_hsem: Use devm_hwspin_lock_register() to register
    hwlock controller

 drivers/hwspinlock/u8500_hsem.c |   46 +++++++++++----------------------------
 1 file changed, 13 insertions(+), 33 deletions(-)

-- 
1.7.9.5

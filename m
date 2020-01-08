Return-Path: <baolin.wang7@gmail.com>
Return-Path: <baolin.wang7@gmail.com>
From: Baolin Wang <baolin.wang7@gmail.com>
Subject: [PATCH RESEND 0/2] Some improvements for Qualcomm hwspinlock
Date: Wed,  8 Jan 2020 11:09:09 +0800
Message-Id: <cover.1578452735.git.baolin.wang7@gmail.com>
To: agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: baolin.wang7@gmail.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch set did some optimization for Qualcomm hwlock controller,
including using devm_hwspin_lock_register() API to simplify code and
removing redundant pm runtime functions.

Baolin Wang (2):
  hwspinlock: qcom: Remove redundant PM runtime functions
  hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock
    controller

 drivers/hwspinlock/qcom_hwspinlock.c |   28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

-- 
1.7.9.5

Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:42231 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935359AbeFMMzE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Jun 2018 08:55:04 -0400
Received: by mail-lf0-f67.google.com with SMTP id v135-v6so3754858lfa.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jun 2018 05:55:03 -0700 (PDT)
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH 0/5] soc: qcom: remove depends on ARCH_QCOM
Date: Wed, 13 Jun 2018 14:53:55 +0200
Message-Id: <20180613125401.11734-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: Niklas Cassel <niklas.cassel@linaro.org>, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Since commit cab673583d96 ("soc: Unconditionally include qcom Makefile"),
we unconditionally include the soc/qcom/Makefile.

This opens up the possibility to compile test the code even when
building for other architectures.

This patch series prepares and enables all but two Kconfigs to be
compile tested even when building for other architectures.

Niklas Cassel (5):
  rpmsg: smd: Add missing include of sizes.h
  soc: qcom: smem: Add missing include of sizes.h
  soc: qcom: smp2p: Add select IRQ_DOMAIN
  soc: qcom: smsm: Add select IRQ_DOMAIN
  soc: qcom: Remove depends on ARCH_QCOM

 drivers/rpmsg/qcom_smd.c |  1 +
 drivers/soc/qcom/Kconfig | 12 ++++--------
 drivers/soc/qcom/smem.c  |  1 +
 3 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.17.1


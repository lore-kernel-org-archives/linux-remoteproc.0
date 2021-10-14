Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A24FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 07:52:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4325961019
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 07:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhJNHyt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Oct 2021 03:54:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:47120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229967AbhJNHyt (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Oct 2021 03:54:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EB7061027;
        Thu, 14 Oct 2021 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634197964;
        bh=qD+0G++7GvIbBcp1KcC76JBeUGQ4HMtVySdt0dwDMXo=;
        h=From:To:Cc:Subject:Date:From;
        b=QBtJkbALq4BE2jnsT6WHrt7SrIdrnv4OYnGoUrtD7tGgEsGCHPJsfMRVAwFvo0Mcb
         kTT4sTkdcNQ3Y03OxP0yTkpM2eLMvVIqM+3vnph4MJH+J1WXvyC0OWVflOetmzw/AF
         8WMdhTaIJiXAvfoy8qCwFKFtgQtvsxdp40NYYU8o/iCgqjV2rGyiAGaxhJ1jBPbqc7
         mnkkjO9OuUCQMj0SSWMvfDWSb0pGvMQuR41VcmNsRt7sFigZR4gfnRbUHcAxT+cN41
         DsE3sLY1f0v2mmpmeRWDFpbayWBZlXG8vDDMKurNvDhC6p1avBSmztOkeMTlRqpb+s
         mXi3AOdKWJlsw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: imx_dsp_rproc: mark PM functions as __maybe_unused
Date:   Thu, 14 Oct 2021 09:52:24 +0200
Message-Id: <20211014075239.3714694-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_PM_SLEEP is disabled, we get a harmless warning:

drivers/remoteproc/imx_dsp_rproc.c:1145:12: error: 'imx_dsp_resume' defined but not used [-Werror=unused-function]
 1145 | static int imx_dsp_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~
drivers/remoteproc/imx_dsp_rproc.c:1110:12: error: 'imx_dsp_suspend' defined but not used [-Werror=unused-function]
 1110 | static int imx_dsp_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~

Mark these as __maybe_unused to get a clean build.

Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 63749cfcf22f..90fcb389e252 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1107,7 +1107,7 @@ static void imx_dsp_load_firmware(const struct firmware *fw, void *context)
 	release_firmware(fw);
 }
 
-static int imx_dsp_suspend(struct device *dev)
+static __maybe_unused int imx_dsp_suspend(struct device *dev)
 {
 	struct rproc *rproc = dev_get_drvdata(dev);
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1142,7 +1142,7 @@ static int imx_dsp_suspend(struct device *dev)
 	return pm_runtime_force_suspend(dev);
 }
 
-static int imx_dsp_resume(struct device *dev)
+static __maybe_unused int imx_dsp_resume(struct device *dev)
 {
 	struct rproc *rproc = dev_get_drvdata(dev);
 	int ret = 0;
-- 
2.29.2


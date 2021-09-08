Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27E5C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Sep 2021 09:34:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8090161163
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Sep 2021 09:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347732AbhIHJfG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Sep 2021 05:35:06 -0400
Received: from inva020.nxp.com ([92.121.34.13]:56082 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233764AbhIHJfG (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Sep 2021 05:35:06 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DA1021A2EF4;
        Wed,  8 Sep 2021 11:33:55 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A12981A00A3;
        Wed,  8 Sep 2021 11:33:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DF615183AD26;
        Wed,  8 Sep 2021 17:33:53 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, daniel.baluta@nxp.com
Cc:     linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: [PATCH v4 0/4] Add remoteproc driver for DSP on i.MX
Date:   Wed,  8 Sep 2021 17:10:51 +0800
Message-Id: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Provide a basic driver to control DSP processor found on NXP i.MX8QM,
i.MX8QXP, i.MX8MP and i.MX8ULP.

Currently it is able to resolve addresses between DSP and main CPU,
start and stop the processor, suspend and resume.

The communication between DSP and main CPU is based on mailbox, there
are three mailbox channels (tx, rx, rxdb).

This driver was tested on NXP i.MX8QM, i.MX8QXP, i.MX8MP and i.MX8ULP.

changes in v4:
- merge binding doc to fsl,dsp.yaml for Rob's comments

changes in v3:
- Add this cover letter
- refine clock-names according to Rob's comments
- move common struct from imx_rproc.c to header file
- add IMX_RPROC_SCU_API enum item
- refine driver according to Mathieu's comments

changes in v2:
- change syscon to fsl,dsp-ctrl
- add items for clock-names

Shengjiu Wang (4):
  remoteproc: imx_rproc: Move common structure to header file
  remoteproc: imx_rproc: Add IMX_RPROC_SCU_API method
  remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX
  dt-bindings: dsp: fsl: update binding document for remote proc driver

 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   81 +-
 drivers/remoteproc/Kconfig                    |   11 +
 drivers/remoteproc/Makefile                   |    1 +
 drivers/remoteproc/imx_dsp_rproc.c            | 1178 +++++++++++++++++
 drivers/remoteproc/imx_rproc.c                |   28 +-
 drivers/remoteproc/imx_rproc.h                |   39 +
 6 files changed, 1305 insertions(+), 33 deletions(-)
 create mode 100644 drivers/remoteproc/imx_dsp_rproc.c
 create mode 100644 drivers/remoteproc/imx_rproc.h

-- 
2.17.1


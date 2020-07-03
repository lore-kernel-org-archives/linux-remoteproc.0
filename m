Return-Path: <SRS0=VvQe=AO=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0BBC433E6
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Jul 2020 08:18:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE5AF20836
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Jul 2020 08:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgGCISy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Jul 2020 04:18:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:63416 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgGCISy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Jul 2020 04:18:54 -0400
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Jul 2020 04:18:48 EDT
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 03 Jul 2020 01:12:49 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jul 2020 01:12:47 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Jul 2020 13:42:21 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id CB56721691; Fri,  3 Jul 2020 13:42:19 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [v6 0/4] Add non PAS wcss Q6 support for QCS404
Date:   Fri,  3 Jul 2020 13:42:15 +0530
Message-Id: <1593763939-19096-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Changes since v5:
 Rebased all the unmerged patches on top of linux-5.8-rc3
 Added dt-binding for qcom,qcs404-wcss-pil
 Removed typo

Changes since v4:
 removed QDSP6SS clock controls and moved to wcss rproc.
 renamed wcsccc to q6sstopcc.
 cleanup/refactoring.

Changes since v3:
 dt binding cleanup.
 Fixed remoteproc recovery.
 Added remoteproc dump support.
 wcsscc cleanup/refactoring.

Changes since v2:
 Removed unused properties.
 Refactored code to have common logic b/w ipq8074 and QCS404, wherever possible.
 Added compatible example.
 Removed wcss-protected bool.

Changes since v1:
  Corrected clock names as per comments in v1 patch.

Govind Singh (4):
  remoteproc: qcom: wcss: populate hardcoded param using driver data
  dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for QCS404
  remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
  remoteproc: qcom: wcss: explicitly request exclusive reset control

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   9 +
 drivers/remoteproc/qcom_q6v5_wcss.c                | 596 +++++++++++++++++++--
 2 files changed, 563 insertions(+), 42 deletions(-)

-- 
2.7.4


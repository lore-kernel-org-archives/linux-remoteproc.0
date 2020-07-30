Return-Path: <SRS0=xwos=BJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B82C433E5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jul 2020 12:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E22622BEA
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jul 2020 12:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgG3MOg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Jul 2020 08:14:36 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15938 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgG3MOg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jul 2020 08:14:36 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 30 Jul 2020 05:14:36 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Jul 2020 05:14:33 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 30 Jul 2020 17:44:06 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id C3700218A2; Thu, 30 Jul 2020 17:44:04 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v8 0/4] Add non PAS wcss Q6 support for QCS404
Date:   Thu, 30 Jul 2020 17:44:00 +0530
Message-Id: <1596111244-28411-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Changes since v7:
 Addressed review comments from	Stephen Boyd
 
Changes since v6:
 Removed duplicate structure entry added during rebase in v5

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
 drivers/remoteproc/qcom_q6v5_wcss.c                | 591 +++++++++++++++++++--
 2 files changed, 558 insertions(+), 42 deletions(-)

-- 
2.7.4


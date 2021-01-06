Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5160C43332
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 10:24:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE94123110
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 10:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbhAFKYy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jan 2021 05:24:54 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:19711 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbhAFKYy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 05:24:54 -0500
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5G6JlrU="
X-RZG-CLASS-ID: mo00
Received: from droid..
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id e09c6dx06ALj5DT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 6 Jan 2021 11:21:45 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/3] Fix wcn36xx on msm8916-samsung-a5u
Date:   Wed,  6 Jan 2021 11:21:31 +0100
Message-Id: <20210106102134.59801-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Unlike most MSM8916 boards, samsung-a5u uses WCN3660B instead of
WCN3620 to support the 5 GHz band additionally.

WCN3660B has similar requirements as WCN3620, but it needs the XO
clock to run at 48 MHz instead of 19.2 MHz. So far it was possible
to describe that configuration using the qcom,wcn3680 compatible.

However, as of commit 8490987bdb9a ("wcn36xx: Hook and identify RF_IRIS_WCN3680"),
the wcn36xx driver will now use the qcom,wcn3680 compatible
to enable functionality specific to WCN3680. In particular,
WCN3680 supports 802.11ac, which is not available in WCN3660B.

This patch set introduces a new "qcom,wcn3660b" compatible
to fix the msm8916-samsung-a5u device tree.

Stephan Gerhold (3):
  dt-bindings: remoteproc: qcom,wcnss-pil: Add qcom,wcn3660b compatible
  remoteproc: qcom_wcnss_iris: Add qcom,wcn3660b compatible
  arm64: dts: qcom: msm8916-samsung-a5u: Fix iris compatible

 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt | 1 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts            | 2 +-
 drivers/remoteproc/qcom_wcnss_iris.c                            | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.30.0


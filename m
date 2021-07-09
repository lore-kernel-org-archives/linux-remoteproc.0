Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42643C07E99
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Jul 2021 17:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CC35611B0
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Jul 2021 17:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhGIRFE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Jul 2021 13:05:04 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:49385 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhGIRFE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Jul 2021 13:05:04 -0400
Date:   Fri, 09 Jul 2021 17:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625850137;
        bh=j/GiV8qTGiZFDN3SHsIQ9GaIZaq8LR9TG1PhKaFl6a4=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=TPmAWP+eJz/Y6wqmJ0ZWJYoQdyQsrkO4NthvjgOJk9r/aqbik5TgTaBWXLcPoc4F+
         tok58gZwzVPkqeq7IfI56hnlRGYz9RvZBtVBwsIfMVV9URMIh9FEXMvHgWy14CFXV1
         eOZEUuuB5dJzeWVLoztstDP4n6e6rTN5yByEO0aU=
To:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Dr. Git" <drgitx@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 0/5] msm8996: Remoteproc Enablement
Message-ID: <1psXpLs4s2ivJ6uAXr4TiLbs2gmwRfTVjcyzG68k@cp3-web-021.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This series adds the missing remoteprocs on msm8996, modem and SLPI.

Dependencies:
 - https://lore.kernel.org/r/20210228130831.203765-3-konrad.dybcio@somainli=
ne.org (merged in 5.14)
 - https://lore.kernel.org/r/Epn1vFjJb0oQhqMYxspzL6X1N6MPcDT1f9oVVOjXc@cp3-=
web-020.plabs.ch
   (merged in 5.14)

Changes since v1 (4/5 remoteproc: qcom: pas: Use the same init resources fo=
r MSM8996 and MSM8998):
 - Rename msm8998_adsp_resource to msm8996_adsp_resource
 - Add power domains to slpi_resource_init and use that instead of msm8998_=
slpi_resource

Dr. Git (1):
  arm64: dts: qcom: msm8996: Add modem remoteproc

Yassine Oudjana (4):
  arm64: dts: qcom: msm8996: Revamp reserved memory
  arm64: dts: qcom: msm8996: Unify smp2p naming
  remoteproc: qcom: pas: Use the same init resources for MSM8996 and
    MSM8998
  arm64: dts: qcom: msm8996: Add SLPI PIL

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 192 ++++++++++++++++++++------
 drivers/remoteproc/qcom_q6v5_pas.c    |  27 ++--
 2 files changed, 155 insertions(+), 64 deletions(-)

--=20
2.32.0



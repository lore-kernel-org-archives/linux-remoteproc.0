Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCCFC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 21:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25BE06121F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 21:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhEFVSn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 17:18:43 -0400
Received: from mail-41103.protonmail.ch ([185.70.41.103]:28963 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbhEFVSm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 17:18:42 -0400
Received: from mail-02.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4Fbmd30Cxpz4wy4c
        for <linux-remoteproc@vger.kernel.org>; Thu,  6 May 2021 21:17:43 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="tly7cjq4"
Date:   Thu, 06 May 2021 21:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1620335858;
        bh=WbErNjctHFDeme6xYOOtYWUvtSVdvDm3QyjUvzqlOV8=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=tly7cjq45DGKYenjoeYa32Qj3TY8BscAKPwFP96TIc9zq8K5amMwzS2W8eeq8dbiq
         0k20FmTzwXoA8lZ19eR0DKzAMAt1ucePbuQFqy5fhWLDS836w4/A0CubZQLS8czTCN
         nBk6FPlNqfWuwQiCLQoQ7AhuhrPryyVCj4f8Defg=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 0/3] msm8996: Add qcom_q6v5_pas power domains
Message-ID: <5JzviCPueYdcC0mDxsTnsVrkpfSjvvZ1QR0o8bMMEs@cp4-web-040.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patchset adds power domains required by ADSP and SLPI.

Yassine Oudjana (3):
  remoteproc: qcom: pas: Use the same init resources for MSM8996 and
    MSM8998
  dt-bindings: remoteproc: qcom: pas: Add power domains for MSM8996
  arm64: dts: qcom: msm8996: Disable ADSP and add power domains

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml |  2 ++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi      |  4 ++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi             |  6 ++++++
 drivers/remoteproc/qcom_q6v5_pas.c                | 15 ++-------------
 4 files changed, 14 insertions(+), 13 deletions(-)

--=20
2.31.1



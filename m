Return-Path: <SRS0=iWym=CZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25B5C43461
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Sep 2020 17:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61CC7206B6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Sep 2020 17:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="L36NFn4F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgIPRsp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Sep 2020 13:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbgIPRsR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:48:17 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7969EC061A29;
        Wed, 16 Sep 2020 04:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254281;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=wPJEoYyYQh25xISg8G/qnJXW/NhFz+5NwkRwlfMN4Pk=;
        b=L36NFn4FY0GaczKmi5lTJbt0jDO13heQag5KxTiKSfQ7gme7lDU2eIvCF220iwc6zW
        o0SCH4LuRw04+rMTNVoVsCZoMHAt1jv9ozzZEa/TQyix2NfsyPjrGpSrh46S5WEMMmHv
        +4K7hu9Nk/juK+tKcK9ZW7NUXV/xgU1YKtNqIVr2E1a4DNeMCKSNBVlVMjDitcM488U2
        so70wbwRuhm3Oan1ZviDgLAw7XJhKQQYwJ4Jb8+oSm4FhwNXtIhmCH85vFUewbmXq3AK
        ad1jRgyxjUwlHxU0S9IwEfCkuPSbqtlcx1trY2DNXdUkUFHY8QQIdo8edZRnWBP83Nfu
        HSgQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfnzlN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:49 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 00/10] Convert MSM8916 to use rpmpd/power domains
Date:   Wed, 16 Sep 2020 12:41:25 +0200
Message-Id: <20200916104135.25085-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Newer platforms vote for necessary power domains through the power
domain subsystem. For historical reasons older platforms like MSM8916
or MSM8974 still control these as regulators.

This patch series adds the power domain definitions for MSM8916
to the rpmpd driver. Then, qcom_q6v5_mss and qcom_wcnss are updated
to use power domains for MSM8916/MSM8974. For compatibility with old
device trees (and for MSM8974) we still need to support using the
power domains through the regulator interface. This is implemented by
falling back to the regulators if requesting the power domains fails.

Finally, we remove the regulators that provide the power domains
(s1 and l3) entirely from the MSM8916 device tree: They should only
be used through the power domain subsystem from now on.

Stephan Gerhold (10):
  soc: qcom: rpmpd: Rename MAX_8996_RPMPD_STATE to
    MAX_CORNER_RPMPD_STATE
  dt-bindings: power: rpmpd: Add MSM8916 RPM power domains
  soc: qcom: rpmpd: Add MSM8916 power domains
  arm64: dts: qcom: msm8916: Add RPM power domains
  dt-bindings: remoteproc: qcom,q6v5: Deprecate regulators for PDs
  remoteproc: qcom_q6v5_mss: Allow replacing regulators with power
    domains
  dt-bindings: remoteproc: qcom,wcnss: Deprecate regulators for PDs
  remoteproc: qcom_wcnss: Allow replacing regulators with power domains
  arm64: dts: qcom: msm8916: Use power domains for MSS/WCNSS remoteprocs
  arm64: dts: qcom: msm8916-pm8916: Stop using s1/l3 as regulators

 .../devicetree/bindings/power/qcom,rpmpd.yaml |   1 +
 .../bindings/remoteproc/qcom,q6v5.txt         |  12 +-
 .../bindings/remoteproc/qcom,wcnss-pil.txt    |  20 +++-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |  10 --
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  10 --
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi  |   7 +-
 .../qcom/msm8916-samsung-a2015-common.dtsi    |  10 --
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  38 ++++++
 drivers/remoteproc/qcom_q6v5_mss.c            |  68 +++++++++--
 drivers/remoteproc/qcom_wcnss.c               | 109 +++++++++++++++---
 drivers/soc/qcom/rpmpd.c                      |  25 +++-
 include/dt-bindings/power/qcom-rpmpd.h        |   7 ++
 12 files changed, 242 insertions(+), 75 deletions(-)

-- 
2.28.0


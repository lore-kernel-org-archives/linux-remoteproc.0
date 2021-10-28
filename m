Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE25C433FE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Oct 2021 08:13:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3EDC610C7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Oct 2021 08:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhJ1IQW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Oct 2021 04:16:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23940 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhJ1IQU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Oct 2021 04:16:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635408833; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8vKj4w39YzlWIfE5kWgS0m6Qi8CZZh8Q8uZAfpdwdjQ=; b=kecicx2WAkvkfYE6PfirNzQyUDmU4H7AD6ov68+yEQHniRcdBZhOvfzMNatFDF7R5/JXMRQD
 XcQ4N0UExUFLrxh69vpQmbNWo+5+W5LbM32rHwqGEhPgfQWmKAk/sTe49ZGfGtxeu/4JrbNZ
 GtNxqzM6YFvDCiAWd2pMjo8anQ0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 617a5bc12e144ac4d3c8c704 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 08:13:53
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 77044C43619; Thu, 28 Oct 2021 08:13:52 +0000 (UTC)
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BED1CC4338F;
        Thu, 28 Oct 2021 08:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BED1CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v7 0/3] Add support for sc7280 WPSS PIL loading
Date:   Thu, 28 Oct 2021 13:43:34 +0530
Message-Id: <1635408817-14426-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add support for PIL loading of WPSS co-processor for SC7280 SOCs.

Changes from v6:
- Fixed the dt-bindings check in qcom,sc7280-wpss-pil.yaml
- Fixed CDSP dt-bindings example node (compatible, glink-edge)
- Fixed the clock-names used in wpss driver
- Add support to get firmware-name from DTSI entry for wpss.

Changes from v4/v5:
- Add yaml conversion for adsp/cdsp dt-bindings
- Change clock names in wpss dt-bindings
- Correct mistake in signed-off enail ID

Rakesh Pillai (3):
  dt-bindings: remoteproc: qcom: adsp: Convert binding to YAML
  dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
  remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS

 .../bindings/remoteproc/qcom,hexagon-v56.txt       | 140 -------------
 .../bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml  | 161 +++++++++++++++
 .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 194 ++++++++++++++++++
 .../bindings/remoteproc/qcom,sdm845-adsp-pil.yaml  | 160 +++++++++++++++
 drivers/remoteproc/qcom_q6v5_adsp.c                | 219 +++++++++++++++++++--
 5 files changed, 718 insertions(+), 156 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml

-- 
2.7.4


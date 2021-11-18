Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85172C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Nov 2021 15:50:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6135A61155
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Nov 2021 15:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbhKRPxk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Nov 2021 10:53:40 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:30998 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232688AbhKRPxj (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Nov 2021 10:53:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637250639; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=iX11h+Op1PNzjFTEsnyBCkeChhmqWolo+4Fuu4ZniBo=; b=UVGm1ihuIwXsvijUpF4F09rnZP4GDJopXzpRhYb69k2boC0p85O/nHmCFSqKmh153DCAKFP6
 dhzoEn1cpe6Yh/UdSw6yDla3LaMCCX8qp0vIOToBcx0cy/pgWPQsD1aw9X6KNBS7P6xDgNlA
 WBeYdRJxkoYIy3VP7VzMObG+9Ds=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6196764e1e1d2f523309027b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 15:50:38
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46EA6C4361B; Thu, 18 Nov 2021 15:50:38 +0000 (UTC)
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8942EC4338F;
        Thu, 18 Nov 2021 15:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8942EC4338F
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
Subject: [PATCH v9 0/3] Add support for sc7280 WPSS PIL loading
Date:   Thu, 18 Nov 2021 21:20:17 +0530
Message-Id: <1637250620-8926-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add support for PIL loading of WPSS co-processor for SC7280 SOCs.

Changes from v8:
- Disallow num_proxy_pds to be more than the max allowed
- Add "additionalProperties: false" for glink-edge property in wpss dt-bindings.

Changes from v7:
- Use "interrupts" instead of "interrupts-extended" in DT bindings.
- Add glink-edge properties in DT bindings.
- Use size_t for "proxy_pd_count" in wpss remoteproc driver

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
 .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 219 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sdm845-adsp-pil.yaml  | 160 +++++++++++++++
 drivers/remoteproc/qcom_q6v5_adsp.c                | 222 +++++++++++++++++++--
 5 files changed, 746 insertions(+), 156 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml

-- 
2.7.4


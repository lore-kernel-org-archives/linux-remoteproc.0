Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4460EE728C8
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Sep 2023 16:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbjI2QQ4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 29 Sep 2023 12:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbjI2QQ4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Sep 2023 12:16:56 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8D11B7
        for <linux-remoteproc@vger.kernel.org>; Fri, 29 Sep 2023 09:16:53 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so14131821f8f.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 29 Sep 2023 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696004211; x=1696609011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MikOgdHnw9Cj1F3F15+YBxnX7Q0cPaNa5HmAcMHbwVs=;
        b=Up6A5L6slPRGd0ev40c2i0B4MtiiT2z2ZzBA5H7gxs141wmsXDs3ev2NNjHO6kfxgB
         1slgibq/awH6SzdmUjG8yQnZJ1YM1yrQVWMtY0UeI+YwJbk1NcrcPOMVCfGpCx/MhQYX
         oDpxTbtKGSOq/xujlqAwcxFgC/YRwuqUV+SCr+TbWBvWvAmEbKS1TqyKTfV55srfzXxk
         znD7pReiYo7x7afeC+RbZ8k1nn34+oQN7Rh7SimBkbXfB2zH/JwA8UY6EBxxOAvjjeTj
         L4RN653xogllCaioSYfuVxSPIONxNwoQMoJIvDMKTyzDqhItXUqlA+3dpk23fBRN/sIB
         PTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696004211; x=1696609011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MikOgdHnw9Cj1F3F15+YBxnX7Q0cPaNa5HmAcMHbwVs=;
        b=t/7LFP9+eAnYYea/NIR1tWADxHPN0xnJo3LJTsEJuRR53G6o2AB3sY2wfgCjdogv3B
         N0G7kz3vJcdFU7RRbKOQ9bJFAYCSyz3ZfXJYpz2OxNsKrlCHuJZ8uMUfeg7aQcLrP1uO
         sqBGm1OUBNAShhTe/VdCnGXFOopx10b6Fm1v2QcRTBT2DjuXuxM1tbWJjfMN5v/11ZSZ
         LeKYNCH1b5eFYhkPLwZQ8JeqgGiZ0Vk1JIGLhOBceh8joIki1Zv3kRk2lNDnIF2UJSbH
         Es5kklUsUbOomNvZdUc1//pTwuexgYw1vnl6+STPVk08NY2hWywpsMdLTqmfiVJb6vfp
         Cb3g==
X-Gm-Message-State: AOJu0Yw+x09Oce2ll9dTUXRf4Ux5RjNQxagQRjLdrycXBuR+cBUodXL2
        C8aY2SCTgKlD0JAhsrTyan7iww==
X-Google-Smtp-Source: AGHT+IGh9+hHCV8PgonNR9t6AFEVc/cDbuI0Aqd6VW8dFYYBRvr/czuKcfiIKkHf283fsaQY+Cme5Q==
X-Received: by 2002:adf:f5c3:0:b0:314:350a:6912 with SMTP id k3-20020adff5c3000000b00314350a6912mr4034356wrp.36.1696004211549;
        Fri, 29 Sep 2023 09:16:51 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id x15-20020adfcc0f000000b0032330e43590sm10226848wrh.22.2023.09.29.09.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 09:16:51 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Fri, 29 Sep 2023 17:16:20 +0100
Subject: [PATCH 4/4] MAINTAINERS: Add entry for Qualcomm Cooling Driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230905-caleb-qmi_cooling-v1-4-5aa39d4164a7@linaro.org>
References: <20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org>
In-Reply-To: <20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bhupesh Sharma <bhupesh.linux@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=874;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=lGmSgXW2XFQ/63QULMjMdPqhafuryymoFyIIA0vaTv4=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSxH3k3+Bf291/I99V6oPb+kdyaZ+r2Kh0Zr0ryDjwKT
 X47/eahjlIWBkEOBlkxRRbxE8ssm9ZettfYvuACzBxWJpAhDFycAjCR6aIMf0WmOf4TP2lWzrrO
 Z86kBbf+Pnwx+brP5aM537axFL9jkGRm+B+dkP7m9KzXj94U3tmz1+oo1631m720+J2ksk6djA+
 b4HAfAA==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add myself as the maintainer for the Qualcomm Cooling
driver.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01dde0acebd3..d92cfa1dd57f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17800,6 +17800,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 F:	drivers/mtd/nand/raw/qcom_nandc.c
 
+QUALCOMM QMI (THERMAL MITIGATION DEVICE) COOLING DRIVER
+M:	Caleb Connolly <caleb.connolly@linaro.org>
+L:	linux-pm@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
+F:	drivers/thermal/qcom/qmi-cooling.*
+
 QUALCOMM QSEECOM DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.42.0


Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C81C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 May 2022 02:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiENCrw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 May 2022 22:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiENCrv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 May 2022 22:47:51 -0400
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730424F610E
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 May 2022 17:49:04 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id n10so19094739ejk.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 May 2022 17:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p1+Xm7EUInIY3jvthb6tC3vLUTde35YYnc+B4cs34zo=;
        b=orPadqrPCDmcbZuPrF06wsMUbSjw0K+eL03xR0/hC+F5ybl24xD7r7i/VpUfJehJjk
         X7fSZnDiXocFltfDjaIUXQ+2sZJSMEBKp7kxrsGGq4S5G/NJxkIfzIQXJ+A7TWZyrU33
         iTKOFmYgHaZevZbhf3ot98zN7uXpkuR6sOTHnPqzxXlgjnHRtoY8RMP9ey+fYqZvlp79
         4NMatCxHNITiRkmcwILZ7Rx80bpuJdAsaH5juR9kCTcF7CFb4Br5dhPPVbUjWQq3RXW9
         2/yGlPOeaPIWEGbSJABM4Trh8lsVMpLOuCd45SlXaur4jayaeS8Qf9i0I+e7snI2bISe
         Tstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p1+Xm7EUInIY3jvthb6tC3vLUTde35YYnc+B4cs34zo=;
        b=PAbgeeLc+AgakvnszFKBxnxQtLGFwrUzQEfYmezFhW9w3gphnADbTiGksHAIn2N3QF
         5n1a8vt385lVwo63Pukl6kY2CAUFyfBw7rKAnE0pvLYXCJLG1NHo5Q67XOWXPsgz2wJG
         dZlEQ4HRMQNS3k4JHqoyQV/4/dzoBZ+el5Js/m8RGTwde+9SpTrAgDNNwlcDj5UJVLhQ
         3bZrUxmW8X3pb3R5uD9tdrbBey/r3iYhlCRQua0fQBM4jrblRQ79g8n4EvbpZMs53MgF
         vn8xeCVwZfgCPV7zLsW5w5itvUfLkKH6oU7Bfl5K8LCMGXpXfVGGbYZU+3LfhafUKTB0
         uU0A==
X-Gm-Message-State: AOAM530W5CJ4UhZM8WJf810APApgOhNHpNxLp9P5mPGVQmaIo1fIEKqg
        QAQ5nUqMhhC4X0Yjrtc5NsPUtdoaFBksHA==
X-Google-Smtp-Source: ABdhPJx0UmqhGj8S6MnXyxoYZW8I6PIYPveeEoxF6Y5cYXtbK5eThZLO5BKTg4wcW6L0KPMOIrlYQQ==
X-Received: by 2002:a05:651c:10b:b0:24f:24a3:9dec with SMTP id a11-20020a05651c010b00b0024f24a39decmr4361223ljb.144.1652486470712;
        Fri, 13 May 2022 17:01:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z2-20020a2e9b82000000b0024f3d1daeaesm626221lji.54.2022.05.13.17.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:01:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: remoteproc: qcom: Add SDM660 modem PAS compatible
Date:   Sat, 14 May 2022 03:01:05 +0300
Message-Id: <20220514000108.3070363-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
References: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Describe required properties of the SDM660 MSS PIL device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 8f1507052afd..5ecfaf2048ab 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -16,6 +16,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8998-mss-pil"
 		    "qcom,sc7180-mss-pil"
 		    "qcom,sc7280-mss-pil"
+		    "qcom,sdm660-mss-pil"
 		    "qcom,sdm845-mss-pil"
 
 - reg:
@@ -44,6 +45,7 @@ on the Qualcomm Hexagon core.
 	qcom,qcs404-wcss-pil:
 	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
+	qcom,sdm660-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
@@ -84,6 +86,7 @@ on the Qualcomm Hexagon core.
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "pnoc", "qdss"
 	qcom,msm8998-mss-pil:
+	qcom,sdm660-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "qdss"
 	qcom,sc7180-mss-pil:
@@ -175,6 +178,7 @@ For the compatible string below the following supplies are required:
 	qcom,msm8974-mss-pil:
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
+	qcom,sdm660-mss-pil:
 		    must be "cx", "mx"
 	qcom,sc7180-mss-pil:
 		    must be "cx", "mx", "mss"
-- 
2.35.1


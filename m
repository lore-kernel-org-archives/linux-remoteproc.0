Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA57C43334
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Jul 2022 08:29:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237098AbiGWI3g (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 23 Jul 2022 04:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiGWI3g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 23 Jul 2022 04:29:36 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8E92A950
        for <linux-remoteproc@vger.kernel.org>; Sat, 23 Jul 2022 01:29:35 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id r14so7787076ljp.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 23 Jul 2022 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=resent-from:resent-to:resent-date:resent-message-id:from:to:cc
         :subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uzzbvpcg92Vbq8cJiUX3FDJ4W3Mjvx8Z9ViLMy+/Iz0=;
        b=h2/jHT9SQsmsoIH4EAiU71xSLC3CIRit7HvmJdLH8xhMI43JPAKZELmT5KzLu5kzG6
         0loA2tcEH35lJamXvEy84umKAoFx9JT6sO7cLzBVexXwwLO5mYNel1UyuPZMB6mwaC/i
         MPe8vZuil1jDO2ttCTbZR9eoef3pOTLHAxYlR1WeLBDPVEurQpA4DdP8Jf74xi7J5vdd
         qPZfm/j8phGB85NCXXSDLl+fEh5yzLzsC1HL0YjS8GgxXdbiv7NnAYfqGifJG+baGbIs
         20ItlqY0FgNTuWDH8GoaDEHpgCWSJFFOFCIiZc44aVyP/AcCUY+C6dGAqQ3jGl9492ea
         0cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:resent-from:resent-to:resent-date
         :resent-message-id:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uzzbvpcg92Vbq8cJiUX3FDJ4W3Mjvx8Z9ViLMy+/Iz0=;
        b=xneL7E+lYNSN0MwuWuWVRz4foou9lta06/0G0V/zPPXuBIf6yEbRW/F4EC9zA+vyp6
         YQ7RiA3myQj7inBo+/dQ7SHhr9Tv/zACJ4AG4AkS9qR70voJLZBePsKawVEgKPNHMuRR
         XkKjIc7wM0mrnviT/sS6UIRGgDQP8l+/MFtg3b+yiBlFeIC5ZvMFypMWYLLtmles/W78
         5eY31toKQ69fVFGULNs2F3kkRmNlzainHNYTJR71h44Shw1MP5gjQc5hLaTWTDKKhR1/
         uMMZgSlUoIRhcUwfte7OQ2UViZoZsKlPu4HPB1D6zSLI97WC5nx7++TOHGfGI7ugXR83
         6oCw==
X-Gm-Message-State: AJIora80etUkiGzYVGDQSLaTUAwA2AmYV+e+Y6v6fAF9GN1gwJT4SuMi
        SlqcGy6MYEibR0t4XJZ5sKlpQdkZPTbqa6bK
X-Google-Smtp-Source: AGRyM1sI7/MWEY9W6DOfjBiJpqpiZLmlhSFU4R7UfuL9J0v6kzRn4RZXYNWB5rOg1b5KPW8+yN4kgQ==
X-Received: by 2002:a2e:9c86:0:b0:25d:edc3:3a2a with SMTP id x6-20020a2e9c86000000b0025dedc33a2amr1233921lji.406.1658564973078;
        Sat, 23 Jul 2022 01:29:33 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id e16-20020a2ea550000000b0025de5cbd183sm1480760ljn.116.2022.07.23.01.29.32
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 01:29:32 -0700 (PDT)
Received: from krzk-bin.home (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id n22-20020a05651203f600b004886508ca5csm1545801lfq.68.2022.07.23.01.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 01:24:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: soc: qcom: smd-rpm: extend example
Date:   Sat, 23 Jul 2022 10:23:58 +0200
Message-Id: <20220723082358.39544-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220723082358.39544-1-krzysztof.kozlowski@linaro.org>
References: <20220723082358.39544-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Replace existing limited example with proper code for Qualcomm Resource
Power Manager (RPM) over SMD based on MSM8916.  This also fixes the
example's indentation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/qcom/qcom,smd-rpm.yaml       | 33 +++++++++++++++----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 50f834563e19..09d5bfa920f2 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -92,12 +92,33 @@ examples:
             qcom,ipc = <&apcs 8 0>;
             qcom,smd-edge = <15>;
 
-                rpm-requests {
-                        compatible = "qcom,rpm-msm8974";
-                        qcom,smd-channels = "rpm_requests";
+            rpm-requests {
+                compatible = "qcom,rpm-msm8916";
+                qcom,smd-channels = "rpm_requests";
+
+                clock-controller {
+                    compatible = "qcom,rpmcc-msm8916", "qcom,rpmcc";
+                    #clock-cells = <1>;
+                    clocks = <&xo_board>;
+                    clock-names = "xo";
+                };
 
-                        /* Regulator nodes to follow */
+                power-controller {
+                    compatible = "qcom,msm8916-rpmpd";
+                    #power-domain-cells = <1>;
+                    operating-points-v2 = <&rpmpd_opp_table>;
+
+                    rpmpd_opp_table: opp-table {
+                        compatible = "operating-points-v2";
+
+                        opp-1 {
+                            opp-level = <1>;
+                        };
+                        opp-2 {
+                            opp-level = <2>;
+                        };
+                    };
                 };
             };
-     };
-...
+        };
+    };
-- 
2.34.1


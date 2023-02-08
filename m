Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A864EC636D4
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Feb 2023 10:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjBHKQC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Feb 2023 05:16:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjBHKP5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Feb 2023 05:15:57 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D7542DD7
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Feb 2023 02:15:56 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso1080898wms.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Feb 2023 02:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AX0KvsHNXIwnS/VJd4Zm7BJ6Z2WcU4zrwjwY9zApro=;
        b=otB5oI1h2JjdnPTN1uupxEvdwOdGJFMuwogAF3TapP0WoZkknD9Ir79LtK5kA8SIMi
         iJwSnkoxqtECHPDMRzgQHfmIiccFRY6jyy3EllP4YZPfOUScCxib0YDMY8XiqcoYfapF
         YixXF5FqGyzIZ9Oo5YVZK3HRr2u0e8PkFJ2CFJ5tf2B+exRAUUHuKPzaWlO0t8E4IDT4
         Nbse+sG1sO4pBXqNdrWKxgrMR1dq2/oq2uf8Co6dnxOwxymkuU/vF0vw9A+PUIl0dVsq
         oJhj6Wl4xajS7UzXwMw9yJLvVK4RLBV6X3N1g+89BY0jhk33VyRzhBewiBaM8TmHDrcx
         BS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AX0KvsHNXIwnS/VJd4Zm7BJ6Z2WcU4zrwjwY9zApro=;
        b=neo8WDXuxD/mWrdUBvSyHROd1fgi0tnBnH14ZGaU3j+lRRNE+3rytc72m5qkg8REcR
         2aTZPDql5PgubDT5u5d31TIn6WbI7F3P55Lo05NMYGYHsjarfNIfyBvumk3FO/AJwcRS
         7D8c9DAETMxG+15Gdp6LdOwH587CpIVm8A0BXPATyTxAGutMeYyMmZMCnULQ64om8Z6R
         1irBzKZbCVr8nFdnI3dd0kOhdfKkOqa5D8PvefsofDJk5w9SDJi9VBlKviTulNfLKlaK
         cJ+RkfuV5zYb20uuEL6B/UzR5hd8SHZ6SX9ZWA3QZGZhRVXNuDWG3jxUWOuqGfNeRFDk
         G3dg==
X-Gm-Message-State: AO0yUKWZwUaCiAeeDF68xt0IVxdQy0RF/s9G8Fvm3R+/3isI1z6PnLd8
        YPnQFZ4cq/b2jZZDAoMpHIXv8A==
X-Google-Smtp-Source: AK7set/KVAJ9urDvdx9Mib0W5fhtxUGBPc2Cgcsin9K4324Fl6UNdsN4sun4S8bzZmC8WB1eg90eOg==
X-Received: by 2002:a05:600c:708:b0:3df:fcbd:3159 with SMTP id i8-20020a05600c070800b003dffcbd3159mr1354532wmn.3.1675851356081;
        Wed, 08 Feb 2023 02:15:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/7] dt-bindings: mailbox: qcom,apcs-kpss-global: drop mbox-names from example
Date:   Wed,  8 Feb 2023 11:15:42 +0100
Message-Id: <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Qualcomm G-Link RPM edge bindings do not allow and do not use mbox-names
property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None.
2. Previously was sent as separate patch.

There are no strict dependencies. This can go anytime. The next patch
(glink-rpm-edge) should be applied in the same or later cycle (could be
via different trees).
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..56b386b688b3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -155,7 +155,6 @@ examples:
         interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
         qcom,rpm-msg-ram = <&rpm_msg_ram>;
         mboxes = <&apcs_glb 0>;
-        mbox-names = "rpm_hlos";
     };
 
   # Example apcs with qcs404
-- 
2.34.1


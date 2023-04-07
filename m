Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9011AC77B73
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Apr 2023 13:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240830AbjDGN2n (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Apr 2023 09:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240803AbjDGN2j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Apr 2023 09:28:39 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260A3900C
        for <linux-remoteproc@vger.kernel.org>; Fri,  7 Apr 2023 06:28:37 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id x20so43531825ljq.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Apr 2023 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680874115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llePgOmhGh4IWb8LWhk+RajPlS7CDIy7UmsGMTBqzaA=;
        b=cO5lYLU5ym4dGfjzsNgK5ZlP8ePOHNfsRx9h+f8eHM/HC7LyE529BTqTknOrvQlJ+g
         ZAkrgOb5Z4e26L3cntz7DBdNcUm0MJmkG6l5MEIEOFHY6K7sm3KW++34p3p8gzcuidV9
         HEpV4gj7Hw7jKgF+cKhSFUK+WQDGeMGSAEEKLGl3BOOOj5eWouTZWawpiENhZ9aOHS4G
         y8EQB/5AOT19+OoT5XKdPYjcm+q+qvQYz8S8hzUlnF1Wej7hrfrLEZosqKUwhino+Mkp
         boVxM/H8EQx0UjZtv93ATw+qXKWPKAQ22LIQ8mOtTlYLsQ+Od9p04+JWUXnnDmcqobKh
         TB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680874115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llePgOmhGh4IWb8LWhk+RajPlS7CDIy7UmsGMTBqzaA=;
        b=eKOZpSp6WLNUn2ke3dUUJYaBMZZU+QbOTUfF7BGXMgg/POIE2wLyNUQZzQ85wanFBX
         /IddohdkDXdjGdON6zNTXQV7fBZdsD/caRCR/7MTKF0R3yjAk7gHj8aYilu24Iu0gEMk
         ye/L3g/5t5EPWIFWJ/qQ6L2ZwV37vAi4/Y+pJ5sS8JMY1iF0MP/u7IQRvcS9f47DIsBa
         65ZOO2KfirkyBY4CKSWHAVfgpjgz6kbEQR75cgTb/971qvvWBswdWTw6hWhqYWcfKDbK
         iifq9kom1ccP4orem7XzhG4rZySZ4zVQ6zxrKCB5cHyu9PULSNFh5YkEeSD1Y7fVIzK3
         /Tug==
X-Gm-Message-State: AAQBX9fCrkS9ykzay55QKEk2qdzuLpoqZLKXFKbpeNACzui+Ryg5lzqC
        3b4gOYbHQxTP4m519sj5AxTbWg==
X-Google-Smtp-Source: AKy350ZBU2+IVi4EkhIGy4Up7yOAsxRsnKvkuQMm67ALbuKqLn0D4GUuOG3n3GgoleU/9qzFInWv+A==
X-Received: by 2002:a2e:3607:0:b0:295:a16f:c893 with SMTP id d7-20020a2e3607000000b00295a16fc893mr613024lja.18.1680874115534;
        Fri, 07 Apr 2023 06:28:35 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e3a02000000b002a618eb72b1sm811031lja.98.2023.04.07.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:28:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 07 Apr 2023 15:28:32 +0200
Subject: [PATCH 2/6] dt-bindings: remoteproc: qcom: adsp: Allow
 firmware-name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-topic-msm_dtb-v1-2-6efb4196f51f@linaro.org>
References: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
In-Reply-To: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680874110; l=1008;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dWnjAZMJzqjimRi8bQ9g3R4fQYhXM8ZgJZOOjsidZPo=;
 b=ZQ8LDsV8IFCj7oNIKdE4Wf/XjVIGpWft9setIb/PWvyNs02B1LepgKLs5g40HQi1fh9+DtmdRNQT
 VsMDX0bxDcq+DhkC6P7f2SLCCWNKlpVc/en0jMqXufIW1K02/jFi
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

firmware-name has been with us for a long long time. Allow it to fix
warnings like this:

qcom/sdm845-oneplus-enchilada.dtb: remoteproc-cdsp: Unevaluated properties
are not allowed ('firmware-name' was unexpected)

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 643ee787a81f..d99618a9ca2e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -44,6 +44,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Relative path to the DSP firmware binary
+
 required:
   - compatible
 

-- 
2.40.0


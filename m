Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DC2C77B61
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Apr 2023 13:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240822AbjDGN2m (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Apr 2023 09:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240807AbjDGN2j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Apr 2023 09:28:39 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05D98A42
        for <linux-remoteproc@vger.kernel.org>; Fri,  7 Apr 2023 06:28:37 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id x20so43531900ljq.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Apr 2023 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680874117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grmIxSUAU0kBA7EJgdolRxlhvAD6xuuLCo/DeTKPOd4=;
        b=cOMmHlrGEbtO3yZ2betrRfYyhgeHSJqYgebKGG1sn5LOU3ZBjFwpqxrUgC4Dn2h+8S
         NofaV0W0HOITCig0UgxmDmjccOZe/hp967GmdVHkGZy3p7yMgnqr169PSOp6jBwaZcLh
         61IJuBtGB8EDgmTlzBlz7PunAp4XVGhE+OzDRid7GmPyA01dfw/UPoLuyguHpG89ofpk
         YT/57yooGXrwitCugYgAdvGauTV98U6auEpQrg0NGFKFX96eSTjos3xGqYfCB0smxFcy
         wLwNq1BqI9101d6XoYCft/VuULBvSj/oSAbmXhaNv1jSZarDlO5kascO3KDW1Xv8Eqyh
         IKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680874117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grmIxSUAU0kBA7EJgdolRxlhvAD6xuuLCo/DeTKPOd4=;
        b=d4Sw7P0VwgKq1oz8eQOqmLhXQypXTy2iRvR69e1veQ2l74d/8nqutWHgWQfPTChT6A
         5RQZTYFBZPtvX9z1aDVw1CnuJ8OtH+qVFaTqF7tOvq5byERveZCHLVuyhqlCiwukSu3W
         KcN8HFYW0NyLWNVWlMSdFotP0eJAbZmExBLxZ99ZLGgN1gkByedmMemSt/m5mztpcni+
         VXJ4Nd5rWtjfmQXGPMNHAvtiecfG2NpSMOrGPguLJ3CoXYZzOHHYDPwy5DIdiIpSLBky
         11/AkGFsAmBTC6it6MQv3glbtVjOyCaWX/Jc9aJy/q2QQTKeBxVsSc/hCIMRCFOmOd7m
         sO+A==
X-Gm-Message-State: AAQBX9eLTIg3Q7QpmnLxf4CuAz9WYzJZ9LXKQeDksyFtbxShqlJeLPgv
        T/bfNn67r5tgOjDCjop2+0LgKA==
X-Google-Smtp-Source: AKy350aaMgbaCCdcjWNyNhLf9oPTZzXicz8SmfDjO3HAgT62Q3Pdw3TK2UNh5tKA3icr4u1hUazx7g==
X-Received: by 2002:a2e:9851:0:b0:298:a8bf:a65 with SMTP id e17-20020a2e9851000000b00298a8bf0a65mr558843ljj.13.1680874117346;
        Fri, 07 Apr 2023 06:28:37 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e3a02000000b002a618eb72b1sm811031lja.98.2023.04.07.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:28:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 07 Apr 2023 15:28:33 +0200
Subject: [PATCH 3/6] dt-bindings: usb: dwc3: Allow dma-ranges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-topic-msm_dtb-v1-3-6efb4196f51f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680874110; l=844;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2wRiR7WEXmQZpYv5SNBYk0HTq2/eu6+iUQ50kZacv00=;
 b=0WYZFFcb41FKVZEjr+Rt3QZBW3WacDCF7a8sYWN6zVRRSIzFFLbR9KfDvAF4VFO4EuK1ln6sUm89
 L3qPPGO2AKdPUmSfhgE9qEydOzLILrexSR6oMm8BuEeOZutzOv9t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allow the common dma-ranges property to silence warning like this:

qcom/sc7280-herobrine-evoker.dtb: usb@a6f8800: 'dma-ranges' does not
match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index d84281926f10..3c3548f55797 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -55,6 +55,8 @@ properties:
 
   ranges: true
 
+  dma-ranges: true
+
   power-domains:
     description: specifies a phandle to PM domain provider node
     maxItems: 1

-- 
2.40.0


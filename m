Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF78CA0ECF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Sep 2023 13:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235736AbjILNcs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 09:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235800AbjILNcc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 09:32:32 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5BC1FE3
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:32:08 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-502934c88b7so9044902e87.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525526; x=1695130326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5TUXFOv6yn9qpDAW3kO5jAn0DGFePw29Rv/Qa+Dofg=;
        b=GUwYvW7TYXpM+51IA8ioyZdjor7F0OmR1JTfRAZQ/hSfoppZmd1R6meXI7tXnJMgJZ
         EwUpoHUrVroJFg8diOJBHvOURrK2u/OUWCGxKPY57XFCPxCkWGdSLvrmsUa0h393VWj+
         OjsayCgCOdzloxGL5BTE/Z7CVtmctum0NdPMd8XXwJ2HpllCqx14pOJBjdOjnKUxYCwt
         fspcGpDByO7y4qdf0Vaz/ikP3H1w8BZzfIs9FamWD452gd5qgtAn78S7nsK/9Am2QA9n
         OlFk3N/HqEvtbu52L11eABDp7CPoWoQ1z+8GSUnLRkMCjc/qetF7x/jM6BRGq1fX+aq4
         am1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525526; x=1695130326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5TUXFOv6yn9qpDAW3kO5jAn0DGFePw29Rv/Qa+Dofg=;
        b=mrgnl7W5ThXo09x/I+iZ2+V7F2Wp8D93Lr5doGPutGt5TAPlnZZ7szec7ynEqARbGk
         N+2qBKD5qijwYlu/RmBfgE+bNP/OV+O9pfPMHmuWkOxChbnDD3E4DT/zuSzNsS4/r9fn
         BMLYcZuLq3if8vwf/i92LprG5PKYZETY+TrG/QCoEZAykofLAElR7VsVPJgKabRZSj1c
         j3KjNxyyX5h3q+3LyCbWIeHyVvZeMX3cTVYkQw6C935FC+CXLsTJUAxhJZ7MYEul373Z
         8AhOaMb1N4tnp3XQh45l8tbEoceX8m92/93gHLZBA69DtEy0TvZ2d7u4GWvenMihPNzF
         7LwQ==
X-Gm-Message-State: AOJu0Yx1TtL3YtoTzfV7C9fdGWSgrM5g0kK3zFsrfu2ft6qAUIux6qU0
        AuoJC/6fAx2Vlgzz0WUc6ZxlkPWNTLL6RUVzuxssjg==
X-Google-Smtp-Source: AGHT+IHJT5ownOgbIaxSDc0bjTSHUboWqifcbF1bbRzUuxxzkufa54Qv6/pZdVwNX0+AypcHeAsw4Q==
X-Received: by 2002:a05:6512:36c2:b0:500:a2d0:51ba with SMTP id e2-20020a05651236c200b00500a2d051bamr8884352lfs.44.1694525526211;
        Tue, 12 Sep 2023 06:32:06 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:32:05 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:31:47 +0200
Subject: [PATCH v2 09/14] dt-bindings: remoteproc: qcom,msm8996-mss-pil:
 Remove PNoC clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-9-1e506593b1bd@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=1303;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=365nLiorSKhklpxOJKGzrpOJcjkDQ3JA1L7vx8xj8ao=;
 b=ySRL9bhp5qv2LV2atLTYfW8bK0jq1ULmiT06RNxNxp7RXo7yb3yJDGE30x8jvAVd8tI2P5hSh
 SmOedpd+V+SCvsris2NdjIHKDtQdhxNuBTsCKDJeGhS4i0WUKkpGulP
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The PNoC clock is a clock for the entire PNoC bus, managed from
within the interconnect driver. Attaching it to MSS was a total hack.
Get rid of it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
index 0643faae2c39..971734085d51 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
@@ -220,7 +220,6 @@ allOf:
             - description: GCC MSS GPLL0 clock
             - description: GCC MSS SNOC_AXI clock
             - description: GCC MSS MNOC_AXI clock
-            - description: RPM PNOC clock
             - description: RPM QDSS clock
         clock-names:
           items:
@@ -231,7 +230,6 @@ allOf:
             - const: gpll0_mss
             - const: snoc_axi
             - const: mnoc_axi
-            - const: pnoc
             - const: qdss
         glink-edge: false
       required:

-- 
2.42.0


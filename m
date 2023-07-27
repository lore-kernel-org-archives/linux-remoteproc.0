Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E55C05051
	for <linux-remoteproc@archiver.kernel.org>; Thu, 27 Jul 2023 17:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjG0Rde (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 Jul 2023 13:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbjG0Rdb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 Jul 2023 13:33:31 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34F230E3
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jul 2023 10:33:29 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe07f0636bso2173279e87.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jul 2023 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690479208; x=1691084008;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4JznAwqUwxEns3QHdYNhwDRE+I8wR/yzqEuWAMFbic=;
        b=PcWPtR9b1nCRdEFGVqDS0YR2Jo3PkQoX8nI9M1AfkF0XYnOGJ9iwy5lSWs4KI/aIJp
         jTqWREY0L8q2BRi5UNx3okPiXmoBCuGgz5ww5wlyY2FS7gvdkCGw9ll1VFyFWC9L+rNB
         RhccdqMW7iOj6rQNwb1KsL8/RomjhvKnWETd5t6X0u7/ntUCnAPplW2lST2TUk9bIpon
         s/hvV4NoBjk+W9Qtmca0BIUnIxezshpQM4u4Xl0FhhdOsD2uTgB9OoU/P4RkQm5EJI+L
         gSBq1F7EHJy89T0WBL9sx7jAo99uCRPm/u9fiY7SEWQ1+9O35/tj78scvFc5xCVF6JDL
         iRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690479208; x=1691084008;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4JznAwqUwxEns3QHdYNhwDRE+I8wR/yzqEuWAMFbic=;
        b=L/iArn7PTdNlbKzztVLdCnq5BE41MGUvzIccjcBSE1+VF5No2LF0jNWt9MgutUgv3W
         9qlSwDf7Y7FjVWAaQC+XZfmd+ZQdabp3E/1/hL2FAs/ycYNefdqrljNdJ9JTH3lkr3vr
         osIX20UZASr665IxZMIeuvfI7HbCoYytMXl/b9HmjKRH7iBYSmgsaYVSD2VvaAUhGblM
         21ve+JNvDwc7ATr++yIR7x+qR0wQubVCfgJ43iV2BmhY5/It2qDxiOo7ZF+lqWWbamf5
         wBb2AmWw+jFEyfBN/+0YBKjTCKrhuQb3biiHIFmXKl8W6QJqNPPjGCt043vKKmHDmGQw
         T1nw==
X-Gm-Message-State: ABy/qLaeGITtHawBdF7XK5lasRH3XWZMLQl/PoF6+pfiGMQkTJiaj1CE
        j60HwvZZpWKgi0LurhYNOO4y6w==
X-Google-Smtp-Source: APBJJlHwcmw/KyFLe5ksFAFNL/2577EugKUqrVekH06+MUX621YSkGula6cTwfUp9vkFCLLrB/ayGw==
X-Received: by 2002:a05:6512:1152:b0:4fb:cabd:2a66 with SMTP id m18-20020a056512115200b004fbcabd2a66mr2329775lfg.21.1690479204174;
        Thu, 27 Jul 2023 10:33:24 -0700 (PDT)
Received: from [192.168.1.101] (abxi99.neoplus.adsl.tpnet.pl. [83.9.2.99])
        by smtp.gmail.com with ESMTPSA id g4-20020a19ac04000000b004fe07f06337sm412089lfc.53.2023.07.27.10.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:33:23 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 0/3] SM6375 remoteprocs
Date:   Thu, 27 Jul 2023 19:33:20 +0200
Message-Id: <20230725-topic-6375_rproc-v5-0-a8e9cde56a20@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGCqwmQC/32OO27DMBBEr2Kw9goUP1LkKvcIjIDix1pY5gpLR
 Yhh6O6h3SRVyjfAvJmHKJExFnE6PATHDQtSrmCPB+Enly8RMFQWSiote2VhpQU9dLq3n7wweTB
 J9sYNKjmbRK2NrkQY2WU/1WL+mucaLhwTfr92Ps6VE9MN1omj+7W3cmi17UzfaD0oZaCFK2V2o
 Qn30SO9z5gdU0N8ee5MWFbi++v5Zp7if05uBiQEa+Ob64JMNv2Vnfd9/wFUYHvxCQEAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690479202; l=1994;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=61U37Uw72v05UEzFluxQektiVeexmyoM4WiivXI068k=;
 b=pAnAQak2rce0Y4N+KN1l4zAW9NFfM1BgAT6ebdaiESIvsmaVZ8eoT3T4AIt0zFU7+X9jTwtly
 YLn2VPCD6aKCrY7/gR4y9JdM6muNRMuOuZ1GiMYOCd7oIpJN2MlQD0O
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Resending as the previous revision was mostly ignored on the rproc side.

Changes since v3:
- Pick up krzk's rb on bindings
- Drop patch 4 (applied)
Link to v3: https://lore.kernel.org/linux-arm-msm/20230109135647.339224-1-konrad.dybcio@linaro.org/

This revision merges two [1] [2] previously separate series,
adding SM6375's ADSP, CDSP, MPSS and related bindings.

[1] https://lore.kernel.org/linux-arm-msm/20230107120623.1903056-1-konrad.dybcio@linaro.org/T/#m89d629bd788593dfd27e4dbf0cf0bf94ffd0a7ce
[2] https://lore.kernel.org/linux-arm-msm/622afd8b-a469-4c95-d2b8-030e47b0cac2@linaro.org/T/#m17aee8f3a51cfbd3f92fe2b4dd48b3722a6a0a7e

Konrad Dybcio (4):
  dt-bindings: remoteproc: qcom,sm6375-pas: Document remoteprocs
  remoteproc: qcom: pas: Add SM6375 ADSP & CDSP
  remoteproc: qcom: pas: Add SM6375 MPSS
  arm64: dts: qcom: sm6375: Add missing power-domain-named to CDSP

 .../bindings/remoteproc/qcom,sm6375-pas.yaml  | 137 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6375.dtsi          |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  18 +++
 3 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml

--
2.39.0

---
Changes in v5:
- Fix up bindings atop cee616c6884616aea3be72a9debafd0614332682
- Drop krzk's rb from patch 1
- Link to v4: https://lore.kernel.org/r/20230725-topic-6375_rproc-v4-0-d55e8a6d0f5f@linaro.org

---
Konrad Dybcio (3):
      dt-bindings: remoteproc: qcom,sm6375-pas: Document remoteprocs
      remoteproc: qcom: pas: Add SM6375 ADSP & CDSP
      remoteproc: qcom: pas: Add SM6375 MPSS

 .../bindings/remoteproc/qcom,sm6375-pas.yaml       | 145 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  18 +++
 2 files changed, 163 insertions(+)
---
base-commit: 451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
change-id: 20230725-topic-6375_rproc-4f074a92fa5f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


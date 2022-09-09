Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40311ECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 12:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiIIMyL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 08:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiIIMyK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 08:54:10 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1343102D6F
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 05:54:08 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bn9so1699073ljb.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hTrH8cxz4TSt0Asuh6c/k+xs7+a/jInDKisWbl+EQh8=;
        b=gSdcGzjbp8X3KMvgs6TWzRwjpGsMhhIG8h3/ZDTo5lrvCeBt3vCFp5p7mhbh676Yyc
         /6hvNi0J7WSCdzyjYK2uXHA1L5XUNn1FVY8g32JN7tb4NcUfguhQAmRceqEFtFfQZ7Zp
         g6WBiiXRNv+N0S4W3luJa0YSuP0E14OtvyVHpVFh+smVmA9kXTTXqn6uWP12vQsRmC+Y
         pd6Cm9Aj3Ir6nXMFKuVsm8VcCogEicWcDOMkZa+kegJEnhoFh24Q+Cvy+qAwkz9PFTB+
         zfUt9W2NWpAA0+KP1DLdO9wDCF+/YGZRaJiK90fHJyuPSqTkVwdQHGKmhaF01KholSF1
         rJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hTrH8cxz4TSt0Asuh6c/k+xs7+a/jInDKisWbl+EQh8=;
        b=RSK712XHDGfZGQJF1s37adc5Yx/5jrFGHMK8PL/+45xQbtXTeqinvJay2b7rD8oqYY
         RN7IHcfZ1I/7qzEy5K0MF2NVYgZf50f24IMn/1PIre0XX/fGWDXquRwqtazMtL00D4Xn
         jE10lNG5ClbqRGESHF9QCX3RN1z4JMMamLMceRdS3gYS4XJRiAzE9L+Ysmyv+ObeKEA0
         TxJdFNt4xzNHx38hNfvXnr/ZyCren4sD7mREg9f2QQ6qeiYhHqVF3Q2xJ7xrkYtbD3DZ
         sCA2e0purID4Ot0d/lfPAkCuxUgu4TY9aYbs862LnmCW2FeuR9s+UQ1CpN91SdsVGUy0
         ClNA==
X-Gm-Message-State: ACgBeo1WmysCdrCMt2eCjgfYoNb+ISQnZgJXb2jTadh2l86JqKiFINka
        kIjc10GdtJlqTcOsqxLUYaUfxg==
X-Google-Smtp-Source: AA6agR4cN9CSdqcVsPvUl3RBLFSual+P6TIqZqeYPwj9++BgjrtxAOQ64u4ljSl6s18VVn0/UGmpIQ==
X-Received: by 2002:a05:651c:2383:b0:26a:81e6:2590 with SMTP id bk3-20020a05651c238300b0026a81e62590mr3742389ljb.346.1662728047288;
        Fri, 09 Sep 2022 05:54:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a2eb0ca000000b00263630ab29dsm64750ljl.118.2022.09.09.05.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 05:54:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] dt-bindings: remoteproc/misc/qcom: stricten SMD/GLINK
Date:   Fri,  9 Sep 2022 14:53:56 +0200
Message-Id: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

This depends on qcom,fastrpc.yaml conversion in Rob's tree, therefore
everything should go the same way, I think.

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  dt-bindings: misc: qcom,fastrpc: correct qcom,nsessions name
  dt-bindings: misc: qcom,fastrpc: add compute iommus
  dt-bindings: misc: qcom,fastrpc: restrict channel names
  dt-bindings: misc: qcom,fastrpc: correct example for GLINK edge
  dt-bindings: remoteproc: qcom,glink-edge: require channels in children
  dt-bindings: soc: qcom: smd: restrict child name to smd-edge
  dt-bindings: remoteproc: qcom,smd-edge: define children

 .../bindings/misc/qcom,fastrpc.yaml           | 25 +++++++++++---
 .../bindings/remoteproc/qcom,glink-edge.yaml  |  4 +++
 .../bindings/remoteproc/qcom,smd-edge.yaml    | 34 ++++++++++++++++++-
 .../bindings/soc/qcom/qcom,smd.yaml           | 29 ++--------------
 4 files changed, 59 insertions(+), 33 deletions(-)

-- 
2.34.1


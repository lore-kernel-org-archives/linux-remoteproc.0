Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC247C43217
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Nov 2022 10:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbiKPKUL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Nov 2022 05:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233202AbiKPKUJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Nov 2022 05:20:09 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF72201BD
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 02:20:07 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id w14so29101570wru.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 02:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=4GbCp2O6gNlxizJu7Tt319PycX9j6Cvapw5rEbbaWYE=;
        b=RB85ZkAGAFgykfXmTuudVziBYc58FcKva7Q9NIeE4NNXNbDzCI+EBB5ZuflomH6jHu
         JLh7DyBRLwEuRSq+ofCabRSVYbpQesOeg4RopB+BK0QlvglDJme3oRrccBfDF4K91GYL
         Y1IfaspOXiJ8Hq9lWVU9VRYD+9v7jzYGLGB3fGCwsnAlFgqiuAqbL+yMV1I06a7ueH6w
         gPV14v6ySprwnuZllMArBEjAhJTpDaT8eWlgfMGdkUZHewnF/EGHQVx9x0Nyoavtslx4
         R8EsZ0OYWOLr4+o+RfaECQqZko/jO+FaNmSL+WR8DeuTMO88nAgBwhouVAfgz/qJPa24
         3zZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GbCp2O6gNlxizJu7Tt319PycX9j6Cvapw5rEbbaWYE=;
        b=b3eZUkSHKdtecE/E8QUDZ5pBM4RHP39hrgpPLVoWNvdPkF4gmWx4oi4wzweiZM+zMM
         f3kkLhFFnIotG5wHfAQIr/ecTHnU6t4Hv7WaJoURZ/nEwxmaiiyIuJ5jzwylVcIMZMoQ
         I3shn3WVyahh5fppI64NrCdjUx9APZNJJxrZT1zg9SNIE52/Qs4yBa5Dirwk1yJ4UR4m
         5DnvKODGtIGIZYg0+sVVBWoe+edpq/YOmMuJRHgY9o1es1lWRR76RMHuWeZflWJfOT+7
         I8Z9NUvzumuYT2b0zHD0DHipf3flxpNuEK929OfGNTyXsMKUpGOPHwfLSmbpIwzZ4DqB
         1I/w==
X-Gm-Message-State: ANoB5pmXZg6g4TJ+uQqlAscFbKjHRsCprhoHy77wK+W5Q4xwBvV/lA4l
        zyA31bpkVjZOdX+dq5sCplfoOQ==
X-Google-Smtp-Source: AA0mqf6bXo/yUx9vllMy2Zq5WppjBrpj28lotzV7nTNpErTa+jQgcdFkjyxBPN6r37AINX/Qmu1lhg==
X-Received: by 2002:adf:fcc7:0:b0:236:8dd7:1917 with SMTP id f7-20020adffcc7000000b002368dd71917mr12916241wrs.587.1668594005978;
        Wed, 16 Nov 2022 02:20:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c4f1200b003c6f3f6675bsm1709900wmq.26.2022.11.16.02.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:20:05 -0800 (PST)
Subject: [PATCH 0/4] remoteproc: qcom_q6v5_pas: add support for SM8550 adsp, cdsp & mpss
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAFO5dGMC/w3MQQ6EIAwAwK+YnrcJICbG3wAWJZFiWt2L8e9ynMs8oCSFFJbhAaF/0dK4w/4GSH
 vgjbCs3eCMc9Zajxyk6iWNN9Q6T5PB++ymUFGototOaQln4/OYYxx9zNCvGJQwSuC0943v43jfD9pd TC58AAAA
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:20:03 +0100
Message-Id: <20221114-narmstrong-sm8550-upstream-remoteproc-v1-0-104c34cb3b91@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patchsets adds support for the aDSP, cDSP and MPSS found in the
SM8550 SoC.

The aDSP, cDSP and MPSS boot process on SM8550 now requires a secondary
"Devicetree" firmware to be passed along the main Firmware, and the cDSP
a new power domain named "NSP".

In order to satisfy the load & authentication order required by the SM8550
SoC, the following is implemented:
- "Devicetree" firmware request & load in dedicated memory
- Q6V5 prepare
- Power Domain & Clocks enable
- "Devicetree" firmware authentication
- Main firmware load in dedicated memory
- Main firmware authentication
- Q6V5 startup
- "Devicetree" firmware metadata release
- Main metadata release

When booting older platforms, the "Devicetree" steps would be
bypassed and the load & authentication order would still be valid.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Abel Vesa (1):
      dt-bindings: misc: qcom,fastrpc: increase allowed iommus entries

Neil Armstrong (3):
      dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible
      remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading
      remoteproc: qcom_q6v5_pas: add sm8550 adsp, cdsp & mpss compatible & data

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |   2 +-
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  60 ++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 199 +++++++++++++++++++--
 3 files changed, 246 insertions(+), 15 deletions(-)
---
base-commit: 3c1f24109dfc4fb1a3730ed237e50183c6bb26b3
change-id: 20221114-narmstrong-sm8550-upstream-remoteproc-804f3fbb34bf

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

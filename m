Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1E7C77B61
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Apr 2023 13:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbjDGN2g (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Apr 2023 09:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjDGN2f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Apr 2023 09:28:35 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBEB83FF
        for <linux-remoteproc@vger.kernel.org>; Fri,  7 Apr 2023 06:28:34 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s20so23249988ljp.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Apr 2023 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680874112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQBrT693IMyw8NXc3/LuFzvk7FqmU/zQ20PRIEg0JBA=;
        b=BhAuGFkm7Z0Dk0sWW58yFSVdvbmwo3bezMeeCVSDvB0MGnNQGYS21BcCvQU/+hL6Jq
         UhRW2wiMHrBww3yim/pjJiTmifunGLJiVl1MiOyA8s61wX0kKSXPgu/aTAFxIOOYk+Pf
         8XOXQa5+kOGs7uCUa2cCaM8s9HhqAhc6OcgA3AC9zYxcvxaPT2c6GatMO6xDZWKs8kQY
         nSDPvIRheNugYDQLwUbt2OANwgRus7KTt7wmpGjeguHXp92/6+CGHOjz4dUp0+0RBOUq
         QNkzwnlHNWpJF38KTmQbaYJUE1fASrBuNjeEdGfcAFCZZQNr7JbdDG/KFOCszRAea92H
         jupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680874112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQBrT693IMyw8NXc3/LuFzvk7FqmU/zQ20PRIEg0JBA=;
        b=m9AQ71RzxduGd1Hp0sxsyuGOYoymrTmL3S5WMRMvBz8iofKFlPbQqRm+TmpKUJc4gG
         0s6zCb3I7x/cWIKsw2GpScQt1zF/URNsLEQFDqMoYj+7ZWKIstYrWPPg7dt59eCRZ0JR
         zGYaZeV3bpJKQ+M8akW/QsQP6i35GH/wdMIiA34h5J02pWircQ7SZ9rqyLQFFpWOtesu
         rbPj87v2NAYHN/ooImaMWeRqvZKBrgHUuOAdt8Xm7lDxbOKS13EKV4kEDkHNhjHI5cUn
         RViQqHD09CWH+iegZpTKWFYyhdesYqyi7vC1tEw7pwUF3TIUAe8xT6PfliClpvHxbKCt
         4qrA==
X-Gm-Message-State: AAQBX9dtx7Pge8dXiw7ODJ8xGyxIxlO5PFllk7K/+nwPVBpApV1SNKrT
        ZNIV3QG8aSnJcu4rvc8Tfskh3g==
X-Google-Smtp-Source: AKy350YmuhzUBxWUp60ovcUDsPlJFsBLyczP0oGDo4ISjPF+jYKyyt5nWKv+Dmxe0wdKjdJvsar7dg==
X-Received: by 2002:a2e:8001:0:b0:2a6:2444:9892 with SMTP id j1-20020a2e8001000000b002a624449892mr668944ljg.25.1680874112332;
        Fri, 07 Apr 2023 06:28:32 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e3a02000000b002a618eb72b1sm811031lja.98.2023.04.07.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:28:31 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/6] Couple of bindings / dt fixes
Date:   Fri, 07 Apr 2023 15:28:30 +0200
Message-Id: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4aMGQC/x2NWwqDQAwAryL5biBNX7ZXkVKya1oDuspGpSDev
 Us/Z2CYDVyzqcOj2iDram5jKnA8VBA7SR9FawsDE5/oTDecx8kiDj682jkg1cy1XFkud4LSBHH
 FkCXFrlRp6fsip6xv+/4nzXPff6id8El0AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680874110; l=1182;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9ZXqfxOQy7I2vZ6V/C5/H9u0lqdYqI+mn97VyDj4Pf4=;
 b=7g+tFK1DIvw8PBgY5f/XwdyP6/5uKgfC6fcEf6XcQ1SDfP+/cDy/PnluuI/fa3zPlWlcXL0B0zR9
 qZFl+EXLBc9Ov11e6TfAyDILL6AbIDlGhUQUuw0SVi1rAGfVLGdT
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Couple of trivial fixes to make dtbs_check happy (happier).

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (6):
      dt-bindings: media: qcom,sdm845-venus-v2: Allow interconnect properties
      dt-bindings: remoteproc: qcom: adsp: Allow firmware-name
      dt-bindings: usb: dwc3: Allow dma-ranges
      arm64: dts: qcom: sc7280: Fix up the gic node
      arm64: dts: qcom: pm8916: Fix pm8941-misc node name
      arm64: dts: qcom: sdm845-oneplus: Fix speaker GPIO node

 .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml    |  8 ++++++++
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml          |  4 ++++
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml       |  2 ++
 arch/arm64/boot/dts/qcom/pm8916.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi                       | 14 +++++++-------
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi        | 12 +++++-------
 6 files changed, 27 insertions(+), 15 deletions(-)
---
base-commit: e134c93f788fb93fd6a3ec3af9af850a2048c7e6
change-id: 20230407-topic-msm_dtb-08228a62a590

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


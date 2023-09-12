Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D49CA0EC3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Sep 2023 13:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235678AbjILNcM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 09:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235620AbjILNcC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 09:32:02 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DC310EB
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:31:56 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50078e52537so9505096e87.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525514; x=1695130314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aby31Dy3sRvYCseJbVFaOLlk+QjTt8y5N0c9zPR8ufo=;
        b=GFSqj6Jhz8YAMbfbhs95DcdyYLUIo0JBtYfFJT7cuiOnUEMcA/xtu1TAuWznKJxl/1
         z+0Hby1MjEkNFUNp9GNEzcabpWizCHvhII2xB9b2ZOxjq7m0lbt9aAp5fGpzvlH0c9iZ
         kqzJ+GR5Y69IFo2D3irTLsM2VtUIwqaYJhKeA2vHwUVtlS/OXJnUsR2wFQmaSpsEbi/B
         XHP8V4pYObYWKfCeLo8/PYPNhJCT+CrYNXJaE/6hyc18zTBgJ/gPvODOAgGGkOGEo1B/
         zYTCN4b4M7DsKJ9lxzKbXnyaZe3zCH5hEfc+QOVilzGhbumFKoAizUVoYWX3cfbxibfH
         JePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525514; x=1695130314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aby31Dy3sRvYCseJbVFaOLlk+QjTt8y5N0c9zPR8ufo=;
        b=TqZOs1UjPpUsIfP5Cq6GzIEL5BWgo1HGu3aZiY62E0Ciz5xdrriEM0+Vb7blk71VkX
         XD6u87p2+M/CSuzgr8Cg3VO9fP7Zxx+Pg+9Ps4CgQ4rfSXpTNaD2f84gUyxSW2HmqXVK
         CDbSzXpxlt8rbIFvedjzVRH8uYhmaRn0eV90daKauHAKSKV5Y9rb4UJXzIVN57weNRI3
         vNIDIfweVq+SvfgmjDWZNzVyaeCE6PFS86FlMSEM40smMQRu41KoFJADCCFPm3RZwGXf
         vShF5AzkdlEp2Xcu8ZkEMYCxmqoi2v5/ECHlCxLOzakCCcsXXAAf8SMXH01EYHvC7DXy
         eLCA==
X-Gm-Message-State: AOJu0YzXdjukc5cnhA757mWuJAErik3oISKRy6hqSeZYWSm1IS6qCUWA
        MpNQ2Aup+Xfg4oitDUxIO7rfdIY16LhX8Mj4cWFk9A==
X-Google-Smtp-Source: AGHT+IGitYmBkgkDWLSUP/hqdunkKg4+XgDzDLG69n03cDAVQWkDehzLwjYkdh+olbp2hd4+BN7ZaA==
X-Received: by 2002:a05:6512:3082:b0:4f7:6453:f3f1 with SMTP id z2-20020a056512308200b004f76453f3f1mr12382111lfd.15.1694525514362;
        Tue, 12 Sep 2023 06:31:54 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:31:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:31:42 +0200
Subject: [PATCH v2 04/14] dt-bindings: arm-smmu: Fix SDM630 clocks
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-4-1e506593b1bd@linaro.org>
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
        linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=1204;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xOXLCwUDc6wbp5lgmZN0L2nK0COMDmBWvidVIRQZaEM=;
 b=9rLnt5RKSrJMRFdngo5FKCbjpslTV8Cgk2lRTkIJu0MXN2kamhiEW4QKh2iqUto0uklN8jmmB
 RJYZYYDcHW/DK8tejnqcKw+w+Nc+bm6mUhq241rpD7dt2X/C+0XTq7z
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SDM630 was abusingly referencing one of the internal bus clocks, that
were recently dropped from Linux (because the original implementation
did not make much sense), circumventing the interconnect framework.

Fix it by dropping the bus-mm clock (which requires separating 630 from
similar entries) and keeping the rest as-is.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index cf29ab10501c..b1b2cf81b42f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -270,6 +270,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-smmu-v2
+              - qcom,sdm630-smmu-v2
     then:
       anyOf:
         - properties:
@@ -311,7 +312,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sdm630-smmu-v2
               - qcom,sm6375-smmu-v2
     then:
       anyOf:

-- 
2.42.0


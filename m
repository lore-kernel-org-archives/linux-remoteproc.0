Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124A6EB64DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 21 Jul 2023 15:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbjGUPhB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232102AbjGUPgq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Jul 2023 11:36:46 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0ABB30ED
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jul 2023 08:36:27 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so3435856e87.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jul 2023 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689953786; x=1690558586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ytx6skollgD4Zg1m5VdiBVnUPGosx4aLRWdCtyILU8I=;
        b=bJ2VhiB4MPs4/cBw/DhYOWkp86OW+Jklj4kSu6REZPu6cyuBahnV4yU9CzAB8j9Won
         0QJd6/d/wU7/UvV9ezY55CuerAmFwKpFte62LGBUI6xnySv8ixAikibWOrYOxVil2Z+M
         7Qn0Oi6XDJfHip4fDt3qxo2RvLbP1q78pmjjAvKpiwOmrAGWVT77EV3cUgeMaoWd3eah
         kk4QX9L7H3hMySjcnPW7br+sfPXxjq3b1NmTjqs6PsDD5Hguev+Ugf78S74l+wWCz9jX
         3PFRGwrAtNzRMeb17W1ULOECySQbJ4qEq8biDFjQK9Vo8Bzu13U6/aKWmwcVd+SKiS46
         t/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689953786; x=1690558586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ytx6skollgD4Zg1m5VdiBVnUPGosx4aLRWdCtyILU8I=;
        b=XkIEs1Rrc6C0qITZIfM6Z9MInZRFYTeEgOkUXLl43hseujo5a+GOXRJFqyYMpxGSFg
         PPxamLgNjFhWTpjdYTw6CnQkv3ouExHsuHyWh5KYQg5gM8rQVEpHWvO/fesC0xVHjJHU
         o0odv4f0vuOupjbVJ/pmebOAijiJY0NH+1gGDDrBEUmJ0mKusQV77ZqBaKO/xKcQrUCc
         5fRheMcT4dpaUUb6iPP0ryTWo5KBuqhruhqXjUAjbBZEzofjolObqlbqxNbor6xbVald
         eRIdMIiqpaz8XV6voI7u66KEIxjdeOza1Or8LzJI9oSRBqCuhJwjWuNrDfwBKwgje7kX
         coKw==
X-Gm-Message-State: ABy/qLbcGlT/+HvPyz/dK67IWDULwDRhluPtyuTvJOOxITHnlUNxHUe2
        Whb9codm/L/OMnvmzlIqyDYRIg==
X-Google-Smtp-Source: APBJJlGBsdMAo8vkO9FRjMoins0r2QRHghORQuVx+7R45F8dOTdw1ULKkbpPfR+FlaVpXMMG3um2SQ==
X-Received: by 2002:ac2:44c5:0:b0:4fb:85ad:b6e2 with SMTP id d5-20020ac244c5000000b004fb85adb6e2mr1570162lfm.50.1689953785787;
        Fri, 21 Jul 2023 08:36:25 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id t9-20020a19ad09000000b004fba1278e6dsm782535lfc.107.2023.07.21.08.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:36:25 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Jul 2023 17:36:12 +0200
Subject: [PATCH 09/11] arm64: dts: qcom: msm8998: Remove AGGRE2 clock from
 SLPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v1-9-cf6cd5c621d5@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689953767; l=889;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yoWJ6GJyGYGui/AX8S84WLQnnG8TcTYdKofjI0ZYPxM=;
 b=sOTxyrH/SrdxXhWJ/GGTUPkJKWi2aeEF4LleEEjzYHyZQp8h2j+VrdYpbCzqLlQIzfaFHn7YB
 q0/mOioPakXDdWdhGitCOCXbjVgOF4uz32zBf81FjD/dNXKo5Gzn9ci
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The AGGRE2 clock is a clock for the entire AGGRE2 bus, managed from
within the interconnect driver. Attaching it to SLPI was a total hack.
Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 360fe3edcc08..547c3f9654a6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1599,9 +1599,8 @@ remoteproc_slpi: remoteproc@5800000 {
 
 			px-supply = <&vreg_lvs2a_1p8>;
 
-			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-				 <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
-			clock-names = "xo", "aggre2";
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
 
 			memory-region = <&slpi_mem>;
 

-- 
2.41.0


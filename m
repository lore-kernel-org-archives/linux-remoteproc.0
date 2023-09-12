Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67339CA0ED7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Sep 2023 13:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235910AbjILNcv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 09:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235682AbjILNce (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 09:32:34 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9669E170B
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:32:10 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-502b0d23f28so4595166e87.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525528; x=1695130328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiGJwPcZWY5VFG9v0qbCB9581xCL0QMtTuQflRx2rlo=;
        b=rwlspgKbTHeAoR8D5UGzJVuOKstVV9HkEf9GzwtQFU3ksup5wu4ZdwN3B6oDHDcojo
         lXihjRpbymdTbRHaVPz9+KEQskfGmIpNGRd+L8qzvhWZ8PuuIpXCu+wumDPGL/OZCjVo
         WwmFsCHbif5j1L3ItbbOf07t4LeBQ0iwnPyc5omlyYGXZ+4VTFjFfFP57eHXSDk0g/yG
         iRwyqkarTuOMKwYChxOnfwK8ukAmRLweuhamoBLRROZIMvTWz7XnGCQJFQOYvHuI8Jf5
         isKkOjwvLGmNE6oab3KJZTXOw2toU4H4Fits7yT30C1ceKK2BDbYQnkeZKKswodKMV0n
         Cmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525528; x=1695130328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiGJwPcZWY5VFG9v0qbCB9581xCL0QMtTuQflRx2rlo=;
        b=RoeELHQqyxQknj9umhqMEBzUQzay3oz14g+kw6DVGc78D9xMP6QQ0gqZgCiqGQbbOT
         fwkvFzi1ZaURv/M1VllqIUbyC+cRf5kFrz/5enTLKCu9u1UjIQKtaJNqspHiTRT4cgTa
         KWUM8tmJOOpOReuT7prJWJ2y+DmT27Wckxs5fKKwlacG2XfDJomWkg/PxKce+tNqH8+F
         0TCwMgCFoR25/RB3A6sWW9IQoiN0aSkbNsg7Uw7LdssqjTr6P1WcubeiIE4c3Z/uD3um
         1fzXdlKmQlrVCBQSXY4F/C5/0UdvM2E6BvBxHP36Wc9z6FgSCFkdlpy9l8CpaTcTvfxh
         S1qw==
X-Gm-Message-State: AOJu0YzJyRMxp9UwGgZFKXsX+xhMYxWuPya8ayV/ufFYpldpNoN4bZRV
        G9A/QxBycWC0DbElEUP7G7F7U04TDReEa6D1oOLVcw==
X-Google-Smtp-Source: AGHT+IG7MGV+5yfrfIbUAxlq/0SmpPmXJT7+m3AUNMaYZswy9Ud9cLdNvH7ShAE6dHY1LLBW3r7AlQ==
X-Received: by 2002:ac2:48b4:0:b0:500:ac0b:8d51 with SMTP id u20-20020ac248b4000000b00500ac0b8d51mr9236642lfg.37.1694525528735;
        Tue, 12 Sep 2023 06:32:08 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:32:08 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:31:48 +0200
Subject: [PATCH v2 10/14] remoteproc: qcom: q6v5-mss: Remove PNoC clock
 from 8996 MSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-10-1e506593b1bd@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=688;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=aEImegp4VH04wiEIbWvbE829Mpli30o1nbaGMff5Zgc=;
 b=AVtSFIWouOh61cF+kWzE/4pk4pk1JFUIbhy8p+mvaicS0P3Fv0cisTztSIqBouk5Z2VD03M5t
 DbdGLDFX0efAVTM0Ehd1vRbWtAp8k8qq+I2pe2bSWW3P6lQurp2F3iQ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The PNoC clock is a clock for the entire PNoC bus, managed from
within the interconnect driver. Attaching it to MSS was a total hack.
Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 22fe7b5f5236..394b2c1cb5e2 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2322,7 +2322,6 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	},
 	.proxy_clk_names = (char*[]){
 			"xo",
-			"pnoc",
 			"qdss",
 			NULL
 	},

-- 
2.42.0


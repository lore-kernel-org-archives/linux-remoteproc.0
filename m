Return-Path: <SRS0=SCme=63=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D0CC2D0F8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 00:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7166420753
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 00:55:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJOeK6k1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732118AbgEMAzh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 May 2020 20:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732111AbgEMAzg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 May 2020 20:55:36 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7EEC061A0E
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 17:55:35 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id r14so7235913pfg.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 17:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8wwa3jMzBsVMJhoFoeC5HT1Ng/t6lRTgcx0Z6MLydpE=;
        b=LJOeK6k167T0qHY/gHMk23W6JRgArf4RIgYDYeFgTsfbhyZqu+osvBhNLNcuVPjbKy
         PG/guFzPEwywB449YFQpC9DO6jCJtzM0O7yOGK/mIVmS4ECi4TtLmxARO6QqV3fnEM//
         Jel0ZKNx+9d6UXfedIsiPRzPC9phkUE+gKTkBAO++xhgPvoBwVSljFo/pYjYqRdJPSFB
         jj8H+/dCw5hsa8VYYbe/fiGFxSjwh82/FyOh+nhoezLFEdezhwbpQ7z107Bjc4EAdfjQ
         7l6TTbXKLuAKvoj6j3d9vpQ1z4qM7Jf08DmfIaCwEY8uyE3GxHBTKO+mBCQY9MeZcTTm
         WodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8wwa3jMzBsVMJhoFoeC5HT1Ng/t6lRTgcx0Z6MLydpE=;
        b=Ej2yFm5xZPqq1e97F/KAHSII5oNtuLY6cyq9uD+IHAIZKlNC3SJvUUSBpGfolqU33M
         Uf0FSGNGoTuqZuVuhCRT1LvF8A+XYqWZzDUL2A735boTx2Ct0QnutQ9dMRSwIicbWHC7
         DWrxIOj0k7TNXgqXnIiXSLYLw332efyKL3i09SXJEV5ur9sF2CQM4qvHkX73nChXInY7
         +i12t5K2PPxRGIWZ7jf3cRaHOaX56SjryCfik4ZdfgUentpYpzgmNr00mP7rVTB3nmA7
         uaMTEmpQuGeGYZ0ZKz2m0V/OnfjvmIe1HrHLdy7IItBJwzD+ppWG96rNY0Cg6YX2ea1T
         f0tg==
X-Gm-Message-State: AGi0PuYOWoiCEZ1sVRw12tAfZQCOE/uYdiWtbF4DGCH2V0JLkZsSsJ+s
        6AcRHFLKnf1BISJrb9gAPZMTwg==
X-Google-Smtp-Source: APiQypK8A9XkNcELLFq9SHtAPbnP58OXlvL1We6HYrbyzS93bOuj6d8WCwO3j1pBijtX2cVIhuXkqA==
X-Received: by 2002:a62:c1c4:: with SMTP id i187mr24691197pfg.319.1589331335353;
        Tue, 12 May 2020 17:55:35 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm11057428pgh.25.2020.05.12.17.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 17:55:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon
Date:   Tue, 12 May 2020 17:54:41 -0700
Message-Id: <20200513005441.1102586-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Now that we don't need the intermediate syscon to represent the TCSR
mutexes, update the dts to describe the TCSR mutex directly.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index ecbcf725fba2..6e28754705b9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -146,12 +146,6 @@ scm: scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
@@ -569,9 +563,10 @@ rpmhpd_opp_turbo_l1: opp10 {
 			};
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
+			#hwlock-cells = <1>;
 		};
 
 		slpi: remoteproc@5c00000 {
-- 
2.26.2


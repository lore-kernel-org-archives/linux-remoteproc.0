Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307B321B441
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652187; cv=none; b=RAMPaRg5V++qC2XQv1g2WafEmgCNjK4zME8yPmu8atyMqlXujHhlIP2vsm6IZiWB3fm2RvR14X8cNMKKNziAA+YkiXBYaSL0p6jkzdVmA+aTL8DtkoT624ngL19FZSFfIBS2sJmys+B0/rtcAkUD+o+DscSpsJrFodaeDzpSj3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652187; c=relaxed/simple;
	bh=J4xZfv0aBPmZUKd/vkSpTrvNwZXicEmiz2DyP7s4fn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0G2Q+nJiSzlJbMdwuhOy00TH01g+lYohpEQ+CIuUZ3oDtdfwvTMKtgXDgRJ4C2cgZjEKbTjJ67jypWzXg6XGqLK2hzQXedhVd/KJyJBi07INu5RiExqsYs74Tcp8fPEgvwnw3u3WZGYXq0mKvP6M2Wulx7BfxYylWbuOV6J5wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CGdyIeQJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CGdyIeQJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4311d4762daso1151735e9.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652184; x=1729256984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqrKaOgTrk5zGkRdbTZV4VPhrGZkf7sOsanYq3cQGaU=;
        b=CGdyIeQJq9KRBZzrxgkaDZ4K/hDO9AIE1sLnqUF9dDoiDebvAk6ujeaDwvnwDZnDBH
         NUVKUAVcKyMlrhDxXT2qyEKLXP9wWccIV/he76+kZdlpOA95rn+mO94dHzr8oL71BDwI
         Ez0PbldBEbCzC4wlyXAUmiBO2QGPxmSRAZc3xqffvGVsaFPK5ZYVWa7mf8GYn/R6StAz
         E+3brsahSSLhJ9/OOj2CgbfQlFH57QMIld0h1b6aXyU3GHxA+x7FWyqQMTaPHukQdyCj
         99pmH/GPe8wBgoaUUFhSCxwsYRyvCn9WRUqH07inlu0PBz6em8wbk3Mh5WJUYePIxhD6
         MrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652184; x=1729256984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqrKaOgTrk5zGkRdbTZV4VPhrGZkf7sOsanYq3cQGaU=;
        b=RfV+fh2LRqKaUiXGEmWICUNwOcltT58w7POu5zirNatEX8Pkj3gHqSKbMs1Nhq1/WR
         BwNfRzUTSn6f1J4/9IEA+PJoHoSg1TDI4f0yIpoVgKM4514SHnuK0nyRuq1VUVXlr4Jl
         s7IFkLQQU+h6Bepg2GjjyoJgrvoVsQNF4cWenJIOBH/yKJrs5BZaUdRLv26mCZ3tqFDT
         tqyYzMDWPccdfAcUvpNKqc4M3KzCPKAVz7vc90A4tYvQRN77ikXlCCjB9XumTsWeaZ9z
         FctpFD6nAKy86oaODaSkmpFTYnCBqKlfc7cJrVNMUGLNzedbMImXPOoj6w/g/skZ3rQg
         E5+A==
X-Gm-Message-State: AOJu0YwMElF9DVRQtFNgiGc3xdkCs+feUe3L/l2RMsyTBcZy4HraPWtw
	AcYOlP/4Nj2hyHaDDCFS6sGioG0dD2obSdVWXSkepbmfo82CJtAmciDERneHoik=
X-Google-Smtp-Source: AGHT+IF3kesAXyhMwmNSL4o1EgSlt461F7qCTFbPjzkwgRZmy+poFqq9hqnI7K0qPneA/ge4SdrcfQ==
X-Received: by 2002:a05:600c:5122:b0:42c:b63d:df3 with SMTP id 5b1f17b1804b1-4311ddff73dmr10861545e9.0.1728652183050;
        Fri, 11 Oct 2024 06:09:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 11 Oct 2024 15:09:16 +0200
Subject: [PATCH 08/10] remoteproc: qcom_q6v5_pas: Simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-remote-proc-dev-err-probe-v1-8-5abb4fc61eca@linaro.org>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=J4xZfv0aBPmZUKd/vkSpTrvNwZXicEmiz2DyP7s4fn8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSOF8kFMiQpFUeuGBhxFHjTWsv5edpTYSPeAT
 Jb/y/ueQH2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjhQAKCRDBN2bmhouD
 15OSD/4m4QvmU19MrdHhDDZUabGwCw76kND3nw6IgY+o+BDPxNPHPtRXSlT7ttqiBbG1qnIHz0X
 QkzTH9R05BIdwteqKJ25YsVy7xpDSyLFdcFTAQ+zwLjD/eamsazhAnhtVHIZRNU61jJFuC9iaUj
 z9B1j9QMtn+xlzeGmE5lRIosQ3uJNw5B2uTq+c1SX8Va6YvyU2W0Xy94zUJzR74iraDzD8GxLvD
 td5u+9TBnov4zOeaqG9eb1A7ijiw2p3Z0WMdWBEnlbga6MfB+uqLlSLu6I4lq3YESAcSIrfDny6
 sNVS4pAOZ39ozMZtIULoDcT/7oXHlON/dVFrkQgyPnee5w+K7L/tsBG9mi00YVqjrpcUzdqTMI8
 aCDKtJUPJzSvAgzNJr9UoAk4iC5fw8D4fpDEKKU3/1hNqYsDWaqrl8O1tX/4kfFNK81IRp/6nav
 QIqQOhriIPbdy+KpO6ybA4L16WYyCVrs6Ixl1AXL1+HycPDn/nueW+qFz2UJ57g7zFmBcEfbZ1e
 DvWd92+FvvmEJIzI57FGwbOFqdlZ/RTCszUCUC+CCfxxuVSvjrLYC6wMzmDly1U1mRtsbYH/5qS
 7b5CCT6jw3Sd52F2JYSOgcw4cNipm8REUbezWrLf92ngSfCOp6Kfms9R/o1cb6loPG6SLP2eg94
 K6NTgztZXRuGmKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make error and defer code handling simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4efd4bc603cff604d531a51fe9f9c..806b3baa297ea1053dde3343fd86cffbc05b8461 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -453,24 +453,16 @@ static const struct rproc_ops adsp_minidump_ops = {
 
 static int adsp_init_clock(struct qcom_adsp *adsp)
 {
-	int ret;
-
 	adsp->xo = devm_clk_get(adsp->dev, "xo");
-	if (IS_ERR(adsp->xo)) {
-		ret = PTR_ERR(adsp->xo);
-		if (ret != -EPROBE_DEFER)
-			dev_err(adsp->dev, "failed to get xo clock");
-		return ret;
-	}
+	if (IS_ERR(adsp->xo))
+		return dev_err_probe(adsp->dev, PTR_ERR(adsp->xo),
+				     "failed to get xo clock");
+
 
 	adsp->aggre2_clk = devm_clk_get_optional(adsp->dev, "aggre2");
-	if (IS_ERR(adsp->aggre2_clk)) {
-		ret = PTR_ERR(adsp->aggre2_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(adsp->dev,
-				"failed to get aggre2 clock");
-		return ret;
-	}
+	if (IS_ERR(adsp->aggre2_clk))
+		return dev_err_probe(adsp->dev, PTR_ERR(adsp->aggre2_clk),
+				     "failed to get aggre2 clock");
 
 	return 0;
 }

-- 
2.43.0


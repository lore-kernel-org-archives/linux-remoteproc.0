Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6982283FC5
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Dec 2025 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692793; cv=none; b=RWD3NbdzYwjFHGqnlBOHyFtL9RXdNCgtlNpewOzJmAfpwbqmCM7x43To/1twoCVXz9lqFoNdXFq2ddMb/DZEBLQwViRMKjNh8J5CS89J/mjO0WNGTBb0OkzGO9+6X3jJLYg1EmK7DORUJcv8NYB1IL8hsXqnoDl6Hhwd1RaFTKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692793; c=relaxed/simple;
	bh=fhg4EUNcQI+h03icAM99AhHg85JaUze1Gx4jiJBadm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcO9Q9j6gpTkKiHsZZuKp7PIzpkdEmYQSBa6nLw5887Hj21PiYOj29+7OoaWCk9aIaj9P9LRTgGgOiOs0V1h9wTNNCyZ20CNWasiUVcBHsqXIPr9Z0ZJD6FVxcBg4tW/ydwuI1Gizr6I0iho8gCDPLBdJ8KJxQKIdo6sBJtN15c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzVgypLl; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzVgypLl"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-656de56ce7aso1167628eaf.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 08:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764692791; x=1765297591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdDRYWEE0OARr2cNKLTuK1d26pNNoKSTEKsFGgRhUzo=;
        b=CzVgypLlW9VHiGTQX96kyLNoOoMjZsiqyH1C0uhrE/2yP+ghGrmBPxr4oAe+pgywfq
         AFj602ZbLdAq6HbvRVOQFou4FzmrI7noayztKSdFQNIPcT/z/+g71C5G4XV4JlzetheK
         4KpEPu/hgcn/KF6P60vWM2tHZDdtoVoIhWjsYDiqSurtstRaV7GbFiKH+0Y/D6dYJMfB
         Sn983q6B8kd2YdFNCwQf4Ype353Pa1nktHaF1yIAR1yCSMgf4F6H0wfWTX0mtaoGWM9O
         fM4+QrLSyZSmCEVojwWhUVFnp3jbFoCyUoG2ex7dhVsyvZqu4InoqZZVMesrFXo0FbXU
         kJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692791; x=1765297591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdDRYWEE0OARr2cNKLTuK1d26pNNoKSTEKsFGgRhUzo=;
        b=S9Q+g/6dXUyJ7fu10Iw47a9ObiQ+xAiSzUPSAuUAZ6tx0GX+p3yhUCcojed8+lM1OR
         lEAJxugTTCJX3o+drFeo+6Tj8/UTqUzcsx8h9jzhDgTd+WTOqRG1tRcA6GdGItJspTOM
         nWEx8TO0awAkTIDGUVYbLddIqVzB0/pMCVNdwFOJW1EF2BmokmvtTZKOoauricb3uD8R
         ZJZRZLnBCh/E1YHMWuuIpzjWgG9gCzbTcL0bhk57H858DE6gnCrCBKJg9l4/2R6/HslW
         4fQQlVFCVjaV3vJek8I4AjkK8Ejnja9+JyzMRSIjM0SMKt4voQSI8AdSWruX27gvaC7U
         cSaw==
X-Forwarded-Encrypted: i=1; AJvYcCVUEgyVcelIW9ntxXtzMWSIVB8aVpuUwS4HDUMz6FY8xTbpMkAkCuosPt7EYrwTjNCNWiv8xKZVorreDx8HnnWU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw662jLfaoQVjTDnq2kF3+KqqRzin8YuBbHyH0At/rc2kONRTc9
	5XEnq603pUaNGMgQ8SFMu+RqNmtH0JFx7X9vFXRPHiYEY165jCraY3DL
X-Gm-Gg: ASbGncvuyO6VrXGAQhDL0oUosJ+OpWofee0fB+C34uYqMn836UvtYmA9WcUSDya8Hic
	k05ivu3KY1X6QIOhN6YOWgBD10LLDkCujEAL4cSfyy6yy/K367fhF6fO2M1b5q3IKlF/ix2jB5J
	IBZDEFtgGxxt6xfwBYqTNxcQfMIy3P/mrOWHYjqodejFR/sPYQf8tYu2D3QOAW7zsliz2GYhU/O
	18vJInPGHXyRj5FkLpt0shLp7HfePQtI0+wLPru6Uw6IA50NzvKwFrfcmDZAQmqGe0UPJYRea8M
	bJu48zLLUEt/R0YqMx/d97FkP88S2bHdAb/9b9i0jFYEY0Sh18XqWhZ1/62snC3tSCi+VLV6Cge
	puN5DZWr2Koj9E83PnYNteIb/cKi3upWrccuLmO5qoUgkUAzytRk/XGCuMB24M1ojGR3wARH5mo
	VzbSO3t6ylwr7Z5L92IY467XJeEkNpQ/fZferm2GTaOE6DCI0kImYxcWakkfAfNWxWGYuJStdcJ
	saiJDveYnTelHNqstXhxoYeVkQM
X-Google-Smtp-Source: AGHT+IF/sy7yPP+CI2l/uUn/o+fGA9nCYyc6iCafzp24kWIYvKonqBG6WGQyb+BLgFvDegxwappYZw==
X-Received: by 2002:a05:6820:180d:b0:653:6c32:6fe9 with SMTP id 006d021491bc7-659704245acmr103901eaf.2.1764692790870;
        Tue, 02 Dec 2025 08:26:30 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-659332e1480sm4236722eaf.7.2025.12.02.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:26:30 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	p.zabel@pengutronix.de,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Govind Singh <govinds@codeaurora.org>
Cc: konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 2/2] remoteproc: qcom_q6v5_wcss: drop redundant wcss_q6_bcr_reset
Date: Tue,  2 Dec 2025 10:26:25 -0600
Message-ID: <20251202162626.1135615-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
References: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wcss_q6_bcr_reset used on QCS404, and wcss_q6_reset used on IPQ
are the same. "BCR reset" is redundant, and likely a mistake. Use the
documented "wcss_q6_reset" instead. Drop ".wcss_q6_reset_required"
from the descriptor, since all targets now need it.

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - rework change to unify wcss_q6_bcr_reset and wcss_q6_reset

 drivers/remoteproc/qcom_q6v5_wcss.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 23ec87827d4f8..465119201c345 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -96,7 +96,6 @@ struct wcss_data {
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
-	bool wcss_q6_reset_required;
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
@@ -134,7 +133,6 @@ struct q6v5_wcss {
 	struct reset_control *wcss_aon_reset;
 	struct reset_control *wcss_reset;
 	struct reset_control *wcss_q6_reset;
-	struct reset_control *wcss_q6_bcr_reset;
 
 	struct qcom_q6v5 q6v5;
 
@@ -309,7 +307,7 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 		return ret;
 
 	/* Remove reset to the WCNSS QDSP6SS */
-	reset_control_deassert(wcss->wcss_q6_bcr_reset);
+	reset_control_deassert(wcss->wcss_q6_reset);
 
 	/* Enable Q6SSTOP_AHBFABRIC_CBCR clock */
 	ret = clk_prepare_enable(wcss->ahbfabric_cbcr_clk);
@@ -803,18 +801,10 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 		return PTR_ERR(wcss->wcss_reset);
 	}
 
-	if (desc->wcss_q6_reset_required) {
-		wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
-		if (IS_ERR(wcss->wcss_q6_reset)) {
-			dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
-			return PTR_ERR(wcss->wcss_q6_reset);
-		}
-	}
-
-	wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_bcr_reset");
-	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
-		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
-		return PTR_ERR(wcss->wcss_q6_bcr_reset);
+	wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
+	if (IS_ERR(wcss->wcss_q6_reset)) {
+		dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
+		return PTR_ERR(wcss->wcss_q6_reset);
 	}
 
 	return 0;
@@ -1066,7 +1056,6 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 	.firmware_name = "IPQ8074/q6_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
-	.wcss_q6_reset_required = true,
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
 };
@@ -1076,7 +1065,6 @@ static const struct wcss_data wcss_qcs404_res_init = {
 	.firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
-	.wcss_q6_reset_required = false,
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
 	.ssctl_id = 0x12,
-- 
2.45.1


Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBC8430CE7
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352260; cv=none; b=hTokkVlKdSMSMY58FUYPFUHVhHpNVd1w/tjI7pmKPoYaNURg6P0w+HuoSQk1T8JqguUqIHaJXIoL6z+8bLLNQa0+qZRttR2zuSkgUZIhp3U0tDklZk750vu312nzSCf1VAVUUB9sq5THB4U7S13fcP9WWqXkHn3eKOikeN9/d7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352260; c=relaxed/simple;
	bh=XnHX8L5AF9ZaMRELajN5+CeiTtHBiHPfbPp2pHW49wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TegCNcpgB8zPTDO59dyVR0ksgGKj+eLzZJHErD3NgVEt3UEy88JLHE4IuggMuSzrAzt+9PBaiG8hCi/eKfe5iEReJUXfxkqLw1Hjn0EoIyiiTWVnBsVVAXTR/MYf4XTHWWPoMbyQ7ItfCNcmgCZU/UUhHeZGYbj2nq1g9GjeUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yeWH5Ec+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yeWH5Ec+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ba701891so25283215e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783352256; x=1783957056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAsmhVeMGD8Mwep60H7tvGMGyolCd+7xtF2YlxHKa+Y=;
        b=yeWH5Ec+53PU4urzxqCxYNTJyS67OXkqaZ9EqCjzdDpCVKHDy2/gYXjm24CF3gB34T
         SkAAPsxAUUhq+WV+FXvVCWgd1ahEXlA6rL1UhH9moJbTc4oPtbo+KZbzlV3cvMOgg6o+
         GjMEyjVk+F5W2BC1DvMvCIkXkStOKMvv95fAUdfSCqZXuho809SoNU40zDofYWYo4V4i
         c5ZWkyJYQa/WiFL6KHdcuPk95vHwI+HfDs9PFqqyUFsrQeXNo5BR8QdexThLTFDXqunW
         EMxvrWRpmgCPsvkcrEvrBluYrkd7OcEmVzmWJE3UlpzxMJyuC8PyzmC/fFuYgWvBhK+V
         b9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352256; x=1783957056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAsmhVeMGD8Mwep60H7tvGMGyolCd+7xtF2YlxHKa+Y=;
        b=tUUdDWropfU0Qo6F9aTGBM2gvxK84FRPysD3N3nVlNKZsC6Vp4WR12JIucfjsFyyhR
         sXvheiscvQG8CJ5sxQznto4mCGP50eZrdD45wTIiAVyaYiGHtpkMn2n1cV8zTbCt0j7u
         M+ptIu6t8NT5SZdZroVUq7WrRo1RTesjkbTffzWS1T23+UZe00ff1/tkWXcPqv5Y6h+n
         /BRFGpS0XoVelr1KQxzST9oaLOCU0VOlqYQ45NnySleVavUWh8px8AMHrEeJfHXSb/8+
         ZMTsXM++LcjkingHzuE5/Wr8/Inj6HmgGwtuS8Efllj/HEFqbhRqG9tzIwo7s1z3ntyM
         kcIg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5FjfZeHkJeiJBk32l56ZSaPOiqYo+MW3GZwDVt7cc962+HCU0E+pkFvF4Yh/ZAkPKPaj8yiviNDBatuFG4tWI@vger.kernel.org
X-Gm-Message-State: AOJu0YzJalOHx8q34tQzNTH6na0mHsraf7lh2ZnVuKnvdQAL477t3XHM
	VD9Mo+cniIs9ykhWLtVsStxVaPrAS6UIs0yO0PTLGha/ZYyk79CaZnQmwREgfWrVlT4=
X-Gm-Gg: AfdE7cnBGczCcbqYPpErRyofyfkx8vT0DRxtf5YyRw/tptSOEVcd3uQ1Vw3yg7PehQs
	OPHHRsdHwRAxrkQPAcwk4RsuyApZYfl/xYzvcNXzmSwTJH94WdPPdJQKoVNYSZoIlo3pqE/zZit
	YJghMpwmMz7awD9YRqlpcpDlysayVJ7J9vxb3mt6f1mWKYJ0tnFmZo+L771sn4tcYxcL7oYDKob
	Kh+nDNIFqq0b5MXphkrEMRKHmkmU3C0g7vszk1s7B2PzAnFUCH4QMUg7hxEhnzUkA12E5Wb3L2v
	Hiq37lSWZWtBVcehS28fgwINO5JhoE08b+08bs8tsLVjQqeiQUTyMaXFbkWQwUHzOQ4B5adttGh
	gX1jRFoYC6VeD+Vh0tin/bDTiROd/2eIyEKAmfd14K+2Vs0n2iWqXQYo7oB8hxzHbil3PA2c6lR
	mkBCaMawxWEQZrSFNwXXM9cLXbuA==
X-Received: by 2002:a05:600c:4b89:b0:493:bc4a:c6b4 with SMTP id 5b1f17b1804b1-493df090aadmr8526575e9.38.1783352256154;
        Mon, 06 Jul 2026 08:37:36 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm26216613f8f.5.2026.07.06.08.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:37:35 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:37:17 +0200
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem
 control instance ID
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

On MDM9607, the modem firmware exposes the QMI subsystem control service
with instance ID 0x22 (34), as visible e.g. with qrtr-lookup:

  $ qrtr-lookup
  Service Version Instance Node  Port
       43       2       34    3     1 Subsystem control service

Currently, qcom_q6v5_mss uses ssctl_id 0x12 for all platforms. The QMI
service never shows up with this ID, leading to the following error when
trying to shutdown the modem:

  qcom-q6v5-mss 4080000.remoteproc: timeout waiting for ssctl service

Set the correct ssctl_id to allow clean shutdown of the modem firmware with
the subsystem control service. ssctl_id 0x22 is also used by other
modem-only Qualcomm platforms in qcom_q6v5_pas, such as SDX55.

Fixes: 4fe236a1d024 ("remoteproc: qcom_q6v5_mss: Add MDM9607")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 425601af50d1..eb14308e7aef 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2486,7 +2486,7 @@ static const struct rproc_hexagon_res mdm9607_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MDM9607,
-	.ssctl_id = 0x12,
+	.ssctl_id = 0x22,
 };
 
 static const struct rproc_hexagon_res msm8909_mss = {

-- 
2.54.0


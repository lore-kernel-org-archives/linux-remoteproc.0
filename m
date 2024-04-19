Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B8312D1E8
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Apr 2024 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535243; cv=none; b=egC3b7umKsLOrGpowTimrQ4iYAlnO7iHFROjXQ5MuonGKn6L4srrZy8X74WuPM52DiXQ4Zws6UvCYYv1bF796xc2rvb/pIAZuapKgOVTdpikHc2s4tkiyTqwXLzVYbyYIerEcfdRMFjdKk4geCbdJMcrzRo1bffz6FqaYM6eVok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535243; c=relaxed/simple;
	bh=OSaaTloV3qTUv65Q5MV+1+bKbdFYs/aBBRehChJIAYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOvdKyoXgxlJttsgqEaZ4oY09ZIPci3jfhasbFJnWYI8sytNa1vPKqsl5j+wX7SO0O6+jTtfOoFkdipVUb/JKYeRPZTLIaZaVhX/ffBYZKj8uNN5HSUiyRYm2z9Tq95yYgIW2ZRTXJ1ADayqhBgIupdAcwlh0qkat3PwtGZ/25Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHqG2q/U; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHqG2q/U"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a55911bff66so12825566b.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 19 Apr 2024 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713535240; x=1714140040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVP3aG0NcRA85ZVF6oXusqwv7tzNPZN1nlYmyccmDwI=;
        b=mHqG2q/UgjQ8PwPt6xSHve/9rsTKyLJ6R1MN0cXGqY2+2Wrxs5yBhsYBsBBZZtcyl4
         z2AhZw5rvKwdohPqc9cajF8CnGsJIG+D6OMKWl/iLVcmDhzGQSUrAMCxgPhcMde5DDBl
         KaQkXpGY1Wxc+kJ4i0g8LQnaff94FzeSW8k08DnLSBhA3nf1KwDa/nruMCUEAYmpaiNK
         7Oi+ZdsDdxSUyCK9agsDsPy87NeU1TPld6aW+sQZT4AIJLTpOw6WBU8BOUfWZSL8sSAM
         Tcx13J2s3Af9/tDONUM3JgiayuwvhjLkJqzr5MCFWTY1nkvW2/XeyF/iKdkEqoLsjW4l
         zc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535240; x=1714140040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVP3aG0NcRA85ZVF6oXusqwv7tzNPZN1nlYmyccmDwI=;
        b=g0ergCYPhbn5yRbh4IlOBamMPcvCfgIfx3lL8dUELkzgDQrHycHupNAcdu2wvdfIpo
         E91W7dmT6Ay3d/oWy4YrXG1BC1sDAk9S0dSIi19pOEzsaisU32giNwCDyXmW4blZJjsH
         /ep2ihY920DhrgovOB7MeXR0aRaAIhgKJi1wMMmQjEc5SjRfaxJJVXcblAdFSUWBdMxb
         5gCNkoQHl6IZWz/P4Fbr0lE86yxFQC8ptRp2Ag07diYnwsXOHJ78tHgd6Y3oKzf8x4Kj
         dN9LHQksPQdMgIBjXZ9nDOgSJFvIwNp0Sw5eUv67/VWtYTMRxvgIkathBM5hQkFS0DLr
         tLWw==
X-Forwarded-Encrypted: i=1; AJvYcCWdYuyw5GyUbKHOz3ByuakmTt1M++/y35OHCWNPnzWVg+HshXbhHQBMQZYSMhSgjrOYMAakdICXf8zntwB/7ejJtsLawZ1xKooSNZhiM3feQA==
X-Gm-Message-State: AOJu0Yw6LRMwqi/A9DxtlQHiWLMCgPBQKNZRJD64NjGAeloFdCW4Kllj
	jxNgudhwIcimhZgwLxPiKBNkuU24NcAZFZMbZ5Lg0r3dPVPz+i5LeMqC461QpuI=
X-Google-Smtp-Source: AGHT+IFMET/c6wI5F2rOCAb6gPQKE3sYKz35vOmssqnyPXKgh0BTtzhpr22YzbcpMCix2hHBfQGvxw==
X-Received: by 2002:a17:906:5643:b0:a55:648f:3f03 with SMTP id v3-20020a170906564300b00a55648f3f03mr1709428ejr.53.1713535240385;
        Fri, 19 Apr 2024 07:00:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id qy1-20020a170907688100b00a558be8bc03sm532390ejc.150.2024.04.19.07.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 07:00:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 17:00:29 +0300
Subject: [PATCH v5 1/6] soc: qcom: pdr: protect locator_addr with the main
 mutex
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-qcom-pd-mapper-v5-1-e35b6f847e99@linaro.org>
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
In-Reply-To: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OSaaTloV3qTUv65Q5MV+1+bKbdFYs/aBBRehChJIAYs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5pSJesRywzXVw1iRryyf9lZ9zcHS7qFXDAJYts0g102b
 rsA47pORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEykcw77P7v907md5oToBhc9
 +vJaNXOyu0Ego0++yYGA/vrEi2+vZN7d6sSwVn9v+oek1db3vM4mnOqqa2tLzv9+4ckWpc8mrm9
 lT3D1Tr9XJbW0pjHacPKXo9si8p+98PV6yf7rBIvecVGmf1k9qyU2JnNvzpF8aXxNWsmca+UF87
 SaV/+C8sTfbs6XO8ylpxz/cOreG/nVmza474zgNKtleZVq4VDZvWTz39bOOVU8zRG6nL71b7TtN
 /n+FzbT1JsvHcdwwuTkboHPxuHr2LrUPl/tbtqyeMHjjQulDnDZayaGWllNrjnO//9ljY3s8y8R
 QW3hzP2K97859tbbdp2X8Hh6r19M8N9y4Wlai/avWmwLAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the service locator server is restarted fast enough, the PDR can
rewrite locator_addr fields concurrently. Protect them by placing
modification of those fields under the main pdr->lock.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pdr_interface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index a1b6a4081dea..19cfe4b41235 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -76,12 +76,12 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
 					      locator_hdl);
 	struct pdr_service *pds;
 
+	mutex_lock(&pdr->lock);
 	/* Create a local client port for QMI communication */
 	pdr->locator_addr.sq_family = AF_QIPCRTR;
 	pdr->locator_addr.sq_node = svc->node;
 	pdr->locator_addr.sq_port = svc->port;
 
-	mutex_lock(&pdr->lock);
 	pdr->locator_init_complete = true;
 	mutex_unlock(&pdr->lock);
 
@@ -104,10 +104,10 @@ static void pdr_locator_del_server(struct qmi_handle *qmi,
 
 	mutex_lock(&pdr->lock);
 	pdr->locator_init_complete = false;
-	mutex_unlock(&pdr->lock);
 
 	pdr->locator_addr.sq_node = 0;
 	pdr->locator_addr.sq_port = 0;
+	mutex_unlock(&pdr->lock);
 }
 
 static const struct qmi_ops pdr_locator_ops = {

-- 
2.39.2


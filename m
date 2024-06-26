Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6488519149D
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jun 2024 19:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429164; cv=none; b=EeTyadLcaEhLn77j0efpbAbBXSBcMXiU14As5xWG749MzLMzAZpiYRF5L3/kzZHj37CLyZ1TJpFz2gxcIz5hq0RKD9K0K/R2DF8yTKM0Q+Jwpb/l044eyq32Zg2RpRcd7iyEmfygFOuK+vYuiVyxqRdUb8QdWEmxeYol2/XypTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429164; c=relaxed/simple;
	bh=Pw+sCEAT+Z9dh5Utx8BERFX6HY3A5yb57Mqv5aaYusc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAvVBU27B7PS2dflyN9hqK0UuJzEDsMaJHJpxPgbI97F7WGM/lGwvxOKxBPNYZB9DYPtSPjcaZRZmhUU9OZusn/KmK0H1TEPosyu2DEHmE5wiwg1aYjChdN4zA0qXIp4FybhYEQV+Bgr7GlTZuWgF0GXB2oV/XoJOX3kCIZqvBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oi2auZZ6; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oi2auZZ6"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so80645761fa.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jun 2024 12:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719429160; x=1720033960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UvH5HZmvKGGIuAO5J+pPITUJE8M1Ym9UtSDnHdpoGY=;
        b=Oi2auZZ6jHqg/RhF8Kb7AtwK3BAseDRruwduTKp1R9CK2qzBkz9xykt3XdzqYFGQGX
         EvDsA7HDQeGal7sypaE1rK4oL62nBjsKHmvHJKZCkFQNUFCswEZujFuPhyuO8MMT0i3F
         gbx2Wa4F2WzIiiJd/3SV8ecGp0QQ0/KMLZ8DDYdg8ExSav2F9+ZcxW9HJwuYKXXnexd+
         i0yuuY6TMZRoC91fnhgZUc/emYKDSyGb7SJ1O1EydKk1GloHrVLjEEHx25V2P3ZkQs1f
         CD0v6LTbQLx9jeul2lSOaI1q61TaDv7NGfn24Jx01IF6HWm14AkQEKwGfS60ffKmVkwD
         vilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719429160; x=1720033960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UvH5HZmvKGGIuAO5J+pPITUJE8M1Ym9UtSDnHdpoGY=;
        b=dVvufCURLKdkVLw/zO4ysHgMK/vH5QVudxRSAzIVIFwzikVPmP9X2mrJjLthM/Q+5O
         eunjp6D18lXjOmwpuSdaw8bdxZ8rnYE/iV+iF+CCGxX4yR0n1iXmCVazb0U3SOfMBRwO
         5M4Y9vaAbedm67qrqtrbeIa0fN7Co8icUvl9bMHxhFKd+0Qs6F1FDNHfy53WbeLBqKAV
         GCU08JMmXSTEpkdf2kEBLv8K/0cl76ZswSg0L7YsOeJDnzRX/YI15tz7iu+YuIrjSznk
         pMEEtPVuzJNGp5B08FEGMJ5n2GHSU4+1VQvinly7wR99EWSGnFuVa7CLMQvx0QYFgG1Q
         /0lw==
X-Forwarded-Encrypted: i=1; AJvYcCU3t1hKZ+XZpQV3PqZLPTXwYcfmg+yK+mBx7w3hCba0IUwN2NyGAyFSTC0ZOyBLQJN75aYFNXDo1yg272j2NyRHp8nTrS4Scv7aaajR2T3JPw==
X-Gm-Message-State: AOJu0YyiA4hfDVVqgvZAWqXMHPGXW3niVDm3ydsMMqaiupSGLiWZ3z4K
	rrDMwmLPRDmdHP2JhZB2WMY8Ou4r1+0MXuRsZkQ4MPVEtVBzXOPqSPhdxzxUsW4=
X-Google-Smtp-Source: AGHT+IE54fLp4b5+PVB5ocCcYlWG8uo+/TidBzye5/q8GSTFRfbD3g+eiLD1LMP5cqwSaxhlhkqxIQ==
X-Received: by 2002:a2e:874f:0:b0:2ec:55fd:f118 with SMTP id 38308e7fff4ca-2ec57967b67mr72555061fa.1.1719429160614;
        Wed, 26 Jun 2024 12:12:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5ef9d5fbsm9737091fa.136.2024.06.26.12.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:12:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Jun 2024 22:12:37 +0300
Subject: [PATCH 1/2] soc: qcom: add missing pd-mapper dependencies
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-qcom-pd-mapper-fix-deps-v1-1-644678dc4663@linaro.org>
References: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
In-Reply-To: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Chris Lew <quic_clew@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pw+sCEAT+Z9dh5Utx8BERFX6HY3A5yb57Mqv5aaYusc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfGgm/BawO8IjUtIybCyJJSV9VTppnF4TaehK3
 qGpXPVFJMyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnxoJgAKCRCLPIo+Aiko
 1WbCB/9FQanfrmeJbxWFS3YeYkPem+T6g+tE7ERKrpGg7GNFI5dIT5rL1iBU6J5jRSrdiIFv/oo
 Hc08fGnOwoz8zmg5RddsxTmbFaH9EfxQoWkE9JEqg0JuLmWqO3EM3YusYCAsAAI90CeC1RybfnB
 GFRVvx2ODPrdXAtwx17XgXw96KbohZhuyNSK2E/pRstByXcayRtKO5BvCRRNhqWzIA2aKzzFoNJ
 SykgrbHXtn9iIiAAV7v5ME/c5TCrWgS5mZ2h+LYiuckWDhcKll8xqWveJEyjL50WdzRHhr0eWBO
 78usybF2bxIQrBMS/L3A/2uk36VZfSbOZnYTRMvQQ7ArM4bx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The pd-mapper driver uses auxiliary bus and Qualcomm PDR message format
data. Add missing dependencies to the driver's Kconfig entry.

Reported-by: Mark Brown <broonie@kernel.org>
Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 0a2f2bfd7863..432c85bd8ad4 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -75,6 +75,8 @@ config QCOM_OCMEM
 config QCOM_PD_MAPPER
 	tristate "Qualcomm Protection Domain Mapper"
 	select QCOM_QMI_HELPERS
+	select QCOM_PDR_MSG
+	select AUXILIARY_BUS
 	depends on NET && QRTR
 	default QCOM_RPROC_COMMON
 	help

-- 
2.39.2


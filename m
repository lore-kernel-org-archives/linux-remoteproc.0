Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B0B19149B
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jun 2024 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429164; cv=none; b=LQvl8Jehs5M7VRlxVA3aaUFXf4TQ/YvIcqA2szcOdYBMDiT78Br2WcT1ePGXYKdOGRLdo5sg5Q2tC26TSvTu4wTaKmDzp4t1hMt/B2QpTDak6OH8QkiZQuNH3pOTEqUgfzE4+rDsETbZ3m7fyPuAlXSywK6SrzivtaZ1DzAyfKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429164; c=relaxed/simple;
	bh=Kv1JvM7JT7Hol03PSWbQh3LWWe1hKk6NQDRwutU9nWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+yeJ6zOCE9UEytkJep6n10M2sf7aIsn705IxwCMlOBtfSPHQ34KaUk23/J/6tz2tn74EWPcUHGb4CIrRsKGLMM2H0csnx5Y4pKKizG1p+lB1WKg9upK3LsJZRdQFNMtIXoscDvRTuoq81keCM3GKSxFbNcZAwpyewXxWAw3BJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WB7LTYKo; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WB7LTYKo"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec595d0acbso51269641fa.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jun 2024 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719429161; x=1720033961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSKJuXKBkAopBTS+seqTadFlRj007hCjgH7LHZLlyLw=;
        b=WB7LTYKoqfKHeapzK/5YJcQ43rD70xs7esoHC2PDzYIOW6iMSZ1bFVm6ma76qy4Mfw
         HBBzhtcAN7cqXK771qlrUjZyhjhQuOHRG5mmoghJr/ie7X+iW8HDF+rp57IfDb4anY7k
         7DVbmMX6KODR6k9Gr0h3SOopN8wWICYsib3E1JaO7bF7iV+X7pMfIxggIZJkbX3z1UD7
         U7c6ZpRIxWJ3CS2aUSIPQZD58xewEo5p0CO2eDj/cbxCLPr0HuKv6IVw+ETrOyWdC0en
         YMwMMezzzLlmop9dAcmtV65U1NxVLpvJjrWE4jEj6sUslZO/FsiYI398F0QCzXhJ31y7
         FWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719429161; x=1720033961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSKJuXKBkAopBTS+seqTadFlRj007hCjgH7LHZLlyLw=;
        b=IgJQ4bJzr6AQyNM5F+5HN16AL3B8EmvHFLw0ENawcVFiP5bfc7szr1WpyehMGB0Rjz
         NVNiy9oQX5q7R5BS3bC136GwvMPFzpl2p3TyWZuIHgmtdS89axRw8RG+/Ay2Isv8UbfY
         4KjPFwYwsd4+1338zmhBeebOQ1Aprde62SB9YOcUuAJ+SELyIO72pjVHHQCnWI5QZUgx
         cOPagEy9wuwqt6uV0+mPVXf9qcbbABKmmPQXcjycwqKKQv+6CT2gAYAOmmFiUsNpJnA4
         EPQpbJGOYeqWybXZYVYNsuE/a0g/j91Y3F/en3rACdBN56aCwadK2dVBTVx3aa3N0v44
         ByuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIbbUTqGXzqtbwAJIAFojiPY3N+COjdRCidIY4iTAI6aq2vjei84NaeA4ufvKl4HfrqvkzAuThHdGRsComyvjUy3fJ1Xpa4oT3V81rijGrEA==
X-Gm-Message-State: AOJu0Yzi/gjugwgLvfST0Xt7BP5F/K7GSAJDjbBasQwomF33kH5ePqS9
	cFXgaH6QyV9zHVRyHR8I0XqqBHn10CLm+6i4h0MNqGYmLuyXu3sBr2lnA1vPdyo=
X-Google-Smtp-Source: AGHT+IGFG4sxNqU7DY1MmWTg4jbFwY2LfYMUdwA2VHmpO432N2DCmhqCwOasTEphCyS8gOdCVbOBMA==
X-Received: by 2002:a2e:b058:0:b0:2ec:56b9:2593 with SMTP id 38308e7fff4ca-2ee46479140mr12523021fa.37.1719429161495;
        Wed, 26 Jun 2024 12:12:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5ef9d5fbsm9737091fa.136.2024.06.26.12.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:12:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Jun 2024 22:12:38 +0300
Subject: [PATCH 2/2] remoteproc: qcom: select AUXILIARY_BUS
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-qcom-pd-mapper-fix-deps-v1-2-644678dc4663@linaro.org>
References: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
In-Reply-To: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Chris Lew <quic_clew@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=741;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Kv1JvM7JT7Hol03PSWbQh3LWWe1hKk6NQDRwutU9nWk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pNhpr+FN7P7wKdBD/U6U+TF9W/LjnHWPy3iEGlfunfe
 v5DfZKdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjIy1Ps/wz6dj85+m/KjTWy
 Toz9mczBHtnN6S/lzUpuLuz6lF+0rvVoy/Fie13uW5f05ST2BmRbb1iq9jridFSna8zFlsW8bJ+
 sfn7Znrf8e33NfPf8yHlN9rweZ7vSoo293PMcBTvkEn+c+lYpVmn+XHpxoPPOv1/FZr593Tjjje
 8PlxVW7zkDegp4TgkcNDPSeXJKh+9UzvX8sAzLgsf/Za4/zY7U6037Uca5t/q0qEFFsUH/eq4g/
 yqnFru4uriKMzXCBvUlyg+s/zO2f5JlidsdIKArJdJ4/EGBaxlv7Klrq/MP2HVWtvqzPp27SYP5
 g+nV5ze+Hg4xcvx4lqm1Xpi3YI2R7h/FWxI9r69MPAQA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The QCOM_PD_MAPPER implementation made Qualcomm remoteproc drivers use
auxiliary bus for the pd-mapper subdevice. Add necessary dependency.

Reported-by: Mark Brown <broonie@kernel.org>
Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48845dc8fa85..dda2ada215b7 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -166,6 +166,7 @@ config QCOM_PIL_INFO
 
 config QCOM_RPROC_COMMON
 	tristate
+	select AUXILIARY_BUS
 
 config QCOM_Q6V5_COMMON
 	tristate

-- 
2.39.2


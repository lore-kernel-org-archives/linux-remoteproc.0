Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA4C14EC65
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jun 2024 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429162; cv=none; b=e5n6diFEoGp9Jbtb2JT28sYxJUUzPlWpwjV3nYYkQOTwP5kTf5tktZrQPUn76QBbV/oE1UoIeaKyPBCiRij6WFctSZS//7zROP5oEcnTRkvbfJk7LXqWnLffAj0fHsIaiW0XpLHpgVNqKrGMbMjcjD6datP6ntgrf0O3+856hLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429162; c=relaxed/simple;
	bh=u2SDf7fYGpc3E0DhCbMR56gaPqX/IPfUMmRhQjk5K4c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hsdyy/pS+v139Nkk8+OaIb+zzFrDoET2cP6NEMe7qQPSw1vpsecKeCNstiG74lVlnyNGzkDj9Va0JaKEnbtd62Wc/oR+tcIeJIFWbbYjuX5v3kG4TF61Q9W56+LYAWuhvN4mfq8X8IZeBFaOnBSJQfMSKXbolxA/DC36wksL8Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RXHzNd1h; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RXHzNd1h"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso84795311fa.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jun 2024 12:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719429159; x=1720033959; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBaZ29rBHA0IbizvOuiU1ifvZy32PfYnRdTmhCFJeeY=;
        b=RXHzNd1hjy7gc9xHnCu5e+DN5Xfg62u9nCrLI8Nvn0Ve1VevVurugiatygeFenyR0P
         QUmYNOXGIcpMlb5qlX07HNvhbttcoZorCq6V9rt4nuIUr9Ogph0g55iemrYep4PUtugy
         Buq9Ohs62s1kh4AOZYpOhb30jsYf7bPPxDl+X3c+4k73ja9P4EZP17sl6x/5GZT0afK3
         3mj2OY9aYrUmJG22CL85YVDXpMJdOurujifXDGnhSfC0liqChmlVFRhIA8CXjTAgoNIV
         VHPMRp8TQp1PnqtXSqpYf0xVzBYFj6fQ2zWV23M3Cg9eGMWLoywLzjMHdmxnxtGR5Etl
         8Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719429159; x=1720033959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBaZ29rBHA0IbizvOuiU1ifvZy32PfYnRdTmhCFJeeY=;
        b=lQmBZe6Nok6Re4PTUgV/DNAmpBKIo03Pj6fEhMwc8pHlLEXt4kpMLSiu49k9HSuBUl
         CDZJ2KFfHfcdIhikEB2J2eoeoSXy0AgKjSz9oUBhKFPhk12WfTQPTMwo7AKZCtjW7bdo
         TzXScZmjiBwtMmX4p/fBDcZ0uDBjej/M0Ne+wjqoNetdHB3CAfvZ8IOJF8QUtj9v/unt
         7+FBWi+LNcnklxo5cmyZtiPC2PxL936IodEkBJs23fovtRCWu1DsvHo5M9qYIVg4kwHO
         umaC/t8J3+U3N/6MaxQeEN2PXG5Jy/b/YtzwgbkNnywo+hdVJrzyCBLhUY/8M7Yf0Ez7
         eJLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYp850hLO+FkMaL1IZBKKBnNMlqGBbaMTbn9lCt9ZP+6MxhU8WNhkEUtOsI7YpQWtgIklkDVg3mIdq3t+ej9TxYpWgkFCs6Z5Fjbwt5OQsVQ==
X-Gm-Message-State: AOJu0YzcymEqk6QWByn9D5xaay7N9DhcjJQwlAgcSBJSXZmy+Pn0wwlX
	jkfQ8intvCU5+4Pz0l/JtkvlUjODufo5EeyO3x1AqsHI0yNzpyGsR2g/wGKVPVo=
X-Google-Smtp-Source: AGHT+IHt8X0oQPttO5mD+BLMd02xe27Ttt47+NYZAlKzFcgo1uJcEXeR11B1YvqMZXGK8ElWADnPyg==
X-Received: by 2002:a2e:8690:0:b0:2ec:50c5:a43a with SMTP id 38308e7fff4ca-2ec593c149cmr70988991fa.8.1719429159401;
        Wed, 26 Jun 2024 12:12:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5ef9d5fbsm9737091fa.136.2024.06.26.12.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:12:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] qcom: fix missing dependencies for the QCOM_PD_MAPPER
Date: Wed, 26 Jun 2024 22:12:36 +0300
Message-Id: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVofGYC/x2MwQrDIBAFfyXsuQsq1kJ/JfQQ9CXZg2ajUArBf
 4/0OAwzFzVUQaP3dFHFV5ocZYB9TBT3pWxgSYPJGedNcIHPeGTWxHlRReVVfpygjW1cTfCAf9k
 njVorhvuf50/vN8ZRMLZpAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Chris Lew <quic_clew@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=630;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u2SDf7fYGpc3E0DhCbMR56gaPqX/IPfUMmRhQjk5K4c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfGgmBMoPQseeSdH65m03cqcpEypmIOZ7nWkuo
 zJG7Rv7U7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnxoJgAKCRCLPIo+Aiko
 1YDZB/9Ue0R33VS4KT+7ba72CxUZxuRwcF18ZHN40gIdk+M+In6AjdrZ1QESoJ9v1m3w+wZouBX
 WHECfjbAUlTsJKao1JO1n9GvRK8qECSn3dK9/0NCjMUga6jguT7o//poHIpJonJG6NU3w9qcoHP
 SgK8VNJKjcDjB+XDsDWc3+rkKY17/YsUFL6vMKMrNs3tMUNVq61w9cAdyr2uXc5Id/YVp67uTbJ
 1lPt2XvS2a2KQZZ22LsuL0UtcE+RN6Y4ch6mHxICGpVVyGVzijDAsoiklKOEo/0KZbLp5i3Pdu3
 PKrC27tNp12nLxQIc2BUpHn6rLyWrOMr+iTthixttq9SXJ0o
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While refactoring pd-mapper to use auxiliary bus for the PD mapper
instantiation I forgot to select the bus in Kconfig entries. Fix it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      soc: qcom: add missing pd-mapper dependencies
      remoteproc: qcom: select AUXILIARY_BUS

 drivers/remoteproc/Kconfig | 1 +
 drivers/soc/qcom/Kconfig   | 2 ++
 2 files changed, 3 insertions(+)
---
base-commit: b07e1e375f6389b6715b9aca590da17039bcd447
change-id: 20240626-qcom-pd-mapper-fix-deps-1cf064ee4715

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


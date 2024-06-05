Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C38194A6F
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Jun 2024 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606643; cv=none; b=iFn9yzrxCnwWn1zvWML5QQ63KKP+JnA2C3/0zOuasNomt4XYEMGcaD2C/+hPn+pJOftIFelD+5X0IVSgnsaysGXkQxwoFZFlkGZ0D+27OLavxhoH64iXXaUgjm+2T9a5tCu9O2Sfi6oN4TGIzVzoKNDA8Gm92+kb2ggFqSdt+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606643; c=relaxed/simple;
	bh=uXSM2Iu1Olbp91p8Leb0py++ozh2x6oGX0LuA1RdS/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XukJqhzy9vkWHqpr7U7EwDPwGAjV6Rg0krSuu017heFlasjwhIhAL32r42lc5d56M/xizLyWOPQsHX2wu88djYkvhix5X74fvez/qSLNecoQ4/3HUB0SO6pwxGleCRESlniar/N/gLXSg7xwBgPSe/sA98hPh+eBMy9u1SnRU78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UAuXMrw2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UAuXMrw2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42135a45e2aso496515e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Jun 2024 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717606640; x=1718211440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W83fVa5vct7yjeucD5PkalgzrQk60pDM4D2S8Yxgv7Y=;
        b=UAuXMrw2AVjLIzi+N/IWZT/iLRYg5Iea34eoanr8C9Fu06fWgkJzCIXutmlFYHsDdW
         9FjA+psKX7AxSeK3WAp+Ar8jGGCraDyEnnabMXdbHadJOTSrtlJs2M53J0YZUGWMXrxd
         ii+OhMTx8miexhpfPh27hLIQo0EeXJikvsD1x1wxwS0EFJAPM2foAhTDHpEMz83nyzDf
         qCELBI6E3W1hDVKZmrTWHbh+dyoh/PhgrzjiIHKcI8mhIC4MGpjoUVB5He+lhfH4yis4
         IYz5/eFtr1b8LnF01kdQO7363XMwbYmWHu6FIjkBEUTSEHyZjEkGFK6RXjXXVRJLF9Sy
         /Jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717606640; x=1718211440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W83fVa5vct7yjeucD5PkalgzrQk60pDM4D2S8Yxgv7Y=;
        b=Vlh7jWQcQwCioKPyLQO2104/l+Nw8C2jVPsg7EbIW7O5unksEI/9IOFaf5a9BeD3tL
         sD0lNV8zofJ2+39UirXzHqKBp2o8vpls3pnjWK9CO5BOdWJ1m58xFB4Yl2p3fueNQFOU
         +joZvbMeib5tLux0cjuvRKx9Us4WMe6FWj9ptYy20Ow3zPBodV0g/KJytll2MzroGUOx
         iC36qmXJwrR1upC11k8wUEMzcpA5wqeOT4/sWydVd+UNDN17DsyHuEWxfidVe+nYdgdw
         iWoMcfZNaYW1LyEMAXZCTnSqzn7VgR0uLM7N03MHawqUJ4NQ9LrzawEJXP9pSvR5Wnx/
         NqqA==
X-Forwarded-Encrypted: i=1; AJvYcCWRHv4g3NkkAj+gADGeEPwLIy6IPirAl43nj0WdtqAsjCtJU0zmFoZSDmOBvZ2JiKj2A6bC3zx6Jn42EzbNCFQYgSqXTGzVzSAWLH9BzznlIQ==
X-Gm-Message-State: AOJu0Yy1PbdCzBM0/RM805l+QHeTsCVlCXvlLcNtxfrUip1z5cr4YgPa
	xyaX8QH/qlyNo6vVKBbxB1t3UeJaRA4YkFyPUe/IS9IaykajcB6k5JZ+wqrjvmA=
X-Google-Smtp-Source: AGHT+IHwxuhRZEP3SdSzJWxzN6Lknl61ARfb8ZnK7w22ASDilYSF8G8af//vnB3BYFtMn1hdk5NRzA==
X-Received: by 2002:a05:600c:c05:b0:421:5ada:c137 with SMTP id 5b1f17b1804b1-4215adb3ce5mr1179765e9.33.1717606640002;
        Wed, 05 Jun 2024 09:57:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580fe343sm29099175e9.6.2024.06.05.09.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 09:57:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 05 Jun 2024 18:56:55 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-sa8775p-iot-remoteproc-v3-5-a437355b8c7f@linaro.org>
References: <20240605-topic-sa8775p-iot-remoteproc-v3-0-a437355b8c7f@linaro.org>
In-Reply-To: <20240605-topic-sa8775p-iot-remoteproc-v3-0-a437355b8c7f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=f3IzZbvHU832NvrjJCR40bSSOwuWaNkVPcSp3le3kiQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmYJjmnJqrlASGsHInZAZe/HCdQzxO10syKL2RV
 Ty67YC4YR2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZmCY5gAKCRARpy6gFHHX
 ch6wD/9OhZu/7TEd0xGTXO4I6tNcVBD1W9RQJgkGWgc6zQu1gTHnv9pim173u0+LOMi7S+tGoZn
 fpcp+F/AMsIZ4kKVTORtbuibVS4RFdwjD1OnFX81GJlJPgipc71sizAOM+DS/ZG0b3D33ToWRCY
 S4Kl0lJ6aTlunBedxNAmVJzIXRJXz61l3GHR+fzjOP+KZZCACFPf4c15Ya6dipjOJ6JdA5kIesd
 RUXdJL36qcsQUNkSLDyrxpRKPf7hz+V3zCicXtHfs4HwLv4R6WJ2FbpUJkVRQ8fdOGqoSEBs/J+
 Gz6y9J4KV33tMuJ3Z4v9P3YC3XVSvzQw7J0PV3CqTvhN/DVMSbfAbWrTHr5VwGnMLguPJmOOqjD
 fptaHsiLyeXlxEweyHgKrwpjVrIJ5/Hddl0OmTfRgZRFZ+f7U82nqbyODZje+yVnE2AoBNuPrFZ
 cisW8dmI6AFWquMawN002FkJ4ZtnpyvNJvjrJyrrztg8QB55rpM/DEo7KSoTFQnqkkSoVpfZsJP
 XZ8xae1ZfVdmQ9X3dqjrAIXeySK87zp7cDKX0skm4ghCkmh+Yk0nHGjpGvlJRAoS43EY8WNjvR0
 JUd3lfbfwbNl+vl1uebCG37gnDOYDXT0k94cL0XLl1f+Ql747JrAT7SfRdiqWvazozxuL/mLOB1
 wTKJPwtJgu9vTjA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable all remoteproc nodes on the sa8775p-ride board and point to the
appropriate firmware files.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 26ad05bd3b3f..071fcaf09364 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -727,6 +727,31 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+	status = "okay";
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;

-- 
2.43.0


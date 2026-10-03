Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0E4A3D32
	for <linux-remoteproc@vger.kernel.org>; Sat,  3 Oct 2026 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050238; cv=none; b=IDELoXclMC6Vt4LsCltx/X3bgGK/r8GEedKjAWazG1TNLusGY+48PBOrVD3PambC6/osC59M2l/FBbxZ50fA0pRn6rjTc57HKMjy6ZLhriITidSTe8R7CEO0JEkE2AjbmCGwH7lsDKjnzSWUrFuGOIDzWYIWKbBaOrdOM8Cx0Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050238; c=relaxed/simple;
	bh=luUnD3l+m2wgA6kRS365Flg21Wuxh5YBD2vT8dfL+C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hX7j7aDgWeyEZUBzY9+VeJ7P8GOkTtXG640E6LbLq0uFeYB8nwTyBup3mIE9wq8LuniybgShBDmMUnN3StGC56OQ3/ZzWM40bLkoy3TeBR/sK4zeNE9cqPXZuq+Cyla+N1k9m6XVYz8e3/povi9mJuunKKatxiiqqfWcnfklP9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDNHWmoM; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDNHWmoM"
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-93cb545be7fso39530985a.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 03 Oct 2026 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050234; x=1791655034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftY4s8ms9BPT/X/v3xKK/RfT0MsqyQeCqU3eZn1XFPk=;
        b=ZDNHWmoMYSRKmH15uf/0Z8BK4nwDqqDpk/yshCf25Ga2MpR9RUAKQt8mUoN1AgT4Mo
         YpAignPv0zzkTLkBvosCfChNGvR5TGX57A5T/y08rhi2rweaH+4699/GZ4bhW5zbfuVJ
         DeC03pfe3VdctE+9DFxOs6J++uVhseiUbAn8BBxPXpMvzJ3V8AW8I/u+eImQvKlVsLhi
         KUUltvau8d1I/mxgB5hAJD+tZ0gXfR1gzWAHaRr2SH2uonKwyKRWsMak8wjLWFDvsYZB
         BNdgtHI7EdvtaMz2D91qWiwyk+Vwja+1Po/+YTd/3/0vQeHvLuTwYsUp2htSOhkNEoe1
         a1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050234; x=1791655034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftY4s8ms9BPT/X/v3xKK/RfT0MsqyQeCqU3eZn1XFPk=;
        b=1TPi/NvzckyP6CU7f4B+CZfxPM/cfXEjOW9BeWkozMJFCvC0cw8cAGarX5YwJ5DTOs
         OZaxuLypaz15pke+YXZ9DrrD5GRdblFWuXdmHCbAdTar2XfI5/h5toa1wgP2I0gA3nh0
         C+g+P+7/iMGPbIeFhp/gelh+5wrJh+jSW+4/eujhsI9uwFfTvyNMiQ2re08ykC0Byog5
         GuowZtvpUlnbD1ZX5vXBMDwtU5L+YZi5KdhJh7937sSZ8i2hkRnfPhTJ5+mR13rcjLSm
         T8mYF3RWKng7DfU2wIDzhiZqhGhEoemSyGxGz0YFLlHH77GiZywtRQvEkYyP3tIHPrNu
         LUGA==
X-Forwarded-Encrypted: i=1; AKwUvByKEF7X14yBewBo9F9v8NL4piHfKMGcWa9OfySgY8blxT5UmbCivNaR/LDRj9zcu2LpyRYJ1wLDyBlmS73Bpy2Y@vger.kernel.org
X-Gm-Message-State: AFuF++mZMFmSCWe4yvukqtnpVtFuMJY2d09XcP3ySeTJXfwUaCCjb4UH
	XN6tKRUVc4PzsH8leZB1feP3VIncBQcSll5m5qHMrKhMnZ6QT3BKO+E16/LkIg==
X-Gm-Gg: AYBFou04X5/Bpd3+zDmkU44C/DFjR5g25kWbtmkypdO/ilmr1a17LAX/yrZvH8hIt0r
	nO5XvmVxJsbu27PvG2ScmYjOZZ3k+ytAu3MixFcsYPAbimNnu5Sxj5QQY0KDUXvq3cTuNxqYdSe
	2SyiedxoTpgkN9jd14p8nW2If+4xu+eSCZDjUKzs3dHfBIKiPMx7eFYKAIqJDZz9SzGZNpWBWvm
	v0oGG21BHG+UvKOvEo7ybHTRP3JtU2FZqs2ppnplA088x6bGCXR9TLlnl0IWZ90YW7sCBNf34LM
	PfREINRWUeL9d/DRdUXr2o5UyDGJRJbQlSJsqkxtpMkN8xJn463KlJ0xQggSC2f47B4sQOHQvG6
	pRh17IPQCGy54v6uGzv3siL7f4Stwkrzm3uXsUZk4ilU11nfnkxodpkmpw6sdckme+by4qTGeRY
	tgfwYOG+louJOuHT5h1xp+bEu/UdLZC6rcQGVaI6PC2Ogk44BqeQapzVYFerZqaf7G2MCcrsBZr
	A==
X-Received: by 2002:a05:620a:6601:b0:93a:1264:7f46 with SMTP id af79cd13be357-93cf189ed93mr1216539985a.46.1791050234126;
        Sat, 03 Oct 2026 10:57:14 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2d361bsm507217685a.45.2026.10.03.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:12 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 06/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Date: Sat,  3 Oct 2026 13:56:54 -0400
Message-ID: <20261003175659.23536-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
compatible for it, with the same data as SDM845 since the driver
requires the load_state.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..5272a462fc49 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1865,6 +1865,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
-- 
2.56.0


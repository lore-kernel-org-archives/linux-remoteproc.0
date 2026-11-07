Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018382;
	b=fKyfg3afPjvCC4/RPV0EtHTwuLho7IjmQs6LVs4qgJ+lFP3b6bb3kNqLJ/PFiYEDrYOc
	 +yc+r0yN8YX36yQZD8YhrvBL7KGCx2jawa4hblMu+Z2Dtmbi63XWxavMdB6/uNu83Pgow
	 2oCTwW3Juz+L/F9ng0pGFo2M/gbAr2ZoVhMPNwoWs0CEhSAl+hld3NF9itGQCfFqTiF8d
	 BT9Lr8de85EenZBcTFtJ7L9XBJznM/tyJFc9PtxKIpHvDS9Zix/wRvr3+m2/XJ0PfHSTk
	 +iTZR8VGidlLMQgbXyvnhGUZfSZC9z+PZexitdeyHa4ZxM2XKuAcoRGaAcQ3fTvFibg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3m9gvX5lYJSbOZKXUakfxz/981ELA/QvqN7rzqoA5W0=;
	b=zA9WUQKi3mCTBTZSM/4m7ENINn0i9VGLTwIPwi1htk2XabYHiX9rU2tsglSbh510/4Zl
	 kn4c3igVkPx2XwMC/2BxmTw2VViPyLkNguPWQDUsCts6PiVyhgGTAK4eYGcuftSeYU3an
	 ZiO9MnoOd3L9DtKBCTNX3hy9jNoLnKO6WNamA0qDHDfhfNOFqQoB2wN4SkuFkICr0Kl5E
	 KPOfKeVeTJP3XnKSfdqKeJriTYCwtabylf5EqFtNFmALNRKUKCcoSxBoVw+izxpVi3Bq6
	 zAqovg2N/h2b72Peg+lemn8dRk1UklGbNV9vIR6xgDIaPgkVvVnW/bpDaPEAJQt4r+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEKMoMiF;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2562606A331
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2562606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEKMoMiF
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eae1276409so483499e0c.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018381; x=1794623181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m9gvX5lYJSbOZKXUakfxz/981ELA/QvqN7rzqoA5W0=;
        b=MEKMoMiF3xiJ/l3EFchdNu8FNUSH9MLUfVZo0v09Xw4FDNrqmbUeH48Ps8MvBhxwDD
         3cr8p7soVGz8dbByWssGeq2iItiHX7z2R6Nodnu0mmMywiMjiKRyivl+wF5XY/Kgh4j9
         zmAjgLQrcLPMCXbCCp6kFpGwglmLzyoGZ4vAE9klB+AQMfzOi+Us2fZ+hLaptFLcZHWJ
         FDIAuwpvE7EopYDrbqcpep9GCHyub+9XedsvnnvYD8gGwRQWb6XiojibH88n3T3LB36i
         WoEm5c9lS8oL7dXA0ZnJ/1pAO1VMgxyai877TrT6ikuOEjznQCxy2fyDF3/i8scBa75N
         tnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018381; x=1794623181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3m9gvX5lYJSbOZKXUakfxz/981ELA/QvqN7rzqoA5W0=;
        b=TeP04H9s8Udpfx68Lt9zbsuzUdlJQs8hu0sMFLSqwVbIijfsb+ZVAJmamU35MSoffR
         Arav6pyP3awsn3pdgDLquPRTPWrmgGW6ZogtxI8bd3bLCnnE/EBGuffJKNWkLl0CK5Na
         r1U7t7okSW+zgJrVILnEhd+jcDDi9MbLJO7INanxnIPXFXzRyYv2mhrtgaBLYgLG26lo
         boX8YN9qFfNcJju55OKKm4Gi0iiUGFvRXrOwW/3oA5f0PF3w/K+1Kydo1NhgTYrqPdG4
         PEdeodMMODfsMPzajRy3WoJGUwmhpKvjc29MT8QHxfUYTYZmtEobpq17x89T/Hfy5oMx
         mCoA==
X-Forwarded-Encrypted: i=1; AL+hErFxPs0LCeBxQDHlRJgTBgTr6sKU9KrMHi502GG+2dUr2whlSolWPjecy79w3gkU1O9TGPEeld3o+onCY7oSrJpu@vger.kernel.org
X-Gm-Message-State: APuU4Z+76NreG4/p11rdff9xI7kfKcYE+bRWnIZqMsNIHiPPmxqXqPFo
	evkVfCZDpxhELBuW/d4q0c0MqptuFMkfshakfHP8UMsGDSOWQzR4aQP9
X-Gm-Gg: AYBFou04hjMjGt7/HG/KRkJkL4cZDxQ6D5PWZyAQyeqWdYgFaKc7JKwX994d/wDBq2w
	CnJHh6gZPozAJk+pNdspDD1bBz1Q99uaYd63c1rszuDrFhhcBIs6xXtJH5vTqrAwNUoDLuNfQmj
	scH+Wb7QKy5wGOW2Z6XeAGljmP5Muq2X5wiUTpjmy8F1gPIJT8dSKTeH2HkC7+1Cd+3dYLWgXYt
	QeJU+tdES7GDHpe8rq9wu/z1o7+E68e+YrQjg9izCcFttMlKujimiEVeKZ4mNQ4Nlshkfbf3Cmh
	rrjemn0Hf5jInMx0xW7KWap16ujOrX2j7NpkY0hkbFbf7i9R+44c81WeAz8hQm4qBxZOqQ6gZVd
	YIAJl5f4hDWq8wUOn7uKeiz+vNsddTrYGtJ+GHNCoa43PKaqSW/4HAlnJUaY4Dafb6fBggkM3So
	qdgoULkbZeF7M2Gtc3kudY9VtzC1D1fHNB3Cvm7j65EEEsaJHaVy+CREEprRF+Jd+0/gdyP5NDR
	NaVPTohGIDkVP23L5vdS0AKXVz2Hdn1pjyrzjEuylPmHXQih5Xx+Wvos8cZQb4+sn201TZsV12o
	Up4eM/cZpuFzKbu7V1WqPory3ayXSjlWaJN7tbOsmF6YPUOZGA==
X-Received: by 2002:a05:6122:d17:b0:5eb:2a6e:d3a7 with SMTP id 71dfb90a1353d-5ecc43eb11fmr2142243e0c.12.1794018381006;
        Fri, 06 Nov 2026 18:26:21 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64a5ea5sm2744407e0c.4.2026.11.06.18.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:20 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 6/9] arm64: dts: qcom: sdm670-google: enable adsp
Date: Fri,  6 Nov 2026 21:24:50 -0500
Message-ID: <20261107022453.159341-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the ADSP on the Pixel 3a in anticipation of audio support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 4ce9b62abe53..2044593c22f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -199,6 +199,12 @@ cam_vio_ldo: cam-vio-ldo-regulator {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm660-rpmh-regulators";
-- 
2.56.0


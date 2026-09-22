Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C6537F730
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042296; cv=none; b=qjHI1nuQHo2ggrrqpqu7jkSjhBq7jfBDoQqNHhi1moBsv/+Cgp8EbB1Fg7laSLTu19MPUS7kQ2EDHH/D1PA4oJcCD1k56urWYb2A+tDZbEqurEcdR5zr3igtHhwC0UyeuBaCh+9gjFsjeSTSRbMLdrZscgvv6v/A0FP6ksoQEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042296; c=relaxed/simple;
	bh=gctHxb5CeHNe2axULrIQ/z9ntCHsYPv+bbIZgiI2ems=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnPKsZPNJgcc32ADxysmpfny00ujuQw3p1cxrZlUgg8OoSyFY/HoO2KzlVTuz7JhptQA3PrpAdLlQiyOlU0GyAna6l8jDFZwmnUwSCCEStQLoL3Qt3X/ISTLPw+M49zzUI93GWA2RaWuV4TNZFiG9exom1o1Fby4Q2aG8lpkhrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmyeQz1V; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmyeQz1V"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso31750496d6.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 18:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042294; x=1790647094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbYQNJJ7cs6bqg+2N1+H5xlgpLBT5L5nS/rdjvSWGlU=;
        b=DmyeQz1VPf2BBo5XyyQApUfvfUnoXlVoLx9+Du+PtnuUDEojmvxtvq/4T2XlmW5vXo
         pviMAdwXipyYxyjS3Jco65kiAijHkXAireY3FqECb7D/Hs0kZfSbgftDNgOozw7IYZmT
         Hw7BQ0eLkxK9Pac7KRwerg+65r324X+XfzBSxUDr27DH3xLOMG5GxQbtUIGRSIbRN/8L
         Pwo5kwpzkoxmDEeiohlBh+VVOpV5wjCi5oYSG+Q+rT7x6Y803bM/Zu952oYX3XYAOCK8
         Prk7sJ8HvSblh00jAQM6d7S5zMJSzGq0w5pwB1xB00nl0opuS3fIvJekBwOc7dCj7j6j
         QqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042294; x=1790647094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbYQNJJ7cs6bqg+2N1+H5xlgpLBT5L5nS/rdjvSWGlU=;
        b=qibTMolFyjI+gyrI+KcX490T8rXKOZL0rbf2/tQZvRvO5rOYB/0OdrQzDlXc5TaNOW
         2BKPq5JgXG6HH4JRQN9APQRzOQNsFYaO1eWIY50Ix15bNru7zL+srgdc/R0bO+cxI4kQ
         9U+Pev8BPkEsc6O9IHyBFfZHFPvmP2j3paMMJYo24VOeE7DO2SATyUAtoGBy0B937vju
         O2mcWphEoY/c3QtFTNI0vrR9gM/iE35zl5H4TBXNRwjAbPI5X5i4uA+9oQDmKsPsQZYG
         FmyRBuSiQsjsfzh/PrbNJobdXjblL0aui+9bj2RLirVK/CpEIG+hn7LnSD8GXPQbZaRZ
         m/+w==
X-Forwarded-Encrypted: i=1; AKwUvBzYBT5ZBEZjwUqECHYK4TM6Za3zu1VXqoVJDQN+zlNAJWXED8/gAKEHCspGEqmHVLsdhIbP10aR0ImMMPooCGNX@vger.kernel.org
X-Gm-Message-State: AFuF++khOn8IgDafWSGco+RNyFgvoIUAsZl45yEARyFqYluRUM6CO4+s
	KKmPsu5y1zB7Sr5H2h3vgFNusmCoY4EbrEltcezIAY4MhIazepsMCeX6
X-Gm-Gg: AYBFou36NZYKC6QHJrZOu/XSUkIIF3/luxR4/l6hF/+GzI4TRv6IR+bESxBgkBXQ0VP
	ZUI2mdAMRaD+OsYqtnvJ/irUg5A5lHrus7DNc3YyNjbiGYoPOw0Uunks1MCi5vfpmIeBeVLofAu
	e3WBFEc0WluoqcDmmUCORDtP9/dABgkOgRybjTPgRgMSzk4bUHcKypeRxR2JWtZrgbymQZYhCFK
	RTWccVd4PRhZQlr9zCpqspYQGpjtshkZCKseSFYvZURW4pZIl39NEjrXrWR4hkPpcaeFzgCUJbH
	9S7TY2ZtVonOwYxKh5oGkEq4yIAu7XL5T0IF13u2fLO6rWDEiZ2A9AD7/YS6ivsxXCqkIA08n9p
	KY5EzkJez773jQfOYRVpcBDj3DNRn/meEGGIEdGR0aYjgaUfoRwxjmBY5xYGr9zVeZ1U3m+MXBL
	Jk2OeQM2bMUzl/X+VZtwcmjEEzgsEIuuaFdSyzCFo7YEdPc4TTGCCcAk6vwFnOc2RVNP6RwXafr
	A==
X-Received: by 2002:a05:6214:19c7:b0:912:517b:8f5 with SMTP id 6a1803df08f44-913fc95111dmr35899676d6.39.1790042293778;
        Mon, 21 Sep 2026 18:58:13 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140250a43asm3952866d6.38.2026.09.21.18.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:13 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 05/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Date: Mon, 21 Sep 2026 21:57:55 -0400
Message-ID: <20260922015801.32373-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
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
2.55.0


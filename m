Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C1B1B6D1D
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736620998; cv=none; b=SZIxO7z42dv39PWyXUoAGg5wliQA7DQjzfvNRZ51VM7tdG0EDaXrkKOEOyM92MOmigqZp97FNkVp0QI9gSvVcew4ELJuRTtU7Iazj0YoAczNz2Ja/BXeEvewkdXYns90Zmy50G67Sb73cLyS49+Lp16yOz8sEoHEA3gKBxsQLL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736620998; c=relaxed/simple;
	bh=U1lpQENfUy62bKJcih/Uez8/c/JkobPMvDaQfWStUtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mo57+HZJ7ma+N6GlcpafUiveA3SnBELBcADgzT/rFXyZreHpTBBm13DmMOnDXA3xUk6GrlAqHI2Bm69p2cbzqb2LTae4Vr8uMsehFzW+8tAKReQoTVSQ3vFkwOftmondKQXKB03rG8hFh+hxtBKk7xfe3KV2GvHjOttWZ9kwxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bVykxAHb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bVykxAHb"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so4352305e9.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 10:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620995; x=1737225795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wj0vaQkEs5xJl4pAen9qgeha8m1m7A5Rzf7Lm9ycX6o=;
        b=bVykxAHbnWeGK0V3Z+z3TU2goitHqHDVvkP9Ytzbmk6Jn9SoCIcGNy/1d1oOdEhfQ5
         84jJMJ12IbPIZ4cyVVYPu8+G3R6t8XDRDiri0Ps9L2I+/nT79gkBljs/AwiFAHRzg6Q+
         HbjX6tOHm6xugDuaejXatUquzZCn7ggQ0eloU1ncxb0DhxuaNRqHwOL8f3zZpZg4YVeM
         Th4bhDqv4bRbSwpCWGZF2ApF+JVSPoU/PBpsYKKKgK6AD5im0B5l/hgrA2tTokMODVOO
         StaXqWlFIuI+6FnCOR3NMXAFk6lFKxFVwZ4VirLekJyx8HU/sagBp30BsT3LqRmx3fce
         lrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620995; x=1737225795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wj0vaQkEs5xJl4pAen9qgeha8m1m7A5Rzf7Lm9ycX6o=;
        b=wWEUrab5qV2uKsMvnt267Fgjq8pTq9pYPAO10TwP2woToJgY/+VWcNJ0J1irAyb0ud
         NNd54HnI7zWrEOpPzFQBMixwP5C/8SoYXQOOnNQ0oyJMFUnnWrEpUOclNy69pH+rEn2P
         QvJJOa/lPXqfmaMrW1UA5H2bNcuwJdPXZKObPXmOusm07MaK2NF+sPoDy2+MFZApX2DW
         9JH/tuNouuQQyFjQSBOhhFnBc39trwdJ6U9+O2AnuWcacWGuP7SsjitH8Ym8iARGpFCE
         tn0A0meEGzANMStK3q2I68U2Ot75+U8ZLvzhr5xjcrG3f6XRGDvH3mA3aeJazni0MIss
         1hwg==
X-Gm-Message-State: AOJu0Yz6m77In+EbvX10hOkmaX/CcveHFv85oEFfVCBXjKJxwArM+Nz0
	44XJ9l+V1tZbU/zK/Ba/hsglyF+UFciw/jA+5WyVq3xlntXki3FzaXHuuqkxMTo=
X-Gm-Gg: ASbGncsJHpeHwqEEcX91+tnjgs/09XxfieV3dJZ6i/0OOWdrbpSYO+5ocKdedOBYA+5
	8UlrYN0xbVmKzPqSDgtSX+0PkCCegVQXN3c02LpjD8Ur3F4PBb/bjmQt+99AofLcFf31uJ+SJvh
	vksnKkwFi4bAKgcb68xCApBV4LV/piL7d2+AhX9O8rVN80HpRrrHQ40QZEnlDRa4l0OHsQwUfly
	Wmmx+9Hn/fmvnJHGRHO7YT63FHiibJL3xsc3bInaszeFX+cx3D4oefIS6aL9VzgHhV9NOxQ
X-Google-Smtp-Source: AGHT+IFkdUd7VDoNBV8ocBwBMK7rs6FdwNt8/W12AAqlsigJ8QUMOV8NnmmD5VdugurJ8kLk5KPd8w==
X-Received: by 2002:a05:600c:3ca0:b0:436:17f4:9b3b with SMTP id 5b1f17b1804b1-436e270729bmr58969015e9.6.1736620994797;
        Sat, 11 Jan 2025 10:43:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:52 +0100
Subject: [PATCH 4/5] remoteproc: keystone: Use
 syscon_regmap_lookup_by_phandle_args
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-4-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=U1lpQENfUy62bKJcih/Uez8/c/JkobPMvDaQfWStUtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngru0T07FNjrF45YdoyIyJ1321KdY1szRRaMcz
 awXkyq3kByJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7tAAKCRDBN2bmhouD
 1/y/D/9Wp1pomIMLnGfNlycKgEqkDLs1RC8JXV8VmnlFsO/F/uAK8zuzhbnzwYpcUyYhtvvtvxx
 DPqHgkEvgWB6c9+6paOQ62wZ5tR2FFXbZNdwSLAd+J24sEpjCU3ndi/CJI2zz1soIn4qTCGNc8/
 Mp0+omFvxrzBQlFcuBhYTSjDPbuKaMszNOWme3yxA3ML9DTNQYs+mQVIxFRE1ro1Mn4dy38xnm/
 yF7RPpE4VKP1SA/5T8iGXzM5PLFxXYmCbl92fg7geryPjIDMAeYuWe9HAasEA3DPuzMp+3Dtp5g
 InuAOkuCoYpwHdqhQ5fZfaWDazKGgpcOsLBJJQuvjadJDhf4qYbEbCXDVbjJzgvsfXGf09QwTAu
 VvA+QJ0CL78fuxrvpchTNwnmVidiaY8q7vkhjTL0qNIVg3VZ8ybNqoKR5s7qIQF9du+jqWx0Po0
 3CKfa9DF+PJcIoi0nP6sm8Y+aC04iLDecYPLQKWQUDhXLYnAv/uQNv7XxBhWi2VGcSV0ticidg8
 BfwMX0BLA+sgJ+SvlHOJ2t1zQNKSWUDWk5/8QKYH/1GPgOODY3grkMJK17SrMDVv077HwMl9uvp
 tKbvfdKBlfbTROPOXl9vq6zyqAKfuv/4rGL1JMDcWjD4d0tKJNH3ja92Mq3dvKGYn2MQQdUBqnC
 NxtVbmuq8+MwGjA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() and getting the argument.  Except
simpler code this annotates within one line that given phandle has
arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/keystone_remoteproc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 83c8e568f7ce3ec3ca3a534d2566f6437e9d403a..7b41b4547fa803fe19d5e5e6b1a8c8c4e5760632 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -341,17 +341,11 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
-	ksproc->dev_ctrl =
-		syscon_regmap_lookup_by_phandle(np, "ti,syscon-dev");
+	ksproc->dev_ctrl = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-dev",
+								1, &ksproc->boot_offset);
 	if (IS_ERR(ksproc->dev_ctrl))
 		return PTR_ERR(ksproc->dev_ctrl);
 
-	if (of_property_read_u32_index(np, "ti,syscon-dev", 1,
-				       &ksproc->boot_offset)) {
-		dev_err(dev, "couldn't read the boot register offset\n");
-		return -EINVAL;
-	}
-
 	return 0;
 }
 

-- 
2.43.0


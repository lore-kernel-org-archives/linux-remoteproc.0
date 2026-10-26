Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009388;
	b=tvGh+DXzJqHChfd/FwLwMpdrtyDI63mliwKUDTmf6IaO5lka7W2XVF5kL40wG6WTr1wg
	 m+BWRwEbaE7Nv4gRQEqwq3pUC8HRydXok41KoD9yBHrsU3pGcEGHgJBUtpPmJU1SSSnk2
	 OrbEuG2NtA1RMEI+6Is4WMiTzxMvQK7AIBvKpCL7B2h5psv/D71CMWfYaU3BT4kgAwd6w
	 h2Jit82XRgUvTElXMikm5PSXbN+wc0hPvBpvrncZdeboQ5kkHeLkbHbfrX4soNy4yeeuA
	 fu21DElonS9Id558QhrM63YsqaKI36lpMVby23/FGGWGDpZw++vjSwopbnKiEc54MFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
	b=DgmifdZ1j1X+QEUeT7P4aJtbAIlIyUgs6KBLqdNG0h+WWyiLeZHRExXz5icUqgBP83nN
	 eqCjqR1eT9W+NYnzn1t6FU8jIRV+JA+UcY7ey/PfSCXMfE3DxlF8dmd/TB3YTe2mtrHe+
	 wd9t34Xl5hF5nRQnYzN8GgBStXFT02TMbdLyFoY2NwzfOE6YvvrwrCvKyYdHeikORVmot
	 BMVkAXJ3+7IZgPHCNRPj/McTe9b32VQyDrmhiLVkujfb8BLwpVYVJUmC59M1M1ikT2f18
	 R8Ivv2aU0iQPt/+AfN4He/Pak+xGgoZsXQ80bo/v2UlysGtkCI9OgwsL03RyCSvrPbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JZuZgN3Z;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B256B606A31D
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 10:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B256B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JZuZgN3Z
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so16761125e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009385; x=1793614185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
        b=JZuZgN3ZaHBU5bf9mP5LFwOJZ3fHDzyePPVR6tvhiRp9MzApvgLYo7Y/M5/f5wpIXo
         fcgIdbTFu2l4kaKy8XlWcj7JFIrOoG4HE03xSrCIpXxWIlox3nHrspsLd9NxNBq7mKJ5
         th0/tHhY1jQ0VglgulY2rma617ptazwJ/HEQKun4eQc+Z+QFl8UeASLU+AT9KahXPSsP
         loTawEQkK9R3vZt2W4jlc1ClwzKmkzehrcLOOetf8/0he8DlxAx/ARYncx+ULFA9ftnA
         KkJwDR0ubPc0mSsa22cYpfxAMGCAG/a00ry7qWaIE51/XuGYeMp9F1mCcg6NrsUDIQI0
         rx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009385; x=1793614185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
        b=iuH9asoySY2KYHMogj3TWVzQFtkYOtqt7YMu7X48KHGoa2nZVdWxZugNRCGNVmZcAH
         ZpaNhxdpT/huvhRDwg3m/F3p5W38Vv9YWfX5g2wLBDICEO6CeHRk3qh4YgT5Ffr7B46V
         vvkOTV2S9Lu/bJS64cf+d3HGjwJArw3cFuIeCu2F/XOmg2Yhp1t3seVQVfX+Yxyl7Y0X
         +1az2uo2DIsv8ywGIkZRrwgvKwn25HeAarcCz7vRdYNlNoCp3Ebu7NwvTNOGO5IzS8/U
         HdWp/BsILnA7MVkVlAN/C6Y0IoyG3zD5+o8maNDYpTTcSx72vaS8nZzMFvQkBL/SX4Pt
         6ipw==
X-Forwarded-Encrypted: i=1; AKwUvBwjZssMPvMZ43uGU4vpjSVhMBk9i8WyeLo6Xt5iUuy7uJHEfva4meTcz/0N14LYoecevEh+4vzlJ2LZzEtHyXeA@vger.kernel.org
X-Gm-Message-State: AFq9FYIjc/MzK1PP0vCyRbHHj0Yo6GUvqNy3SRoRtvPPWDj6tm9/SEen
	1tvK13MVQM5OYZyUFD04Gch3fjlxv5VSmCHaXWLestLOVCsJMTwgiP7/NIiIV/cGEmo=
X-Gm-Gg: AYBFou3qyXNnKI2Dd8q+o3FV/+Tq2qzQLSYmQBMMOyoceozSd8DXtrkcqJ7055WHDj1
	bH2qFbSYeh1vkPkpgIbIPetqRX3tCN309acBqmfL92Pv2ejcKykdT/XwNN6Sv6UCKIhLBEHq0es
	9UjJsnVnB/FqLZV4mUkYif1mcLjWVO0OWiQGi6oZilcmK+E07TlKw6aDmbzXnJkknZ3vIohzv4c
	lHD/20jVVmdaG7Mh1Pljce9m6tM29iUZT6ad2OnIPUtYunhKPyUICx0FZrXMhtr/SLy5aAf2U8T
	qtl09BxOeRkqsnp6lc5DLMwSrDYC0cWcKwDXDRh+xJXbRMhvwmFd6k/xmnQp9hnKmDwO7+6NlHM
	mq3V9cJdJSS947eQVGvKunR3t4rWi+udbRmIOBSDizdu2Q+9HFPxBArQmLAD4R5J/QfUM2KGF1R
	E60F4gojW9LHJ1SHKYbsOIsRLkC5MCE4jz+RsXxU4SfG1A9Qn83dIMK1hU0JJ8gOyzyJpxKoZ/N
	5Uebct10FsUJlMv7KsuVNRDQWD5ctdcGG+K56Z2Qtw8EoulN3hfAA1Z4iBftYml8Twskddcidla
	i8+4rBlo2ITm94cVmC9DGrftkZvp6W1zIFvSmJwI3g==
X-Received: by 2002:a05:600c:1d0f:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4a35acc76d6mr115228495e9.32.1793009384948;
        Mon, 26 Oct 2026 03:09:44 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm191748665e9.15.2026.10.26.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Mon, 26 Oct 2026 11:09:29 +0100
Message-ID: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=p8BCvf4WNLvDTsTcauj4vL9ILkW9KOR07cSl5g6yvHs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3ybbdZZQCmOQEwlRereTB+cpQErFhNTawdaYm 8GKarLnZ5OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m2wAKCRCPgPtYfRL+ TiTnB/9q/2uqQ7mxzRKdtOBIs8bbAq6IDNldcSzkBYE882FHSYLuF69QzQGYggbfdshBZF6KfEi 72spEUCb74/WTgDet3zcw610iMpBONFQx/bnX2ygNae5l3T8DwcJ/QLRfRstK9JJBodno+45XLP qFCvgs1ubvMdtdoBLpPTCAmEADK2B5fhqO3+LuR6opB9OseqLp4zSO4/4GF/YxM9aZoLnD0V0Zw aqqoMBTyaJNu773gIqT894WQGRijP+G+Q8hiA8RsiEbmHCXr2rSjjEE34SYCF7AQp7nQoeIZX/R 0YHk4Zo2OTearFppBqodw/347Sk1klnFu9Nxl5okTb67O2W6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

I'm currently working on remoteproc for ADI's ADSP SoC family (SC598 +
SC846 and others). On at least SC846 the memory of the remote processor
isn't directly accessible by the main cpu. (The memory is mapped into
the cpu's memory space, but cannot be accessed directly from non-secure
EL2.)

Instead of creating another near-copy of rproc_elf_load_segments() that
just differs by the memory access functions, generalize this function
and make the driver that already has such a copy benefit from it.

This is only compile tested.

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  63 ++++++-----
 include/linux/remoteproc.h                 |   3 +
 3 files changed, 69 insertions(+), 117 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3


Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46E1B652C
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736620991; cv=none; b=K+FGGrNwSEJvNWZCyqKciT8nZTkEcahLVGCgq4CNwE619xIlCtsO4epybnqeyu4vAdAujKCiRc9dy/fNsSqda5xH86XcXdE/keftU4sNCjWN73S84nl58Lsnfc7e+rC7sG8Vum4YIbS3qMxJFSiZ+XZr6h2/d6G7p3SOeyxGAao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736620991; c=relaxed/simple;
	bh=dxtKqbdRSIen5PNncZ7Djuqqg+VHZ66erVjbW40h3Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQMdYxecRVajL+28HLpUXSWbDLixP2LgBlF4l73d1yQxyB7Y5kxz80RpwEP+/hgs6BfO6D6tMTNFTOPOGJwkq6ht4zTC1JQQxrN6xBWMxNBv9RdQI2qZBAIuAirZUM17ufPGWS7G+JSVHJhNxmvBIAY1fM8q3Jz7ml7dY4pBPNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ib0gemhf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ib0gemhf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38625aa01b3so322503f8f.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 10:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620988; x=1737225788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrWgmrs35qmM7zcBJM5ziQC8fwc8DVMRLjP8FP/is9k=;
        b=ib0gemhf4FiPJ7bIeusip8Im/H2kH38xsNHNL4JYSTbloRWKas32mw2Eng2or+IvV1
         TkRn5R3/viyQq3wZNPrbCRsIqHQwJB/doSERLK1qiTNnKqDEaHbUch8Ur3SKDStpVgp6
         FKtAfgMWSBgOCYKREyUeM36IiRKsmuHENLboZ7fH+nk1WoHwcS+G83DOx749kuzjcpmD
         O0aifEb94FJy8S8O+x+NbWNxa0DFF8gRSKFcrDEhwfBg7Ka/vbkAb1W7Hz+1esNSOlPZ
         ki6vgY2NQchDh+z65w4KcEqNnIjHjFJwxF9f+/1ElrbA1IefYhVneU0AwJJFDJtlgVTH
         AobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620988; x=1737225788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrWgmrs35qmM7zcBJM5ziQC8fwc8DVMRLjP8FP/is9k=;
        b=FO7VA0BtKhpXXdiSXRCJkGH/tyGpU8QbSrubhGQYi3fyWbs0Lx8WGhQMzrCRUhSjmj
         B4faK0nOxbAjfs8rMrKLtlw6jxHQY/dcgcovtpoGA0KjQiRKo7Pw8f7hU9h0wmblVtpi
         9WsdvzttstluEfrOJ5BcI0SI56uaM0wDQEE29NdUUezVhYwaRuDZJ01YJOvfaRX9h/S+
         1UiLXUd1L2F78OoTxw2mhT8XkPm1yrZZiVTHrX/SAsNOUYnb0YPNEY8d/mBYx/e4o59G
         /Y73f8iq5R3ru3XnQ7PuaQITZaF/EkNi/tqJa+eal7g5CBnfwL9vtMyDwE4pOztQYBJA
         849A==
X-Gm-Message-State: AOJu0YwHafhoXLNG/YbuXvoZ5JGlWbBF3tr9ogfNeGLQASHRD3RWvZm1
	oNn9pS3ahdETHzjAAWJSr2OThQ0Db1+Fs9U8E4A3gk9Sj0ut8TPc+8QNZELhJNA=
X-Gm-Gg: ASbGncti/+hSODOM9m1lbzA3KV414aHiRiejMmd1IqdFCwjLglVWhYlHy8Rs3LJgbUT
	HJe1u1cdJpdNHm5s0udmKFtmqCShjewupzAIVkITyx23povFcm9p23rCItUXdGvpKrpUsbYnUkP
	YjjVdlPeHP/QowKtkezFljaaHSj2W81rtB5w0QgPW53x+agLxcEiME2nIx2N9P1qzsS2yJjjXLe
	/P5lu7AfUskNXmfJRLAlt4tmvQ4nXoBX3+Zhokb0kAnbJ4yBN+9CycSxUhn4++2VZ3BzEwq
X-Google-Smtp-Source: AGHT+IFKDnROQFshibfBSRD1Lf3riCi0exaKnWhO407hgCFDnzE6W++oH5UDeHTKmJMD9omzpTVJLw==
X-Received: by 2002:a05:600c:4f03:b0:436:1ada:944d with SMTP id 5b1f17b1804b1-436e26ff7famr56841985e9.4.1736620988522;
        Sat, 11 Jan 2025 10:43:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:49 +0100
Subject: [PATCH 1/5] remoteproc: keystone: Simplify returning syscon
 PTR_ERR
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-1-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dxtKqbdRSIen5PNncZ7Djuqqg+VHZ66erVjbW40h3Ag=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngruxgmXjE2NenPQvILvqAG52ACPXhjQMaq/PA
 y+Mf4jh0fmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7sQAKCRDBN2bmhouD
 17TWEACEqyJNLB/LphpIvS2gKLrGdhyf+saL3KcUE2FQkE6z+o40bCffqSAEHgcaCVxCzURTM6x
 Bqz8k/RXxeMwQ+rHvLRbOS3cbtI2KRJSYQAmilUBHpSRMNuqPzNVTbOIXdjAmEMVYXrV8U5I+UW
 40OcL61dEQsfnLkT+OywO22JSX1hWYYqmj/OavGgivZiriwr85OJrqI0chsTmGUxqWe3vQrHxhh
 6kHn9ifUFxPaUsZLnmrcWOvWzuB93Hl/Z8NTmd+za/Xw9CkYs1oNWOZNteeLQoeh7M4izktjEPb
 wfGb6/RwhEN7XQbyrKiINfzoBPldqiVnrZ9M8pN2SAavWdRUlE8vmoIZBfgNaLnvDyp/nxT/Mju
 XW2WlVOocPc24DoQS6LhvWyCMww63DBPnpL3W83ECdcZahDdzinWFF/G4EdfZfQ0iwQpnGM8bYM
 oIXuxfV7XR1rX1sFC9L46DBybMDiig+YtreFlVN2sz+ZrvvPF2hOsQPfddA60Z6nTWDGfZMwr0F
 IO4uAUkQfJTq8xE16NNFwik6aEgOiRgdi+2Lp2G7tNoz5062D4z2EXKQVC7fRpH8S2qbXClz2j4
 Ayu/WKa8rwbi0O/SGedETwp2Mv4EgJMRCpAxpioix2tmoyFISTSwuEba8s2OAm90o1h8h+JkaOw
 h9GFaheuc2AYC9A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

No need to store PTR_ERR into temporary, local 'ret' variable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/keystone_remoteproc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 6e54093d1732314d234e85bf6cf7fb6f1d9bf994..83c8e568f7ce3ec3ca3a534d2566f6437e9d403a 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -335,7 +335,6 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
-	int ret;
 
 	if (!of_property_read_bool(np, "ti,syscon-dev")) {
 		dev_err(dev, "ti,syscon-dev property is absent\n");
@@ -344,10 +343,8 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 
 	ksproc->dev_ctrl =
 		syscon_regmap_lookup_by_phandle(np, "ti,syscon-dev");
-	if (IS_ERR(ksproc->dev_ctrl)) {
-		ret = PTR_ERR(ksproc->dev_ctrl);
-		return ret;
-	}
+	if (IS_ERR(ksproc->dev_ctrl))
+		return PTR_ERR(ksproc->dev_ctrl);
 
 	if (of_property_read_u32_index(np, "ti,syscon-dev", 1,
 				       &ksproc->boot_offset)) {

-- 
2.43.0


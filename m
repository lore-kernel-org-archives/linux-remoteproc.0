Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01744D8DAD
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Jun 2026 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659482; cv=none; b=ik8d12IxrzAZ/KXXKUTPUFyp80ySsM3JCo36CZTWiNZFKiT4ZcirnRslCVCP+TAdbGvb8pYrO4pY+mXfedtdvLMISSmYHhI0MFar3sG7vdr0ZfGTQHT8nroC2xv4OiGeKMoeS9p/3LfOtw8q2W9sQ/1zGlAXMzNlGlXwxGlpbb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659482; c=relaxed/simple;
	bh=vsvztABr3U6ZwEr0klxubYysThxRTUKFsfzctGVfq8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2jNfOJLoboucnfVfha/izXJ5qOYOyHrR2wruw6IQji8bwmvmTjLbxANuzFK9oPr8uqX4ThrT7UY3qzLIBKnVIP6Fgif32q6DEwijNV3Q4A8UwPLO2qBcmvWg4GH5GgMMjpPbfVuXJuG+IKeYskm4cTGtakeIz7pwf2PD8JhKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKXxX9F3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKXxX9F3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef4223be7so1015789f8f.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Jun 2026 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659479; x=1781264279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZJNSEfz3QG6ZL5qFVwPBISzyfCqVigytPuqEa8Po8M=;
        b=YKXxX9F3paYOn9GtFIH6vbUunVhpGlCtE+7rU+udsuYbhEgUhZPQ0bYtRpw8X33TZA
         Kmp/wsSYZ4f/wjWSsmJIGMS3B7OYAU1V/t40ebuLhc39vXmEp5k+vZtvyw6FtK4jeuRG
         kkeTH4adz+vO+LTpe9iRa033Ge8wj2kG/OXlafiZbDqllT2Y/NsJxeOiur8zHaH2FN+4
         Av76tUoWaLB290Jo5mTNTdOyG8AGYMuWc5goAEe0Zn6UbgaO1w1T5Hs86NFWB+wLLPBs
         LgJqFIkb8gG1s8juf+MX8qHSP5q5ruJ0XUEYnkO0zkUNaPifq6w/WtbuoWOrITxlorL2
         dzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659479; x=1781264279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZJNSEfz3QG6ZL5qFVwPBISzyfCqVigytPuqEa8Po8M=;
        b=WAORmY7xAZyvvTPcHMuPyQt2u5nble29Ez5yAnwr0prve3TMoNFkEKApB7XCLnwN41
         qtI5yO/W6WfCbFGrHQmqfjHYagbdBetah8B3XpkjTZppneK6IE651E3aK8rY1h8EW4ko
         5DGpwaTJFrb8knRpaOo1/OQHmSLLLovPhjjGwQfgQOVPZoah/03/1kukjELYfA9JIAaz
         fVQjrY5Aw03qpIpD+8+yT95P/67fXHRKGADSd4gSKY3A7QDuEqUEinZQ/s8X5L8kL+qt
         xb//nvZlvsmb7JtLuUbD6nUkQFJjBJDHFmTcK12TVQnZ/g1INIJMkL9Md6pcGeyaOema
         Yjuw==
X-Gm-Message-State: AOJu0YyWh2llcyy4FoJyTdUz7zREThq4PH/UZ08Ip/Go6QjQi2/p1nqB
	opV2EauUTbmnPyuzvxvRhGNn4Rj7/1tH+qCYuQysHu4ab0uTo18djIy7
X-Gm-Gg: Acq92OHz9O4nVTY2PmEZUqj7P1FuV5WnZKJ1m3ApBAA0sQlyfusFSHAdOwXHHSS+Oej
	RU3epUyxncTpYZ+6zumFRQFz6uebQi+C0rOvCDRHT9R6YTtbnOrO7cArm3WUmGA4/Ivp9o6VrK2
	YQ9brMr/4C91VZ/0pyPSInVHOCVjXPYhOCRnguXJ7hS6PZgB1buuF1KdOpSXrgaFF/WA0tGUkRV
	a1EY9f6xPZSM7we6Lciy7Metca7IvXJj8ubVY3zti/VcuV/5JsAVYtME+XMGiNPXSKN/OTgQH53
	ybYEYkQOGLG3zquOEZ0Ea35FNLVOMjRdTnOthtNJ1Mr8PBT7/7sZpoFQpGhVJAujXHrB+o8LU9l
	mqwjGaDhIVtAZWGMylFQevXBfs18FScchaotg6OaQp4yMQmjx7A07rfh4LvoIJCVubUpWGrz865
	+Pwp9Z9AHi8v5xZfhPOrEuKRKzrORZDxl33Wj4wAc2WMQbXmDoJEoZqG6dsDUYDNsPXzKF9ps=
X-Received: by 2002:adf:ed0f:0:b0:454:a12c:6cdb with SMTP id ffacd0b85a97d-460304eb55emr3605857f8f.2.1780659478953;
        Fri, 05 Jun 2026 04:37:58 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:37:58 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Fri,  5 Jun 2026 04:36:18 -0700
Message-ID: <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The names of the carveout regions are derived using the names of the
reserved memory devicetree nodes, which are referenced using the
"memory-region" property. This adds a restriction on the names of said
devicetree nodes, often bearing specific names such as: "vdevbuffer",
"vdev0vring0", "rsc-table", etc... This goes against the devicetree
specification's recommendation, which states that the devicetree node
names should be generic.

Fix this by documenting an additional, optional property:
"memory-region-names". This way, the carveout names can use the values
passed via "memory-region-names", while keeping the devicetree node
names of the reserved memory regions generic.

There are no restrictions imposed on the values of the strings passed via
the new property since the software allows any name to be used, with some
names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
special meaning.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..8e3e6676a95e 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,10 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.43.0


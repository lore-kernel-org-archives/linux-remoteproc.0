Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A139E177
	for <linux-remoteproc@vger.kernel.org>; Sun, 27 Sep 2026 02:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477809; cv=none; b=GTobQpGrwMtGBQO6Iadh8q8BwpXeCyhdzwaqHtA/ktnGBP2Xy4rZ4Wgfx3wiGsdq1shP442kMsvyDsCXzqLmcfFiOgkiuB7bW0s/piv9NIkLmG4p6N8ihEt1iCC+RWqLnrWAJDGQIhvMO3+VT+S0huDu37DqwgQUaqnRCmyTUM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477809; c=relaxed/simple;
	bh=GNujY27sJq1QrMAiEnc4wu/PVjXA/qEQR0U1YSIve0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BjFVaiuog0s2dKZkI8ybzXGRbPXtMr8Go2Fn1E8SppUmD2fKBUMcFEWnGijnJH6trDkcUR8PAoZ57D5NNif5+/jBuNXL9fsQYHFhU/RzeNwlmJvLnUZie9C2qwfbz1EKdc1CTCLMOwvPmRAEDFCqc6Jdm4ypE44xL7qxtPFbZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=lkTPYaeU; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="lkTPYaeU"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so11348615ad.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477807; x=1791082607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=lkTPYaeUuIKMPh2pq74BeIEAKmVudPfL5QWljFogQ1a2+9xZa0mAuboJJC4p3ubxiS
         F9ynAwY9hNfgrJJuJBBGNhzxdqB/34mPL3hUbwxXZLxbyoEUr8gzIUxqgilr2HPBeeEw
         v9EvSYh4+iZulyMMWKMy8pDinsHW7UHfp+BT4U0i9eeVk+BEYOHwU/k0xxmxqJYc6Z3H
         DVn8RhcNM+FNk+YHheYgAnXQmdT4v4ZHKomMb2Tc6BaH/vW7MXj5U4IL17cZ8IyybUCu
         +yJmK8SHds8kCd8B+SvP33GZwFZJAfS/gNIxGNqlLTls78mh/beunSiP1hATnl1CCHcD
         wDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477807; x=1791082607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=zYUgamHiex6754I2A/CVkNuN0O2TSBVhxcXajrAyKUs5x/sw9/5SdugGl6q0unM6LJ
         nfqH2PQj9U16fvnxWSdgqxFYyUEezOKYE1HyWw0bf0VpKVk3+zrIJl3AQlUG4raiHJ3m
         iRGkSyyjnbXxU4dka6fsbfdsT2ubatTAMC4fzXGLN4DvIhztn5Cv4+XjPbPFy1gvT4cF
         SOrKsZ9X9WwxV/lvnfMqyAjjx2qUEIb5tRLdejI+eMSKnFZdiCG+Ye9vWQTaNzKLFaiN
         aN5jlNI2z6IfKlupbQq1onaFbOV1x91gbfnkzq+146U34gTHUHVts+fqDUFFfDRTJWzl
         XBMA==
X-Forwarded-Encrypted: i=1; AKwUvBxkc2qja2GhukLN6BIsGePb/yzjyULGZvwjQex6Ncf00UPOKW9PyAv4OfY7utfUXSNPzpL6QSd9zGf/YeAu7/J8@vger.kernel.org
X-Gm-Message-State: AFq9FYLGW4UL1mwvhwE/LdXDfLvjODZiZ4bjIIXiA5rJUIh1NElizjxH
	QBFFum1lc2AnYNPYjeqblDdrKXZXyMDMouDAyxitPFwoCOcG15klPAHbxCXZHOggNtEO
X-Gm-Gg: AYBFou14FqPEcn2oBG7vu2F3fGsusmFcr2J1cc+g8pSqT1k/GDAvlbx+JX8N889KNtu
	XqYlGzaFKyspeUf9lQEBFDJYiSWGPBksq+oXekAX9Zc1q6agf9rBiZqZWKMqveLSKhcz3hpXhPb
	fJnpm13Yz/aAZ8NbWL8+uEL3LPYVHMD3C41S5aFJlzRYx9gBoV59aFeSoxQFKEN56uZ7XZp9ho6
	FJggAy5sxQ99yUxck5BNBwrH40mk7V2LmeoOtVaQU7ceCHNDyNgzxuQbbOhlp025qmzR9NxdiM3
	4FZXc9MkONTsxCxmdaVYCjMHrO7JSSSiR/zM5lf+7gWYpYo8lJlxJWwVg30g6l+n7o4a5HMQ6iM
	XJRD4CXkmVznUuV4ixk1mwsyZRJonnQLhVYl5X63TvsdbyCOPnvXttpLqFPmRdwrxW+0enFeuxH
	OYovrEiw9hgdZTgPeTIkT/peYjrF6poFoxBfhFOmAR32JACMhLmsiERslmMcnabqYCOg==
X-Received: by 2002:a17:903:228c:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2df7dc41d3cmr92788095ad.26.1790477807346;
        Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
Date: Sun, 27 Sep 2026 09:56:25 +0700
Message-Id: <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The D1 and T113 have a hardware spinlock with the register layout the
sun6i driver handles. Add a compatible for it, with the A31 one as
fallback.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
index 584cce3211..13f9a20ae1 100644
--- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
@@ -15,7 +15,12 @@ description:
 
 properties:
   compatible:
-    const: allwinner,sun6i-a31-hwspinlock
+    oneOf:
+      - const: allwinner,sun6i-a31-hwspinlock
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-hwspinlock
+          - const: allwinner,sun6i-a31-hwspinlock
 
   reg:
     maxItems: 1
-- 
2.34.1


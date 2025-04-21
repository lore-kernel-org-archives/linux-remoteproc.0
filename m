Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14B41F180E;
	Mon, 21 Apr 2025 20:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745268580; cv=none; b=mOuakmRjlcFoh6muAYUkMSh7omX0NTvX8QHGJIEgRAo6YyIN1kwqOekYKxFZXfa+qdAZaP4NVoKXkYmFn1r5BM3tPftEF6tu8oZdDAyJLktOYP+lGBkvqW+zHZ4HEr4hP3oFZ8cvZN/STZPu0CwZleU7qI0HdUarH5huM+okUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745268580; c=relaxed/simple;
	bh=tApRshAmb0IYmM2jaD30rYtdVz+5r1FcnHKRAmrj+d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RT1EtOflJkKkRQ70oC0LobT++93WVa/o2ghTfBbd11vIV0ApRxFC+OODBkdGNBj8qp+8sl7LfhG7h39aEelR2xDXkSS/By7JwTT11uYO0lE6jcv8P68yQBI0i0SuPhvPcIm+5dhiHjXLlzE85AQG93LF/uQnuBoMQK/K1UGORvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VZNVnHPN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VZNVnHPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745268577;
	bh=tApRshAmb0IYmM2jaD30rYtdVz+5r1FcnHKRAmrj+d8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZNVnHPNYmte6L9Udo7AsosNFHhX+JQKq5HCOfOgEsiIOTovxNRQ+ALMssLwxEisN
	 zRN40sVQQ75iZ5oF2jo+6WU3TcaO2XsYquca7goIXauDU7HiEat+Gd0tZ1MVzXXyHU
	 xQ8QvZSrb5MXTXGRzs1Jlt/6KeAV0wXSYfiZPBm4zWODqDlei78d5rBPrCqHv+gU0Z
	 i/u7zm1lrWogaf6036ZTuEyUIsRNP+IKQO9mCgSxqKWH2MC83mGpAaTeU4YzqH8GAy
	 naF7vBNuDnqIQ1hm4ZdmlHly9QgwQbGgyuq9qyuiKqspk4ZIgJSan0G1Y4KgjhskLL
	 FNeg4ZFMinH2g==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 379B117E0F93;
	Mon, 21 Apr 2025 22:49:34 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 21 Apr 2025 16:49:06 -0400
Subject: [PATCH v2 3/5] dt-bindings: remoteproc: mediatek: Drop redundant
 maxItems for mt8192/95
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-scp-dual-core-mt8390-v2-3-c84117a959a9@collabora.com>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

reg's maxItems is already defined as 3 in the base schema. Remove the
redundant assignment in the if branch for mt8192/mt8195.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 04348cfcb0424dc78ff1ddd77665285a052925e9..82c7edd5a2fbb8610315881a4033a3a43198162e 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -187,7 +187,6 @@ allOf:
       properties:
         reg:
           minItems: 3
-          maxItems: 3
         reg-names:
           items:
             - const: sram

-- 
2.49.0


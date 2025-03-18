Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6155E2063D5;
	Tue, 18 Mar 2025 22:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742336681; cv=none; b=IMu9iyfmK+m255y3yh2HwMTZWu56LdVok4a1ScBlqvB/Z1d0uoegRH6LSfGK5Wimj/uEsBtcOPeZYD38LF+YsZTzKHW/zdMKuKuYwmgbCMYo3yngybNlDEFscOhsATCrW/LYX5WLPhKRznxNxVEgMU/EhCGAbLzny5ylOjNcfLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742336681; c=relaxed/simple;
	bh=up+BGxd5yruq1/jjYQr7mm3mJ2LrG2vsIBarOQEem10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQAhsZlkIQ9xHSYJsjW1+9/BtfWwn71Vuin7mNtoeJC+TG9VQL5VkFQfLBK2kpcRM/HrQZMCaH9WnNa4Oo1+conhm8M6Dp9uJjuON0CauHSkZYlQ/7X8jwMF0C19RyXK1xjLPi1BBH5Aq5DdF0Kjb/BUzvIRnhc1xGLTwPdi3/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JM0MRf+Y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JM0MRf+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336677;
	bh=up+BGxd5yruq1/jjYQr7mm3mJ2LrG2vsIBarOQEem10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JM0MRf+YtlyHEYRk8ImzBThTeuBeYnzaebvRvz490385HzecGv5k1O9LtoooxGR2v
	 hZcTFmYj0SfCFEkKlPM6jBfOlvpt34NAhPmeklMqkMD912aF22EzouQ+L5kT68q3mZ
	 MCUSbKYpaFFk0vGgJCLACfBs2OF4vNjHVRAPtzESVKEcE9Te6vfYhVqIQ2pXohLJZ4
	 cFSWW0te4RVJclYPhddQjPGrPNaXBAjCEl7PYr4Udd82TeCnDDqM/Gt0zjrEOOOloR
	 rrZEj8LcASGRF/Xo8KvKZjmBn1yNngaLhlCKqFVMLf0dLf1fi0WjMG5ggO4V+okdIr
	 hOOxg0NQzeQAw==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6A7F17E0FCC;
	Tue, 18 Mar 2025 23:24:34 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 18 Mar 2025 18:22:15 -0400
Subject: [PATCH 1/4] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-scp-dual-core-mt8390-v1-1-8733e192cc73@collabora.com>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
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

Both MT8192 and MT8195 have an L1TCM memory, so it should be described
in reg, and therefore reg's minItems should be 3, as is already implicit
by reg-names. Override minItems to 3 for MT8192 and MT8195.

Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -185,6 +185,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 3
           maxItems: 3
         reg-names:
           items:

-- 
2.49.0


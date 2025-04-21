Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A11F180E;
	Mon, 21 Apr 2025 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745268585; cv=none; b=lbZF/Ah62irN/mv1wO4DhXzO62UslhBI2b6n8BWrMOev3SksJFgNBoa36Kl201++ZOCh3FdJdb0atDJ2kc4mCQgKkQFpB9K+LE0ZI3lJ1iciY4AJFctFyC0LoazV8g7PPYhko28uuXQW7EPPpkNAnEVyYlSpTrqBg33NDeubd9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745268585; c=relaxed/simple;
	bh=ZXE55CQ6tKXOBWcsEApxFOCcB9MJRav1Ft8naFxiU5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aN3n+E8HHGUvH7wo+az38zUEVh81SckMXN67mXgC9Vub7UiZ5YFutzSHMRQqTyHjsqSvo6z9fnpZZ416F+wqdhQI2kiFmP5mLvJcixfN0XOVaTQNNNXtGkQDs/kPnMiQY2Ji9melIxrI/ZGW1AiSFBegiNHR1nNOzmjjZXJBRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fjcvlpaS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fjcvlpaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745268582;
	bh=ZXE55CQ6tKXOBWcsEApxFOCcB9MJRav1Ft8naFxiU5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fjcvlpaSsWhC9Q9A1lQLzwCPUsP0oOrjVUMOS50F+K6HAD46EqWL6yxYA+CDZazyK
	 hp1vUGfyFgmAFKtfoF3zgcXHfREJ+fP5T//ZXfq1T9NJsyGrDheGWw4ylyFcPIfNuj
	 SBsuYkfbo3kewPFzn6Pj51YL78LcfAJH8MxEy7YBEpAg3S3C+9hNDSLRQw0mUSSSnt
	 N6yCieGcmYXkdXDrP0pWWLXKQVjVO7LnNIdxMCO0R+swW/ITf80jjzkSokq/lpB2ew
	 wq6V5xtygHkcxhdXXCqyDSfnJWcGVpIXY9vEUAUxu7WuNXgIDx3N+/DWb1X1ru2rCY
	 X+z895908TfOA==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4ABC717E078A;
	Mon, 21 Apr 2025 22:49:40 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 21 Apr 2025 16:49:08 -0400
Subject: [PATCH v2 5/5] arm64: dts: mediatek: mt8390-genio-common: Add
 firmware-name for scp0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-scp-dual-core-mt8390-v2-5-c84117a959a9@collabora.com>
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

Add the firmware-name property for SCP core0 so the firmware can be
loaded from its canonical location in the linux-firmware repository.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 805a4bccff33e3ac1a16c5fb2cf13914c8e97746..698054ed5d6d4f7b947db6ab5335d3b202bb84d9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1060,6 +1060,7 @@ &scp_cluster {
 };
 
 &scp_c0 {
+	firmware-name = "mediatek/mt8188/scp.img";
 	memory-region = <&scp_mem>;
 	status = "okay";
 };

-- 
2.49.0


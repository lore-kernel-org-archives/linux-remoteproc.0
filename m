Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88FF2139C8;
	Tue, 18 Mar 2025 22:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742336690; cv=none; b=Hm5pEJoqJ4AI16+0hVTwBImINQbeYArrAWosbUujrcxmeETNvOeHR1Em+aRGJgvnwCHwZilyZ/pLJGn8gPLqwgbv48sUa6pCZ+8Nep91w7Jhxk4JKhpv7iICs6OUnTmeNsdFFcYj/4cHXBzPVtnPsaW0cLZ7wDyhoiELTvtFeuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742336690; c=relaxed/simple;
	bh=P1vtmk+9u5G+Zjiu2jlC44IrlzgRmSDtGJusM9LFedk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYOh082A4mf1nztGposombtU4yJFJEqHwUzfKFEUr0U/Xobh9GmulSDSq6DHXaDqjlMs31aFSYXddIfDilvyZEY/QZfui95tyzB5fkN8HRpOoGHoFuM4LEhKELvTj/A2+MBXWoEt7SMZvpMesvSBEOjwm8rsqQLwM6RNJQiFUK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aJatjFct; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aJatjFct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336686;
	bh=P1vtmk+9u5G+Zjiu2jlC44IrlzgRmSDtGJusM9LFedk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aJatjFct7ueDLUvYjXrczWUQf/Kjw0f9PhAE4Er+3AZ7E6nfd+0SdMGwfK60GtHCD
	 /Cr97lnTp3Vlv/K+l6dvmsNpajw5+uOYadyUQGeDy539Tbm6bFjB1czcXIq49wGWWn
	 vJp7BspKP9GtRYJ1eQtaUwEv49Fyjk4Y2xAC9gy8IUvmYL5IPBknNfuz1aEbuyOlDS
	 3BXhJdLYDH9wIroXA2B2Ds8izBS6OI+wTMvDg/RPsmnsqgAdy9iA7PNHuvpyDdy2/l
	 /KTyCRXm6LwIzBh4dE+qrGw5iHGr5Luy5lUVDG/cTX/jv5gUaKadzB6GcjSizELErK
	 cUyNzfRZGC4/w==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80A1017E0B25;
	Tue, 18 Mar 2025 23:24:44 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 18 Mar 2025 18:22:18 -0400
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8390-genio-common: Add
 firmware-name for scp0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-scp-dual-core-mt8390-v1-4-8733e192cc73@collabora.com>
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

Add the firmware-name property for SCP core0 so the firmware can be
loaded from its canonical location in the linux-firmware repository.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 65952bcf5d03e3b22984dd3e997e7107e74dac72..53951817df468ee27d20db1f1028c21a1832b880 100644
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


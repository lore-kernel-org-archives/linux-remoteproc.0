Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605AE3FE359
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468980; cv=none; b=EF0gYska1h9+LKMUc8lPZbQ9DemhNjqI1ckLYloeJ92WNbtnyRkCNlm2YVllXSH8yJHijE5rulZuiY4FurhrDb8mMiGynHQ2VSTe9fvSgC7+dBxvWjsUYDknayZpYAfrnFNBEITPkDmodl5vrerlKfmYpjq2IaB/7lPs6cEO5Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468980; c=relaxed/simple;
	bh=VsaP4LCm9vj+GPBKWc9GbqkMJjZILMOds/rJOobS64k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G03oc9MhTmlWNoPNhIhvslpV22mwiRVSnwnNONASgTSky02KyDiNeGgyYM/v80p4pV2ATpDzReGQmyAAxOHoES//siXHehjjFnBYdHyzjkweW9HAXNGLM87m0uKeMBPW2ZMuZMVZve8Lj/QrD3kmd2A6cfvOtSWb9WQ5SsTLUcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=L0PV0ZQm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="L0PV0ZQm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483487335c2so123702605e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468977; x=1778073777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJisnvoilHvM1tcsiW91zKp6fAV95Xpg1TUbZ8titHM=;
        b=L0PV0ZQmjDljlaZ0Y80UBJirQFCW53fWnytXltxVz+OPhbBx4qMB2Mh7c+sPSZJy1o
         7megrm3TZewuN3CIkv4xEsd610NPkagrkE2hnlv5IEjYPnnmwor2jub8eYcnqYY5uGNt
         NLG33+1AGNK8DkcYwJBi92VfaA5F1zbh21XcJeYWM5j06nnmmecNLjIalDyDAKX5r0z7
         RBg3kRDO0lY+COl/x2KsKBgtdau/qwuFwg+SJ0JtRpT3AEENavBgOqBrPKbicBXIUQ01
         g0aYmk1ZtiHFunoeDctU5d82cM7vXttdggSbvGGaUK0YhufuOt4kUDONCjfCCXaZUOhK
         TJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468977; x=1778073777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJisnvoilHvM1tcsiW91zKp6fAV95Xpg1TUbZ8titHM=;
        b=Hzebi9tE82salPv7idB44myDEfQFLQhOFihpzJ/C5KBvYRbKxcX/BP54/pBSoxk5lO
         S3gwgMmfdVCmyiI1n2cUPBYQMwDk7RLDwK7TgvBjkvCuCclYIeD9OmfP3h/8B+v/H2Vh
         4Yw59jnj0pqjJuG/j0D38TLLdBbpHwTiWqH3QWyCq4NiQjwV3p9yGTjsi2kcg+brQ9xM
         NmpYMS2KkXY812gnQzLvClItKzX6E3dv15eoQO68nSrEHw26zQD1EXSdD8MdczHMnJEW
         RgWfSWCZlZPCLbIDc/Sq+oS9oJgedh+QKozIMiZhs2ja6wM5vFmY13j4E4eCVt7bb7ZI
         qIXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nlRuWnC/lAnLPsYsP4fVB6U1t+zKHVxUIbfCHOAm0iNgw5mOO9Iu5LKAfZ9W5BIiRiqkO020ss9MyJr/E4wKG@vger.kernel.org
X-Gm-Message-State: AOJu0YyE93Ods4wCVX+gCRCUWiM80IQYZBSu6RWatzze8jxJKuP2WQnx
	reVE4zEvUBCf0al91Jxhf5otN4gQvO1E9YMgxwFgvw8SOHdZn9fjcoWhsyvG3KcIq3coVncqgIU
	ODoe1
X-Gm-Gg: AeBDieuocOeJBR7B5hJy6Oa2ViZ3af1qkFrw3ZJ7+OI+ixrQaMAyPY935mbrBHNjGqr
	0/GOkBENis15yDSec5vAH5FsCB1xa12bzuBRME0VnasgcyRe7xeGbuDImBhaCxj9LDv9EpnWq4V
	6IO1NaHdOVkSCHaa9yPeZZwqFydkumLw1QlDwzzm40QwAQi9oltSkd8vQKUEbbERqhmCUWuMRne
	HiODUu2ICAkUGqEJkqkx01ww8Sc0gJ/mn7vjIjZ2B2SnzpGanuSw34cIG4uMmXPBFbcyxiiaKHu
	3QDUy+ZfSwT6coMTDshT+tyWqrF7lBnu73bXIGfHG5/uZ3jLq4YTOiaMFub1pktyOSCGxaK7z4s
	lZSA4doG7qbyCQz81n7EBSNhF1j0DK8jZ29iWNsr5TEakuQcfFgHUt7sMrL9CujUV03gTPsHNYS
	rzF5FQMG5z1izvhmcROeDcf41Zh8FJnWXxdf+hrfBsxQ==
X-Received: by 2002:a05:600c:3541:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48a77b1bb4cmr126176615e9.21.1777468976657;
        Wed, 29 Apr 2026 06:22:56 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d4843bsm5752703f8f.7.2026.04.29.06.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 29 Apr 2026 15:22:11 +0200
Subject: [PATCH v4 4/4] arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to
 pre-ram bootphase
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-4-fc27d6ac753c@baylibre.com>
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
In-Reply-To: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=VsaP4LCm9vj+GPBKWc9GbqkMJjZILMOds/rJOobS64k=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbIo2lfKnvyd5e3KfnbSlfZnmWTaubknzS18bTirrP
 G3daDS7o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbCs5/hr+C8JRf/f9h62W/S
 5pfTLq3Xdxbrk7F3a97vFxwtUWr1SYrhv+8pgftnGGb9OrxftfTKlucSV5xcjrV61ucsFq/0rHQ
 4xQkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index e67489a178f2a2caedf1306e1c1c9dd6a95745e6..b4a4e427637bb4d5ca408d29234b95fe7e69d006 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -71,6 +71,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -879,4 +880,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0


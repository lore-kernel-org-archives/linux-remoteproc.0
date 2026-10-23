Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737628;
	b=MiRaGSvi0X15baYUWkWsc163vedOa+RNJi+xz4wk85RDTPfRZ4hVCK0BBKzJNTuMpaj+
	 FGlfBpOSuWcw2uKfdVH/TIlw3MnKL7roPH9KJ6L3rsVo2342LBExOe45PbaYNQ7ewBEY7
	 ujWB2YBzneyyMpHpbhc05vIjNJkbmyILqrGGt+UwibiaqlgzaXbNHccJzQItZfUBlwXEz
	 ZSW08fYL6mLThfx//BBoETaacyG4m/knPOI3epbqvc2uzdk01TvxAjo/ieAwLMPy6qLB0
	 uoxBLnb9WbUa+lI6Qq36cjdO2pc5jXAqzPJTgdweLrCGY0hF+7Z6jEUAhWRbt6Z9wQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
	b=JCI+AtlKSqNhOh6u7DE20YBv5kkCfmC1yP3W/Rlc3CPewGnsmbTc7tFNM8cuj4sKptGh
	 PQUcDKVV53s2ElzmGagnrh+ghIa6ntM4VH29T4jc2c+9UyA7h+dBcJD3lULIIYTkki588
	 EsS77oIgjt+Mh4c4/KGugkguKYrHQ7+M0j3JgNzdjdYc/JXpwqBV3NGDt6p/DaqhY3P0U
	 PF0IcdReTHFSIntf5haRUUJRlEwcbp+6onJxscwcN7OpbMZRvuAjCnEOH+vlN7j3nMHpU
	 mmWN+UaE3WjmqxU37XainpSKq42NHg86j8RruCPORH9V6xulL3d9EnxkkZW+S4h0ZMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095A760A2625
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 06:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095A760A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso5448885e9.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737626; x=1793342426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=D8JttAdUXWMA+C1tKErktnwsZZCy3HIUbjnaGh5X7r4L44Zk6RhL8BtNIhqkRk/36D
         IhFbmfHjF5EfcEOihgCUgXSY2+8D8PaXFo+uQ02UUPUUAw2gwAFF19tS0ABrtWDgGPoI
         HeV1vZ9M/nK1FKD6a9Az0iXO04LSuORvWofVstmgcVohmcwvPiihakPXSW2lCaaAmIrM
         44okde0ifL/bu5PZilTkScI6CcMm/uxQrgXHl4ejdowMVXSXesaaRI4KV1JkxQwpFHSe
         lbUVCuoQoCWi6cHLQQoVeoYI7ZAz+2azP2ToWhFHPNSGGzAZ6OxQW0g+zx6nEOJIwLvb
         eWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737626; x=1793342426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=FuCLnGoCV5rQaVhs/7jo0WSxhMy6uyjw6/v65uUAzXhUo0fXCEUg5HTdDYeiqx0weC
         8VlRKeM10+Nh+XpmgaovgUdo4Z3HObDHfTpoQIFiFi31JjAeo6BkkeZhlLgEImhVHsst
         JRUVbX1LdnGJK1MOv9Suq794J2EyTWR6iIu92o4sCOQrtmBmvmD+jKnboYvByJeaAkP4
         Fs92Ciz64fzv4epeQLoFEkZLcVfkYBUG9FRdv8hNZQGvoxxZuiDdoEAeFhKAmSF1pIQf
         891xVsPpiX9Fal8ZlYMBy++iB7p5spsFmYkJCh4HrZEE/nznJgme5IfTfunvul3T07By
         qqfg==
X-Forwarded-Encrypted: i=1; AKwUvBzkP37yB2HKUAoao0zCD7zx//QuEhozU7Q5LOKZGXW5BKFruDQ/KTO28qiFE11KURXC8R1LafiZ35XeMLhcqRUw@vger.kernel.org
X-Gm-Message-State: AFq9FYIuwSokgy5m05U34Kd8/kSQecs1DuSIg1jgEYCfNBngE3s6/6Za
	NT5oiISu09FApHFY0Xl/pc9lxa4qKHyQf8bnh9q7nuoUUxcBMDEud27P
X-Gm-Gg: AYBFou37hwZqutbQQJOTZVMO72hqVLcqH9WPQdKk7JUuJ4X+KvuJ9gRLdLISXMPJeU0
	vtdjBYqB+kkkRlGMwMJa44iIDnFQZj4Ce50EDH+NKztKieblTAmEXnOPKCVaV+rChHGrZuUqbfa
	ipFdZyuB8h4EL/fxkNe9obrm6W0MGTv1awECnBxnutH14O0OUeRPMZzAdU4uuAn4cm23wR/q+RX
	FBIuahNueNqspttpyP8BleJgg/h695/J6mMHZnOKKTM9cwujZGDbTi/oJBM73HyKtsqad2WfxQo
	HeyFni4tpUSGIabKV8gUgVLNbzeN8yBdFWOzbPEjeSQvuH12RW7A0BQMlTygcDRQx1mIshcYY+3
	qbZTa+EEQcg7ndbrMROM8RqG4kmpOKBJnN78kupZmgpjgp9Bn1Fsx8aDTtRSC0N9wFzch7g5Yvc
	rISoWPcgWCgUH2vwBw3FxvQQ2Nl4vKwzcBbC3x3ehw1Yvht0Um7SrltEyROkIlYHNc5UAAWG+xQ
	fQbvvCqk0wDg/yZ83q/LEGemeAc3dfSChmDrvZEXbQm9TI25qi7gHD0lYXrD6samm171QOIy/iO
	MTubasUtXucayV0F77Hyf6Xvdm+VmiG0rlHGzGaLcjhikX6MAF/4pEtmMn0PJ81ZkbuaUmV9Vht
	SB6A=
X-Received: by 2002:a05:600c:3486:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a211eec13amr18677595e9.23.1792737626234;
        Thu, 22 Oct 2026 23:40:26 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:41 +0200
Subject: [PATCH v3 16/16] arm64: dts: ti: k3-j722s: Reference the power
 domains of the C7x timers
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-16-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

Make sure that the timers are powered up so the firmware can use them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 611220ff2655..7639081dc913 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -166,6 +166,14 @@ &c7x_0 {
 		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
+	/*
+	 * Both timers on each core: core 0's firmware drives TIMER1 and core
+	 * 1's TIMER2; two entries also keep the platform bus from attaching the
+	 * domain to the K3 driver's device.
+	 */
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };
 
@@ -174,5 +182,8 @@ &c7x_1 {
 		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };

-- 
2.54.0


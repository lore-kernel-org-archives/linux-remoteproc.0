Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E8C3815DF
	for <linux-remoteproc@vger.kernel.org>; Sun, 27 Sep 2026 02:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477797; cv=none; b=gBw+XhbybO5IM7XOEXxkkq/rZvCVL2/nQxjIVhiHZfEmNLtZTQN1GM2yqu16maFuw+pSvptKPfrkFw8JhJGP4X/eF9UM5wWDrDxRAgYiRgkb/iGe6I+EV/3jh+5wFoKao52z06a5EdGMwOa9+Fz/QsbKiyoCuQm5nT7Y0AQrBrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477797; c=relaxed/simple;
	bh=WWWs1AxLgRH1Afm9m8LBfiZ1mk0BAN8ZoTfuY3HGQk0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DAwAhQDlWAjbyRiv2nNl3VM/5NYEjBVmT8bhhthUaVaL16OqOXZZHY/N455SYPWhhJczCKqqpG4wEcFJ8tf7XRlD0u6Y3SrJzjAOap8NV2drfnTA1Gn9A23vbOTeLJ7rAaPOspqqMQe6rOdz9022aeJrLVGjZ6oEgSB2NUPGo20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=dfHfZSYN; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="dfHfZSYN"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2df9d58a04aso7861225ad.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Sep 2026 19:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477795; x=1791082595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sq4JmY1w64EpSdodr1NUAFBWGL7Pv3Z9QQBcNpt6X+0=;
        b=dfHfZSYNAOIptNBEP4GTnmjvxMQRV1dQ8r1d4r/0HSwZoYMEaArYnDEyeTpKadbgKF
         OG998PmxlQpkjE3fnNTiE+MVw6jIdTOMnm2Bfpq1+joN59zfWLvaRI/gt7n7bSzb4w8Z
         a7LTsEPFJpe/r66xzLyKY3uoBiK0YQDGK3g2XoLNEhn+1BgaAiOQdZlA7qFT8QlwJCI5
         kRK0M86NUGLOtyyY/r/jJs+Xpw9ZnL7aiHI52ejlgXCxdmFxa9P8PA+Gbl/PtheQVa14
         yaK0U1tsEc9RSKBOjePjP3JMxkBRJfAhCgckZFC0DZNhSUVrNTfsuTlYXSYkIjcr5ief
         UYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477795; x=1791082595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq4JmY1w64EpSdodr1NUAFBWGL7Pv3Z9QQBcNpt6X+0=;
        b=FOyU7bVem25Iwkk6UoGBg9iF7jLe7Sol+JDEfCSIs43tyO1pHPQAiZbHBhyLxMN/kX
         9n4ouoxdau7RqDHR9gVfMf0O28PjVxOlyqwYAGdJsMlJ/qoko4TEOYzg2975FkWae1Le
         9T/z5d/kEpHM1lGbVelkSuXw2ddiCGz+YTL5Fo1edWNfJ0XPVMMBa0Yd/u8ta2tEenJ7
         uxmDPn8AyiMt7ma7SBQ0WwfOvCYihmF8jnvznUNuwtGqsygRMRovhL1Lu07Ojp2hCX1Z
         K64DzfMq+l56/U+0cBy7y2FPVjp4kjagiyQh2BZzmrETgfJI92picsWXbKyr1FnJh2qu
         RIqw==
X-Forwarded-Encrypted: i=1; AKwUvBwNI7wyZPImpsmdbNT3v3zOfdZSw5YwMerTkr+DPJwlnU7cXgEdh9B5uNVB7yjnJj3bX2HgIbRMwuBGcrXHGN/N@vger.kernel.org
X-Gm-Message-State: AFq9FYL1xPtPOH8aqKgsSr1yRTzT3OVr0M1mCL5roEp0gwxt+T38DLvk
	O3bmtYoeBB+f7i492SIhLmOilXOz/rnFmoaOX3YJ32elAAVgRdOGmVYTmDPSh9mSnr78
X-Gm-Gg: AYBFou11ccHmYdYlfE2K8JnNc4uNQ7IVFb4mX6WrfJFJx+lOmLmZAjB5ul3o8VhkT7u
	B566pKVJVg8/q/zHhkhiA82gHcuR2KYQyPrtycsWAHqSEp7YZNYWVzOkA7cGHJAg0y7GIw9aLPz
	IdFzwKA9JTIoTseA74etp4BUpA9JsvideDHGX96c/SIpix4bmQxegv01+nwh5Bwa1Kh9qDYHGjk
	6KnI1N8RdcWYZHn1tP8+JIN+RoBzok6XqalPqyLiCPzkWwnDdrlBYaLMajhm/3AnOolX+w97/7v
	6hKsbiL26vzFshDQX8NdM5bADKgfCjwXp46TuuOKa9yz+NoluUnTKbFloApyRk31PJSEB8cHpNv
	mXtVXv9R/cqgRfA6Kl0ZyDMuPt1JG1Jdqtw7Kju1S+aTwJSirj+3lOI3zbUZFtpEZYh80l7TnVC
	WvoxGDg2cHMKltxlZj9ZnP0g3rhR66oN4fYeaweG/8NP3BcFgg7568nqwmG92Lmr7CnA==
X-Received: by 2002:a17:902:f650:b0:2df:8f81:e595 with SMTP id d9443c01a7336-2df9490a525mr51727995ad.6.1790477795247;
        Sat, 26 Sep 2026 19:56:35 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:34 -0700 (PDT)
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
Subject: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Sun, 27 Sep 2026 09:56:23 +0700
Message-Id: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the hardware spinlock of the D1 and T113.

The sun6i driver already handles this block, but it looks up its clock
and reset by name, which the binding doesn't allow, so a node written
to the binding never probes. Patch 1 fixes the driver, as suggested
when this came up for the A64 [1]. Patch 3 needs it for the device to
probe.

Wilken asked then for testing with Crust running [2], as Crust owns
part of this block on the SoCs it supports. That doesn't apply here:
Crust doesn't run on the D1 or T113, no devicetree in mainline has this
node for any other SoC, and patch 1 changes only how the clock and
reset are found, not when the driver enables or asserts them.

I tested it on a MangoPi MQ-Dual (T113-S3), not only between the two
Cortex-A7 cores but also against FreeRTOS on the HiFi4 DSP, the other
side this block is there for:
 - the driver finds 32 locks;
 - for each lock, while Linux or the DSP held it, the other side was
   refused, and got it once it was freed;
 - both A7 cores and the DSP each added 1 to a shared counter a million
   times under one lock, and the total was exact in every run. Without
   the lock, over a third of the updates were lost.
I have no D1 board to test on.

[1] https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org
[2] https://lore.kernel.org/20230216095454.54f4d5ca@posteo.net

Nguyen Minh Tien (3):
  hwspinlock: sun6i: Get the clock and the reset without names
  dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
  riscv: dts: allwinner: d1-t113: Add the hardware spinlock

 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml  | 7 ++++++-
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi         | 9 +++++++++
 drivers/hwspinlock/sun6i_hwspinlock.c                    | 4 ++--
 3 files changed, 17 insertions(+), 3 deletions(-)


base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.34.1


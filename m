Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA23B634E
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773367; cv=none; b=M1euxCQ/b7VaTk+vx/yv6vPxiQ1ibE2sM0roJOZTTcdjQey78eOJKD+Fyxxb3cSmDZkq6DF7w/ljvMz6Zj2TbflX++1zyldhv/wHEnYtrhmv8S1y5LHOLR/LtSD8ETAN3B5B3QbmlHThKjyotayF+Y68v42JN45wZs9HHwGoi6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773367; c=relaxed/simple;
	bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=unIrBJmK9pFboLpTnAu73M1VI0PaZGKJGIuD5bWjbGdWJtafQCkGEaFS5u1qMP1Mh+GPIOFlFVu7p8ErRl/qhWpCmpEcbVxpCa3pfqsd1ozrO57NCtRNBSfuyF+lEXi2uYr0wrOg+B+7dI7/iO6SG0IfAoJ6DAT9dN2lA7guRJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=FFjCu1pS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="FFjCu1pS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1398991a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790773357; x=1791378157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=FFjCu1pS5KghVbeqHLhwRGNL80kvHmLAsLE8uL0wfFNMxIt7b2CpoAXhMpAn7nmIqG
         Adnr0tsm8JsHaHcJXTOz3o5J55xZ7DsVCLsbWqgndDkxx+d8Xl0xltlWSkwrZQaFe2vM
         zcArLaNq0KaXkK3LMn8HlIhdJJ+CETLHsBafcFqd0a09xjNkU1cnnvXsPHN7bD++uwL6
         GvfrtsP+LRLsaaRve9dVFS5iOt1uL/h9spYBFTxSZhJK7G6FRHjkHXqTznDkm4D1HLMx
         krpJo+pcyffFOmm68m6RVk15EV7b8t4J41wSjUWM/TTQjBesVtsIJcDlc/K4ebd6EUzi
         B75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773357; x=1791378157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=Ns9YI8zW3rLuaiHf5P5gSzzgNihpJm5cMAsZJKsGQOoh2q+THmXxT2rAcvtgawJLuO
         7IYArsdZ0B6DD6IkEJdFQMMNrAt3AmTeSdUorgwd00/oLx86d1qWKRaBLtx68Gain5Ui
         fURF3jP1IJ4WyBlm6P/+4ljLUcRuCutIwNDByyOf8NLSGcICto+utnSBiZVQqgzK36h+
         OhCdqgrLJVIgOJPebdYA+MvV7eGycW5pOyTksx8xAHL1aTUxuQjGxouua4Q9bdWtBbPX
         sidkCxYKbcCaakgdhBu0iqwDW8aPQ6RZJcs2sy9J3gHC66VCJfsOB5jPsIwBAIs8kbM/
         BLdg==
X-Forwarded-Encrypted: i=1; AKwUvBxfexfO/6frPqPQXJknDLQN1bccCUb8SIPFZ3rDAxhDs0S80T9EHEswShNcfU/iaLOSGSPhTJkwCTyq0TXgfV9h@vger.kernel.org
X-Gm-Message-State: AFq9FYIcmI8zjJe2n1wO8x5txBIKWmxZG41kCZbNWmuLNaJ+PWn/pC4R
	BBfacj4pUiaRNvFA4stVF/mJVqhvF5hDR4/pB+WMzilsYHaLN7/TkUyIQu0NIlgNDnoX
X-Gm-Gg: AYBFou1AyeAuwwN8qzpezL3UthNhE7nBEUdIkUSLOgMGdLagjZzfpP2bzcfbm7zf/c1
	LUCDeHMLqbzaQjMjd6TU82vrIZHXv67NQANtPVadUKklOLKbdeIl27t4sHbmgUq+6ogfMbw3DbX
	gD7dox8M2WteUajvrAuxLzj5qjyTpu/4nS2zBnsTdFFkiwMpuTBe8P3/P/SuXJCa57cfAM7lZ5e
	yvWjXcc9/20yeMimKmXfJPCtlbMy/3Ha7chEraUDcw1oXitOTODjJai+DnCUbGV4vv3szIN3bUW
	GPta+GwtI0zb3Cb9ppD1vQaQakHHLFogRUBYT4xpGCROC0UmB/h3Da/m/AbqtKJaVoJOswmh2aj
	C+kxHvybKm0r5MZaNJmpQe6C//vyeK68Hq5Xu02kLAbQXx4YisIL3tX+ssFrPhdnm+VzF1I7RYr
	gettUndrFFzPYg4IkUondE/piW7b2Ic5WvS6xoT8Q3XNJ4txgnyfjtFD2ZkiQztRDk/qz3ih90m
	LXWUEp/
X-Received: by 2002:a17:90b:5343:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a4d18e3b8dmr775583a91.54.1790773356655;
        Wed, 30 Sep 2026 06:02:36 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab424e8sm853583a12.32.2026.09.30.06.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:34 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Wed, 30 Sep 2026 20:02:21 +0700
Message-Id: <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927132707.5f484946@posteo.net>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog> <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog> <20260927132707.5f484946@posteo.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Wilken,

> Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
> the driver in the sun6i_hwspinlock_ids struct, drop
> "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
> file accordingly?

Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
more at the naming. I'd like to keep the A31 fallback: it's the usual
pattern, other blocks in this dtsi do the same (timer, I2S, LED
controller), and Conor already acked the binding in 2/3. If Bjorn
prefers a driver entry instead, I'm fine to change it.

> Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.

That would be great. You don't need FreeRTOS for it: I tested with a
small Linux module that takes each lock and checks the status
register. I can clean it up for the single-core D1 and send it.

Thanks,
Tien

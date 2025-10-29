Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69C631AF25
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761729303; cv=none; b=oAwOBTaPYT7iFVANBlvn5dp0v4sP7U3V5KjHs7ogjtVb5hMV+ktmj/xxOaYTZnRLhgDKn6oHPxBA07vdXUIbiZNVAXMAl8pgkHxdEE7utujSPf/4S4wvokm5wks3/4CO3R7Gm6m62LLi1mpOffsXPqAcbbp19e5/8TxQMHz/0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761729303; c=relaxed/simple;
	bh=aKg/dTYkKJuSKY4S6pQwZeiHexpMmm8CZZ4NB6VQNM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6UK5emKYr746whpXboY7ydsrQ+JdApqWTwijKSWXcKi4Z3nOFf/anjMEnAFN7wxQ/F64mATrCoCmA915O1TPs2WNKw13y2K9qldB1bHL5toiWGYXMN8LBa/h+XC4KoG24r8To+O2GHAnoZbFPVFJJo7ZGr9i4alGpMzufIDd/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RPdF8Xqf; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RPdF8Xqf"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-592fb5d644bso7036619e87.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761729300; x=1762334100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5TG0ueaKuFAyQO0OV9etRSInulzLHrCU1Q3MeGK1uY=;
        b=RPdF8Xqf1Mj99taZigzOxjfOZl+JG2zfkjEEqQU8Q2NHT4LV0XAUrnvJGotDvJVmRs
         mGdT3gn7qUYFlRl7FgE1zjzTjYAzHiMx1kO8hzM4oAhfLJWK8jhbzX2JK046ujcFjvBX
         G4QbO6ynWg/MLDLUS3iIq/k9ql3z+2GCN0nGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761729300; x=1762334100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5TG0ueaKuFAyQO0OV9etRSInulzLHrCU1Q3MeGK1uY=;
        b=Xlg8hOZCo6YG1iw4pAHRVLHgbhRP81ElJIwp4fzKG1fbamP7U0QzV6A3ZlyrUPtO4M
         6miHq3n4HM+T19Sr5pm9J8qD+OEI1n6oAuIy4m0wfZKCZ4fyJgnvZrPLBGqYyJY9lb7b
         X+xR0iO7dPI1xbPU+D46+AlxHW60hBmmKVCvxI5wcTKiEBx+DK4lSEn2KvlnAqC8ULc4
         HgN+QEBqbUZke2LskPXgVG+rLbwmVn1Y9LmhZRqOMfoWWpH/KyN7vCPXQMbU/b/sxm0e
         pbhj0H8lF1L9RUZjSrsx1BxrI6tCI6dAxBU0UEZ2jJ3OPFPWiuZ8/WOe/ofi/+4JNTd4
         4FHg==
X-Gm-Message-State: AOJu0YwYKq5mEV2L0wyjebtd25ZTbzNJHLZHpNlwcR/vRPflD4JBfd2M
	jF4CZuEFW+Na9GkwWyXWW5ZwlHgCkFt1Nnrx35LTE6v4Z6Jp/E295i+ICPPATJ9oN5XCnqBuVv4
	EXL98LXaUvTlO6UxjdjSl05NXftMHbDkjhqbEnVCF
X-Gm-Gg: ASbGnctFon80d7uIgLh9jrp3pkoXhiPeC+QzI2hRImMMfB8b0aGQB1Wu4olt6k1hdt2
	HhtrDawSxptDvNRniqq1rVk68r18jD0ahR6HZZv/0HV8SvhxbPtSWoU5eTmc+id0PGcNA4CsMgN
	u0yKOvDZboUsf7kUbvd4qOHrcBVpGt/pD0ngGml2ZWy79YslvO1N63vGj17ux9WOZJoIDp3oXcq
	rsCqZuAZcHxNh/hdzMHurtmR42DCEATMXeOAingzwFB6hGTioArZ6slPHR/jjNy+Wqudg0oJZJO
	gczAY+nL19Klkg==
X-Google-Smtp-Source: AGHT+IEdzCz5CagXh2U1asZRsfKQhXvsI7kXu6etELWvVx9B3yH4c3fTQRn6qbqQRMN7bG9dn46906V22dlPmaM6Xt8=
X-Received: by 2002:a05:6512:1150:b0:592:f2fc:51f0 with SMTP id
 2adb3069b0e04-594128b54famr828019e87.30.1761729299812; Wed, 29 Oct 2025
 02:14:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Oct 2025 17:14:48 +0800
X-Gm-Features: AWmQ_bkTadC0tGmcwZKXgN_YyBG7Nl3lIGZgDu08N9ula1vkSppNL4aPMzmz71k
Message-ID: <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, arnd@arndb.de, andersson@kernel.org, 
	matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> After a reply on the mailing lists [1] it emerged that the DT
> property "firmware-name" should not be relied on because of
> possible issues with firmware versions.
> For MediaTek SCP, there has never been any firmware version vs
> driver version desync issue but, regardless, the firmwares are
> always using the same name and they're always located in a path
> with a specific pattern.
>
> Instead of unconditionally always relying on the firmware-name
> devicetree property to get a path to the SCP FW file, drivers
> should construct a name based on what firmware it knows and
> what hardware it is running on.
>
> In order to do that, add a `scp_get_default_fw_path()` function
> that constructs the path and filename based on two of the infos
> that the driver can get:
>  1. The compatible string with the highest priority (so, the
>     first one at index 0); and
>  2. The type of SCP HW - single-core or multi-core.
>
> This means that the default firmware path is generated as:
>  - Single core SCP: mediatek/(soc_model)/scp.img
>    for example:     mediatek/mt8183/scp.img;
>
>  - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>    for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>                     mediatek/mt8188/scp_c1.img for Core 1.

I know this patch has been applied, but this scheme doesn't actually
follow what is already in the linux-firmware repository.

For all the supported platforms, the first core, even for multi core SCP,
already have their firmware uploaded as just "scp.img". Multicore SCP
is seen in MT8195 and MT8188.

I guess I can send a followup patch?


ChenYu

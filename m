Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D63E25CC4D
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Oct 2025 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761812511; cv=none; b=kKSXJOu7vdmVxSzv6JPruIBLy6zbz3tT9zuKIFwxqElXrh6jcqhx1b8qiT5L2jbE5+h4tEkw9r89B0xeALNzAA8hjdl3WQiCZ92Br/2wOB8uyeNEk1aWFWXkQ3hWbZcij6evmVa6Bm3Zy388x7Vd+oCqWJOnUGKGNeiqyAZ+y8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761812511; c=relaxed/simple;
	bh=aP9gHKvvsd3H8WS+/h9myuYFkwe72MjPQfocSC/zCe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLM6NvJfzD/azi4qtbzKEZt54ITZgasJfra7va//Mm5TOrKR7HIb7nD3S8w3lKJUIqw0B98a/ILJ9PWR/PkY7zoHA281U/z91/cNUjJz3rA+S+zd6rBsyuEl4R/h4o5IQMbBbwUDtJxXAlZe77gQwJ9/M0J0H3kG8cAmfawfAds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JPYBX++E; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JPYBX++E"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-592f3630b69so906924e87.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Oct 2025 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761812508; x=1762417308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RRQ3mnvpw4ptRfYD4hKfaf3ngNiZ/ZLRKANhoAh4Ck=;
        b=JPYBX++ECkIxjuSrUWSo58Ov3fPsSVpfQWzxTlw/gIo26r8hMaKM3Gi+coQMGoOnf+
         /IHArEYmiuJK/1hIzUxK1CmcffCEfJcLfy5pq7YcPvTNHd0iwoPC58lxhKpGWMXLdjHN
         x+q9rfEzF6HgaIVxm6qhhB9edQjJfTxGmPYM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761812508; x=1762417308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RRQ3mnvpw4ptRfYD4hKfaf3ngNiZ/ZLRKANhoAh4Ck=;
        b=Bg9+HmZmxcwARDOhnw3c1ZZGd8iMhLzGHWS7DmhaFuA1gktT/1eUE2BLTor3HMougK
         RzNZLnNWBPE9NP+6V9aNuRzpg38FaMs1WbGn4aP2XDUw2ZboFSdU6Vj+ca4iVLlPznQd
         OaNnEJdYsPAUyDkmbLR1riqxfR+AkdLbHWZwcHMP1PGqavUm06AhTCFl60UX6SZ8/E1U
         G8dx2aK89d5ePAxQ7fAI/UJqKDEay7g9sbHL8WNM+OnFexQGxvv1gVhZJa6xpGNSQ+HD
         iY/Jlxtnawp448aa1z2Gkb7pbRRY5cGUfJddeN5ibFeysvkG939ja+7QeFNhwe3U4IPI
         /ggw==
X-Forwarded-Encrypted: i=1; AJvYcCUW666wU5ZkJTFTFqFnfl4jiLJD3ZaestcQpsMgUlh3p/d3wKrEChV5plXTxWAvUAPTPV8slyOy3x8+/3crUab5@vger.kernel.org
X-Gm-Message-State: AOJu0YxdT2XoeR+YEXEUpZfOuWY58v6FdDFMeqNQ5k5/pliyAOgp7tob
	uRf3FSSnm3+kjKq7jZ/US0H16m32yJqJ9DpeRTpWFu3czn4oq+dxvVw4npoFklrxd2ztHcaHh92
	7n8UqsOcV5VnRw47dOEgQmz39P3v5c2K/8aR5Nh7c
X-Gm-Gg: ASbGncs/pnU7MTAJjYH/TFzKh4p10zM/dU8qzItHrWQ5L7PhQWOW9b/BgRcl5jJiehj
	jd+5X1BsZKUY8GZJx1W6bGXujyrFI1aM3HOIsqaqcnzfozPtTHc3IEYw4uED4IUVzwnL86T7/Wh
	SDPrnre1fAiqsLKSNEt5cVNRHb7PAGop428GW87kFMuagr20yCjT6dYSYQrz4aBAlY7CffxmCi3
	66DxsDFymC8f9a/1DLp4McROBEAwZGcTLNiHpIR0Mg+vmMdBlILWrFQp2DrLcoM0HO9XorqoPD6
	UXIgDJwCOVLAz4k=
X-Google-Smtp-Source: AGHT+IFU82eFD7KyMUajMtRnh3g0OAFBir+9otZR0HYwHlQYMDmXZxQQJ8cv/9zylVMsVzxv/6PO4ARJDSX3YbcKhTo=
X-Received: by 2002:a05:6512:ad6:b0:592:fe0f:d9e with SMTP id
 2adb3069b0e04-594128655a1mr1896419e87.7.1761812507765; Thu, 30 Oct 2025
 01:21:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com> <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
In-Reply-To: <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Oct 2025 16:21:35 +0800
X-Gm-Features: AWmQ_bmkpHdrIvgnJ7LYrPcYtpiVGscoJE_DrNSX0WTZVJCZr-WNnyLSiVAsWFM
Message-ID: <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	arnd@arndb.de, andersson@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/10/25 10:14, Chen-Yu Tsai ha scritto:
> > On Wed, Oct 15, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> After a reply on the mailing lists [1] it emerged that the DT
> >> property "firmware-name" should not be relied on because of
> >> possible issues with firmware versions.
> >> For MediaTek SCP, there has never been any firmware version vs
> >> driver version desync issue but, regardless, the firmwares are
> >> always using the same name and they're always located in a path
> >> with a specific pattern.
> >>
> >> Instead of unconditionally always relying on the firmware-name
> >> devicetree property to get a path to the SCP FW file, drivers
> >> should construct a name based on what firmware it knows and
> >> what hardware it is running on.
> >>
> >> In order to do that, add a `scp_get_default_fw_path()` function
> >> that constructs the path and filename based on two of the infos
> >> that the driver can get:
> >>   1. The compatible string with the highest priority (so, the
> >>      first one at index 0); and
> >>   2. The type of SCP HW - single-core or multi-core.
> >>
> >> This means that the default firmware path is generated as:
> >>   - Single core SCP: mediatek/(soc_model)/scp.img
> >>     for example:     mediatek/mt8183/scp.img;
> >>
> >>   - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
> >>     for example:     mediatek/mt8188/scp_c0.img for Core 0, and
> >>                      mediatek/mt8188/scp_c1.img for Core 1.
> >
> > I know this patch has been applied, but this scheme doesn't actually
> > follow what is already in the linux-firmware repository.
> >
> > For all the supported platforms, the first core, even for multi core SC=
P,
> > already have their firmware uploaded as just "scp.img". Multicore SCP
> > is seen in MT8195 and MT8188.
>
> The only one that is affected is MT8188, which needs a rename or a symlin=
k in
> linux-firmware.
>
> MT8195 is not affected by this change, because the SCP is used as single-=
core,
> hence this code will look for scp.img and not for scp_c0.img.
>
> >
> > I guess I can send a followup patch?
>
> The only followup patch that I deem to be necessary is one adding a symli=
nk
> or renaming for MT8188's SCP and nothing else.

The firmware was uploaded in March of 2025, and is packaged in Debian
Trixie, and was also backported to Bookworm. Either adding a symlink or
renaming it won't trickle down to users for some time. So this seems
like a possible ABI break, where the ABI is the file name.

Or maybe you don't consider it as such because SCP hasn't been enabled
in the kernel in any release yet?

> Please remember that some of those SoCs (including MT8195) allow the SCP =
to be
> configured as *either* single-core *or* dual-core - and usually firmwares=
 for
> single-core configurations are not compatible with dual-core ones, becaus=
e of
> the SRAM carveout/usage.

For MT8188, whether the current blob is dual core compatible needs to be
checked. The blob upstreamed to linux-firmware was built locally by
MediaTek engineers and is not what we ship with ChromeOS devices.


ChenYu

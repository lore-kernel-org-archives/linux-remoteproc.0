Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE4B19D8AC
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Feb 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770912307; cv=pass; b=co90WvYX8YgXL2E4ZNpKVZ8DjfP6TFxsCNhr2NS6ENnmGpHWXQLWsRs5q5gq+MossKZCJ8G67zbbHX+WfiY0dOxYv22V9HmP8d1icmOZ4UkeR3QIoA1bKvsNAif7p28Ozix7XVydzuMomYRueWbrzWz0pO+ArQqiyBPPofE0uV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770912307; c=relaxed/simple;
	bh=Rxrf2zqf7OrbEp2oDkK8yG4cEqdd/BDsPAESB4NyuSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yi8RR1kTpmWjLlSxsbsXMkXmRT4FvrEkYGPTRFULLPibgrG0xJrYVJZ1QlcYsKhy3KoGPynezmaYX9CxwSgq1E/F/kFxAiOyBaQfVTle32dhiwpvKjNbGvuLF7uujANon51/nzzrzGgXNrEpkizE5ml8DWeGa+ndloBeMP250Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZQfzpzI; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZQfzpzI"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65940221f7eso13912856a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Feb 2026 08:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770912304; cv=none;
        d=google.com; s=arc-20240605;
        b=OWmIc7nAB5DzmQd16ZPUKOYo/gI+yAlQMeCsQ9JJTMJl1Qxed5neknmPdNy9o8troW
         I9UhFfeazkaDmfY6eiBsmr80elfESRRIWXofS4+dnG+lywdGN6+eUg73tBd9/FAuRgBo
         iWQj80//yTfgZwMRYOKPi7ycrv15yFVDG8mPkS3IanHQfs0G5VHXe5csKwY4Q229ePyz
         iIJHRmBMxaVyhgdRNYUbi/cJ4DfCmYtMIxWgpJuGf/y/WyNf+e1NYnqJy8/7vELKvWdj
         ozfT2fGOJ4zBXdW3L7GySnsu/JYX6PJgpxEdfVhKbx4VOgxsAeEv5x7A+wZ0lB0iQhf1
         rdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=;
        fh=LTwrnDwCpR9ZxWxkR0RknqJRsosuEyqTVGq0oPM5wso=;
        b=HBUZtXAsvNIqEZRjLlyhsNEOeCi6RXjk1Fc0ey5MV2WTfkoGCLSrif3LhOJwO2DyPY
         GxWspi+JYUgcS1uqZUXKai1CyNTEkZi/yBzIqq+K/A4BHrbQncKCTHwxKODv/V/XSqZI
         Ut7RhQT8FipBYxSG+C3bzV+9Y2xrh2uFNvJaeS/E1KpsuCqrj04wgAE/lRNIUzIlEBt9
         v9iRDg7lloKunjTQXeoZhWlVw6pFX6sp+AGzQFsQ9QaXLBNZ8HLdcG2QkDknrniHtFmX
         9H7BUgd1O4eqcqa03IleKQnkttjSzz5rTzomJbLOCfN0qUdCfeFNeC6NzqNFALXBf2Ff
         QLaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770912304; x=1771517104; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=;
        b=EZQfzpzIzKuXEb6/jdcVWw1LFXDV0La7X4+q1tjyjf7PzBM/LlWX5hRrTuzGlNvyxP
         UPGo4u3ec/tphm0mYAxOWVVls6IKyDAbFIH9fDPdivzyPKT8NetLe42vES0s/LBUUbeP
         TAzVy8KRsm6uLZBneKvVluf8kGumYdOyZUP5/QCYyRrFIUHo+xADaZ52KX7zv4v8wDiw
         Xao7VgwDWOVK9v5hh9qzIbuwgZSWvF8Q0HjE4PQC8akcI3ja7vpG7IUzYzd+NiwDG1WV
         AhqfQ4X1Ko5GuIVLh0dwrcXpZ3EQ0nJYkkSgTQ06z6PVk+4gPb+TBwQyYHwF+Qz1vSnP
         HcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770912304; x=1771517104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=;
        b=TjGb5w8gMepec+sEAlEDLOWDWQDg9LrulQEXXTjD5HeCvLf0s3vdbGEr7SBRbceZ/H
         z+I9Vwg011L+opdbrYM5QCWTnb4g67Ug1JhRQACpgxZDEsBX+cEJ2+QgXxELGEKmGnxE
         OJFQM/kNdomyBiydkfJGXcRbDXGPaSNYUc/swD3rBDcrraUWzx3ZQ7r3Q8gQqcmF7MAN
         0Kog4P/BXWUQdQFb2j88YyvEzaO6ROPZTFJL712aovqL0rpz1oWjtld+mWglKFpTDCVd
         UANz5nb53ZZ/hZPw0/jqsbXPhnV9Cgj2d34ssmQCgUVnBhz4COQ6rUVj7CpkVWdFYqvr
         vnzA==
X-Forwarded-Encrypted: i=1; AJvYcCXAo7lT67AirV4UdIa5fYn8rFKWvp6z9QI4RzXvKv66p4egP4sFKKgzrN8I3J9DWAmpXfgRl1i0vEk2Zl3+b6lH@vger.kernel.org
X-Gm-Message-State: AOJu0YxqXPoSWEhMyt9nSLHv/EALaUmUHoOpAn0AKPkU+GlFPCW3BitR
	3N2LlhmKBjj/l3d6Nxf0iO9oqaYyGqv4oZzUx/ZGivfpbciTytpwvTZxAPJjK6u1ygC6o41qOba
	+cnHiKj6ENf7LDKaYlhAuLSc7Zi1Rqk3R5n0p0q1OYQ==
X-Gm-Gg: AZuq6aKgQqhAroBvfUrswwYhX4XmfT7PL8vRfT/4HVc43yiLLIx4RkSzjoEozbGzVl6
	tBKJtqr/vjQw4zzGXC4S0i8KlctW01Fwlp+lTNj85Dg7rd32cVwhJlzI6GSZLc5uRvIIeqgMomk
	VXkIWTYt5z+NMVjFz1xKME1Y6pGAvTGehLVMu4lB/rbHpcHfaB8Hur1qm/AY30JWO42vZwNW4Qw
	TDCFaAT1QEDCUZeFv7ahea0W6SDUzP5pR8x7fJ4CKNo0AzVlRT3muDQZiEVozeX/SHkqPHsOmwS
	b/pdA7pPeNfbf4cLxkv1Uo8yK+s32BXQCqXKOT6aHwLhzAPyXQbY
X-Received: by 2002:a05:6402:1d51:b0:65a:1d35:8f02 with SMTP id
 4fb4d7f45d1cf-65b96e23776mr1895067a12.33.1770912304279; Thu, 12 Feb 2026
 08:05:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206033034.3031781-1-tzungbi@kernel.org>
In-Reply-To: <20260206033034.3031781-1-tzungbi@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 12 Feb 2026 09:04:52 -0700
X-Gm-Features: AZwV_Qi0tM27XEyjas6LWWUftEIAHKO8h9HFZERbJMTUtDu32gd6K5hxLfiAAy8
Message-ID: <CANLsYkzgNz6qxDDKnKiZE46UJmESnxT1-mnxo1Gtme-1x5MRsg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: Unprepare SCP clock during
 system suspend
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Feb 2026 at 20:31, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Prior to commit d935187cfb27 ("remoteproc: mediatek: Break lock
> dependency to prepare_lock"), `scp->clk` was prepared and enabled only
> when it needs to communicate with the SCP.  The commit d935187cfb27
> moved the prepare operation to remoteproc's prepare(), keeping the clock
> prepared as long as the SCP is running.
>
> The power consumption due to the prolonged clock preparation can be
> negligible when the system is running, as SCP is designed to be a very
> power efficient processor.
>
> However, the clock remains prepared even when the system enters system
> suspend.  This prevents the underlying clock controller (and potentially
> the parent PLLs) from shutting down, which increases power consumption
> and may block the system from entering deep sleep states.
>
> Add suspend and resume callbacks.  Unprepare the clock in suspend() if
> it was active and re-prepare it in resume() to ensure the clock is
> properly disabled during system suspend, while maintaining the "always
> prepared" semantics while the system is active.  The driver doesn't
> implement .attach() callback, hence it only checks for RPROC_RUNNING.
>
> Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 39 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>

I will pick this up when rc1 comes out.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 4651311aeb07..bb6f6a16d895 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1592,12 +1592,51 @@ static const struct of_device_id mtk_scp_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
>
> +static int __maybe_unused scp_suspend(struct device *dev)
> +{
> +       struct mtk_scp *scp = dev_get_drvdata(dev);
> +       struct rproc *rproc = scp->rproc;
> +
> +       /*
> +        * Only unprepare if the SCP is running and holding the clock.
> +        *
> +        * Note: `scp_ops` doesn't implement .attach() callback, hence
> +        * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +        * should also be checked here.
> +        */
> +       if (rproc->state == RPROC_RUNNING)
> +               clk_unprepare(scp->clk);
> +       return 0;
> +}
> +
> +static int __maybe_unused scp_resume(struct device *dev)
> +{
> +       struct mtk_scp *scp = dev_get_drvdata(dev);
> +       struct rproc *rproc = scp->rproc;
> +
> +       /*
> +        * Only prepare if the SCP was running and holding the clock.
> +        *
> +        * Note: `scp_ops` doesn't implement .attach() callback, hence
> +        * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +        * should also be checked here.
> +        */
> +       if (rproc->state == RPROC_RUNNING)
> +               return clk_prepare(scp->clk);
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops scp_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(scp_suspend, scp_resume)
> +};
> +
>  static struct platform_driver mtk_scp_driver = {
>         .probe = scp_probe,
>         .remove = scp_remove,
>         .driver = {
>                 .name = "mtk-scp",
>                 .of_match_table = mtk_scp_of_match,
> +               .pm = &scp_pm_ops,
>         },
>  };
>
> --
> 2.53.0.rc2.204.g2597b5adb4-goog
>

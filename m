Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4341F8EEA
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Dec 2024 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733122526; cv=none; b=VB710uJdh2OkAqTb1QH5e9jw90+aL71NJPFduPpCPUmcRo8yhtLG5/+k5dy8/A56p2LLNv+nIVPyuW7OvAxi4QnO867/qnQN1R0bMhakOMAHlp3229C4gN5+7QykbMIyUnJKnUQ90hm9r/VcwG5uOctPREppZ/gk/nPtj76SHTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733122526; c=relaxed/simple;
	bh=1bSb2HvkHJM161iVHbxIoMiZf6zQmATR8vcs+p+kvvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZs3p4NqsmffOCe/7g2bhpM9b7fhSWk1ZCwqJIfOs+TR7FE1ko5sgKiBcRFyl96py7aUnDhJxlzdatcDYvfu1zVEhdp5hHKMp5H+f4wulFpgcCHIKEB3A5FMkR9Lg2HXrAtNZyjHGggt+xFFgjQsanfZbtgv/2amkEwABo8knXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mzM4iV/D; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mzM4iV/D"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so35566951fa.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 01 Dec 2024 22:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733122523; x=1733727323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0nWzD+Lx38ifdjx/0KeRfxG6lCIDsNbyc9nq09sPzg=;
        b=mzM4iV/DX6cugbZOkkDxYG1soZM81B95Ce6/JxpR9+2mBXtrdmboc/TbsASFviBJJm
         Xp9qL8Cgp7/QrRWcTK1m68XmMAaLcjUI3qx7kI9ASOeom29ysBuwI8enD0fakWicrpUp
         bMy899oygRdz1UFBXJq8LrJxf/pzxriJCMzNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733122523; x=1733727323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0nWzD+Lx38ifdjx/0KeRfxG6lCIDsNbyc9nq09sPzg=;
        b=XVJ1PPPth+NV0gLMXIdOo6J/4L+gLQQ3iWITukmqDBbxjbmeeJQridpYw92Z7BYUKq
         /6vRKqfCZNt644tHprItmPd35wdG4XmVrry0GnOfXRLL7oEsWuaGgBTkn/F5AzUf8s5F
         QHaYwq422FB8DO1eEQDMBmaEvwuQL5Qc1a1hmCdDGA2y7JjVuxLgVB34vC6uvOZQ3sFv
         kI6U7gMfj6zM8NjLFIMi3C0/pkxro7ddmzv1wyFNutr6OibtH2H7ic99gwt/xwdb2iwF
         14shKOszmfINXLsy2FCEfE5JjcaNuRcJRHE461ZYCkdVge7GcMRcfEpwJe4ZTuqJLn0i
         AbxA==
X-Gm-Message-State: AOJu0YzVHZ2ZJxeMGGQ0ZV+8jDs+rSOCccYiorqGWmE5vNK31vdGDN1D
	TmbWYhLPrxArz5WNLf3J7C+KHBmvtyc5YvmnVJE+Bkgm6p/mvBc2d/K2DoNSq7kFj7LK3qGtuP1
	YZHLXjVPnbYMGe9OtWmvfuRoegBJNbQoJy6/e
X-Gm-Gg: ASbGnctLCsfgGHV523YW9UsNEo+9mBUFL95BBK7nYkENKzp6+E/fD7MEtccZqupYVFk
	+TpVWQ8mc/aoMZMJ7YJcyoXiI3NciRG/Y9SFrviEmoX6gAcl+WPkFGEScqGM=
X-Google-Smtp-Source: AGHT+IEhDuPhpyGV4L/ou+jUfLRVYtfsYdtVwBNOmHBMpBMrZhusEFwHylPLoeDz7/iqzLHY2ZH7xlMhRw1T/BJzw6s=
X-Received: by 2002:a05:6512:3ba2:b0:53d:a132:c68f with SMTP id
 2adb3069b0e04-53df0112a63mr10446660e87.47.1733122522682; Sun, 01 Dec 2024
 22:55:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202062826.66619-1-wenst@chromium.org>
In-Reply-To: <20241202062826.66619-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 2 Dec 2024 14:55:11 +0800
Message-ID: <CAGXv+5EYkG=Y1vWDO6DWnUhd0WRuctYn_3w2YkvJoR_7JhsCpQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mtk_scp: Only populate devices SCP cores
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 2:28=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>

Oops. The subject should read "Only populate devices for SCP cores".

I'll let this one sit for a couple days before sending a new version.

ChenYu

> When multi-core SCP support was added, the driver was made to populate
> platform devices for all the sub-nodes. This ended up adding platform
> devices for the rpmsg sub-nodes as well, which never actually get used,
> since rpmsg devices are registered through the rpmsg interface.
>
> Limit of_platform_populate() to just populating the SCP cores with a
> compatible string match list.
>
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-co=
re SCP")
> Cc: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0f4a7065d0bd..8206a1766481 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1326,6 +1326,11 @@ static int scp_cluster_init(struct platform_device=
 *pdev, struct mtk_scp_of_clus
>         return ret;
>  }
>
> +static const struct of_device_id scp_core_match[] =3D {
> +       { .compatible =3D "mediatek,scp-core" },
> +       {}
> +};
> +
>  static int scp_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -1357,13 +1362,15 @@ static int scp_probe(struct platform_device *pdev=
)
>         INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
>         mutex_init(&scp_cluster->cluster_lock);
>
> -       ret =3D devm_of_platform_populate(dev);
> +       ret =3D of_platform_populate(dev_of_node(dev), scp_core_match, NU=
LL, dev);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to populate platfo=
rm devices\n");
>
>         ret =3D scp_cluster_init(pdev, scp_cluster);
> -       if (ret)
> +       if (ret) {
> +               of_platform_depopulate(dev);
>                 return ret;
> +       }
>
>         return 0;
>  }
> @@ -1379,6 +1386,7 @@ static void scp_remove(struct platform_device *pdev=
)
>                 rproc_del(scp->rproc);
>                 scp_free(scp);
>         }
> +       of_platform_depopulate(&pdev->dev);
>         mutex_destroy(&scp_cluster->cluster_lock);
>  }
>
> --
> 2.47.0.338.g60cca15819-goog
>

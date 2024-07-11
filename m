Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF3E15ECCA
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jul 2024 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720707607; cv=none; b=nbe00TCwL2zFul4rIfQe3QtPPvcaznAkV6uT6ZouDD8xduVgCgU7bpTGKk7sETvdZZiuv4yZKxMFTihzf/ypfnUvLxSTSzLtMQawqSIM0i783mlftUT5+UnsEp4YzzlZOHQl9JJy5mpIhdW6js/SokJilGy9ZhfPiNpqQ9EVaJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720707607; c=relaxed/simple;
	bh=+hIY6jEEHY+QzykeVvjms7qfTGWHP59V5+6Y4tJ3yKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7yS0zBxFITn9NTDRahCRSKht2ywnE9dtR86SnwBMhT/FwAqlPWS6R+gqJg9gK5UvEmhNkblX1nuLJzXbBiwfvPIXBcwbSp1nVtI4qRHFsIxS12pR5YWXHJWZ4drp0uBiUj52MK6109eCr0EQVewcLi654ZmhaaxbGkc4rJrLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B4fKK69+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B4fKK69+"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-58bac81f40bso1376973a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jul 2024 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720707603; x=1721312403; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o3npd6EQvPKgtV4//EqEfrX3c75XqGVaZsV1QiKxfuw=;
        b=B4fKK69+CRAu1noe+uvQPknNc3N9myp1pIWy0dK7w/pGG7pmDrqg6UbG+bSt991SR/
         ngQ9++5bZk3Y+IUAHqSzc8FideYnh/JhqXePAlN+ISS0AJBmKETCp+R4sTNKIcVl/Nyo
         GO9JZTmWn0/n6BQNfuzj7eItXQtKlqFvRBRTPsNuGSxc+bdsdWcOYzIjV54Y1xfJRa/l
         Tm0aFMo1FWPyd8zWTDqWaULWbbp8sG9DFxHFtd/4BEPg8aL4/hc2u4bJPIsah5pCNG0d
         j0WPeVsoBGN84veei1+TWbmycfM5bZ/KcbOdRhJK5j8oE2/58lo1kvvc0uux7huS4jT3
         iHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720707603; x=1721312403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3npd6EQvPKgtV4//EqEfrX3c75XqGVaZsV1QiKxfuw=;
        b=Z8dcT2xVrgbY/ShuAOpaS9y806ubN9W8fNwvo5MkQcNQ1HYgNoYu6/nQaqO+NW1jUR
         Ioi2ZJr9wpYT8G1TGS114ogmULKwUZwV7TKice4He6Gnf+UbrYxNPcHGgWozYAe0+WGR
         FxJJcVkaEMhVifNYUb3s8wcpKZia5rR1OhQkoIFPBBykajxAui3ANud2gLW/ILTYIcxK
         b8VWKsjKxEzyIDXEdu11i3x1LKvGS2w3MKb6mj86Li/0Xb8dOREym3EpepQrMM0aSdIn
         SJkWDbDaaXh7fs0DdopECMMwn0SZb93tt3SrHN8p8R6tn+5Yxch+lO6KvMFwan/Jt9/k
         voZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqCrPhD2ZeflzcdmntFjzZMV8O+/fqv0lYg4ogqKSGoe9OS5vCJmLvYsJoB/F6hsL/MrpnTFJhGpgFm/V+2/TjRsQjUufVREuaXQMduCIJCA==
X-Gm-Message-State: AOJu0Yyk1R4d/A1zr7hF9mbGynCwZ4sKv2+IAtGhWKLG5dWt8NC0dvay
	atJ5QGZxFdlv5S7YK4DBv3CNhSgtMzFss46ECcc8udyOatg6Bgo+B4ocGXHYJFfCkybnuODxN3V
	AZzlBdeUqQX4PGFhsVz1vWeV8BJ2DJJUpIDYEqw==
X-Google-Smtp-Source: AGHT+IE5YvixzSQthswNAQ80xQ/qshZBUGeuPv0J87cnzFcQKMSwoY8hFu9XvKRCoFQLhJKzWznYERboE6rsk2B8lPk=
X-Received: by 2002:a05:6402:13d6:b0:58b:b864:ec77 with SMTP id
 4fb4d7f45d1cf-594bcab03a8mr7502600a12.39.1720707603305; Thu, 11 Jul 2024
 07:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710084200.6561-1-shun-yi.wang@mediatek.com> <20240710084200.6561-2-shun-yi.wang@mediatek.com>
In-Reply-To: <20240710084200.6561-2-shun-yi.wang@mediatek.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 11 Jul 2024 08:19:52 -0600
Message-ID: <CANLsYkw8vanrYi0jvP+1jfZWrYBtTuXSJ5xywJYUDLhyRQUrWw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/1] remoteproc: mediatek: Support reserved CMA regions
To: Shun-yi Wang <shun-yi.wang@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, jason-ch.chen@mediatek.com, 
	yaya.chang@mediatek.com, teddy.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jul 2024 at 02:42, Shun-yi Wang <shun-yi.wang@mediatek.com> wrote:
>
> From: "shun-yi.wang" <shun-yi.wang@mediatek.com>
>
> In order to reserve specific Contiguous Memory Allocator (CMA) regions
> for hardware use. When the name of the reserved region contains "cma",
> then a corresponding CMA heap is added.
>
> Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 38 ++++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
>

I'm not sure what to do with this patch...  Is it a superset of your
other patch [1]?  And if so why is it labelled as an RFC?

Please read the documentation on submitting patches [2] and subscribe
to the remoteproc mailing list to give you an idea of the patch
workflow that is expected.

Thanks,
Mathieu

[1]. [PATCH 1/1] remoteproc: mediatek: Support multiple reserved memory regions
[2]. https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e744c07507ee..ca0a4a52ece9 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -4,6 +4,7 @@
>
>  #include <asm/barrier.h>
>  #include <linux/clk.h>
> +#include <linux/dma-heap.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
> @@ -1006,22 +1007,43 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
>
>  static int scp_map_memory_region(struct mtk_scp *scp)
>  {
> -       int ret;
> +       int ret, i, err;
>         const struct mtk_scp_sizes_data *scp_sizes;
> +       struct device_node *node = scp->dev->of_node;
> +       struct of_phandle_iterator it;
> +
> +       i = 0;
> +       of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
> +               ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
> +
> +               if (ret) {
> +                       dev_err(scp->dev, "failed to assign memory-region: %s\n",
> +                               it.node->name);
> +                       of_node_put(it.node);
> +                       return -ENOMEM;
> +               }
> +
> +#ifdef CONFIG_DMABUF_HEAPS_CMA
> +               if (strstr(it.node->name, "cma")) {
> +                       /* Reserved cma memory region */
> +                       ret = dma_heap_add_cma(scp->dev);
> +                       if (ret) {
> +                               dev_err(scp->dev, "Failed to add reserved cma");
> +                               of_node_put(it.node);
> +                               return ret;
> +                       }
> +               }
> +#endif /* CONFIG_DMABUF_HEAPS_CMA */
>
> -       ret = of_reserved_mem_device_init(scp->dev);
> +               i++;
> +       }
>
>         /* reserved memory is optional. */
> -       if (ret == -ENODEV) {
> +       if (!i) {
>                 dev_info(scp->dev, "skipping reserved memory initialization.");
>                 return 0;
>         }
>
> -       if (ret) {
> -               dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
> -               return -ENOMEM;
> -       }
> -
>         /* Reserved SCP code size */
>         scp_sizes = scp->data->scp_sizes;
>         scp->cpu_addr = dma_alloc_coherent(scp->dev, scp_sizes->max_dram_size,
> --
> 2.18.0
>

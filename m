Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720427;
	b=5DF7jJtOdLtJuMtQY3ZW0LXSBEUMbwS/Ro2PLrg6KjfwyQv5rsi1+VrJBp64IZV8Bwqn
	 BDQQlRmSuASZ599Ocm3E3Id/Mw0VfMVONYXc8s/tO+rNQ8+HIeFJRwrPJZhiu1ham71dj
	 7Mo0+beohGirSY95+q+uJB+XC4Loamb+ZnoNBz6IUikVQAcCkDn1RXwtKiPTr2CU9MAHh
	 KMQx7qFcs2MzxO0Dk9eVv4hOetmOQpJyiOOaebCwsowarZImwEbgjeyhn4X8t9/GjaTha
	 84fXSRlVFX5h17ds2UitmlcAJXUrz2kqlHTANNnjRwzqlhL1fcWInF1pfL+n6/e77VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=EWOQO4/BUeLCAM60Oj14E4iA/D66uZxulDoNLysenrQ=;
	b=Kq1EAi4W7ym2SlrW+6BAaB6IzsO4dBN834Mrlyz10RrVx4LJzgyc9hs5dFY+7a+n8ygi
	 B6u9eJoEuNJp8OFaRdx4KQhi53uPi1/7HW3CDEypM8cckRxr05eKS0eTwg9kzyRbv79fB
	 CpTb9Nne330q/jtqXQfZcA1/r0N2pu2aAbwyN4wa38TKXK7lp0YNXeqfeeysjxQWbmsy5
	 K8cF7S6Mh+jo63XYZ8yw7oE2xI8y2k0yGbpl9uUPAwWlImoSbEjAimye7aX/FGgAOzNvx
	 qy1ZIgZpZ4FWYUvBfcc3YfqMEB1DJ04UPmB3/taDLd82q6l6iWz9IaMWVchmYg0YF5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pUETLBTW;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD13A606A329
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Nov 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD13A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pUETLBTW
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3148731b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Nov 2026 07:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793720426; x=1794325226; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWOQO4/BUeLCAM60Oj14E4iA/D66uZxulDoNLysenrQ=;
        b=pUETLBTWIvwlMvuFs2mQF3pRTpqENYDE37o5CSJtB3lIWgkNChpiJHnUlnmH/tx5mn
         tqtH1L4R8L6PezaGk0iHeXlKQR9oa5Je/mXiOPMBPS4KJgPIMeHBULerzoLJmATPkxNr
         aibTH3arP5QNEKO26Bz3Dqc73dvqSYylIiZvViAX628hSOQWrrsN/gJ/tRDD4SfzmuOD
         DOk99cF+4NSSXjM8oZhTsM9wTqvM4+FIzumLEvmQPcXeVkOUNE4QrLwBbe4YLKMITDzf
         mlqnmpRNU2VF4HbccmPxnb0eBH1NZMfWyqVQVAC7Z0+xiFWt4ENkbU7IFMBQ7rp9HPFp
         ps2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720426; x=1794325226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EWOQO4/BUeLCAM60Oj14E4iA/D66uZxulDoNLysenrQ=;
        b=Fo7VkFifxgn5hL7SsBjL//xq+uKWi8F8arXenWP4YL+wtLvCcRkjIXbshJ56xrzqAC
         MtgG7d2ZOvLUE7Y8/S28AzZOjUZ83i1MNbcNxQbsqrcUkPmkjPRXbLpDx3sNzwP2qEQ3
         46Ge4pCEYZqbpCGFkcpy98yNnB5s8Luf4OBu+8kvUhAN6a5vxP9sPtjKYZth5mDta/wt
         F9+z6RwtjJOkY9nNNkKNdfLo1wiWwa7jE0hLCgtej7J4edMUYfnmXOL41Hxe6VJQnmi7
         KUA64rE2hC2K8OV9YG3yIjUwe0nefuDc8cQygrf+9c/62Q/+nKm54qPGMNTLkWTeWj8h
         RZSg==
X-Forwarded-Encrypted: i=1; AKwUvByw9JeJnDDEbstX/D6MYMs5W1pXPmsSCaduYolLLv2z9B3jYqF6jBCjCfiAiRkko9NYuzi/FputHj9Dd2H6TvYO@vger.kernel.org
X-Gm-Message-State: APuU4Z+9Jh9c+YrjCKwsqNQvAE18FrLF2dSjwejly0tKSyN69K5K8EuB
	yBGl+EcK9Nugmf871LPkBlP3xJ60kF/q54XxE949Te2WW00RayKRAF3xd+D3xobn+Co=
X-Gm-Gg: AYBFou0nCUfyK6pjBHgZddzknUXTjwppNdACv/wLAPiBrK5UEJfj0vjyN4p5TP5WbkZ
	KBOgRZRfIsqGP17w1SLsCUVum4MnchTlkNZGQEUfgOVxeItlfEY5zqaS/87DT9YwGE/CxHp7lQS
	m/ZxpI94qeILp4UqE+/cNvtWYbuj7SdRQTjCOKpW6YX7QBWsIDGxqMCQ2GcTND5HUCV8acVZyx3
	PPhuSEQ/bD2C0sQJNS2rzL0CKeh7hf9tbQt+ADZImKIHmuj/h5AsoDcxLkLglr9r4PnH4ReGWFy
	FxdW6scKiApFZegclhAfJAlzZutQ1sgWiPickIUX/ibjpL6iepmt/8fTsx9v3teZfzCVx4oOxE2
	arvYVjYq2zr6L9s0s9Sjg2QjOOgRCTfIxjirye3DFReSZx/9jbQw2bEAHXRDfCq0drF03fanuFg
	O26w9pykESa0VoMT4xrbcNT0tNO4Ti+JV8Ies5pavbsP0uYL3qq93E4ueFBHGwFiXfzVOuBKYuU
	Xnf3McF5IHom/L3XnZ3vllWQkzuIFCYh1JJ8GlBn6ogHXcBc/Ba/S2GWjTf7PotEo2Yju9gFwv4
	6EGvdEQEOhHKLWoELlha+28LXjE7vw==
X-Received: by 2002:a05:6a00:3992:b0:8a0:1acb:677a with SMTP id d2e1a72fcca58-8a9bffd381dmr11899872b3a.57.1793720425872;
        Tue, 03 Nov 2026 07:40:25 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9b3e:1037:bf8:ee7d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm3345314b3a.37.2026.11.03.07.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:40:25 -0800 (PST)
Date: Tue, 3 Nov 2026 09:40:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auoAZs66RA5OYjJo@p14s>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>

Hi Uwe,

On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-König wrote:
> Some devices have special needs about how an Elf segment is copied to
> the remote cpu's memory space where the default implementation using
> memcpy_toio/memcpy and memset_io/memset isn't suitable. An affected
> mainline driver is imx-dsp-rproc which includes a near-copy of
> rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
> accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
> directly accessible at all and DMA must be used to copy the data.
> 
> The new callback can be used to implement just the driver specific
> memcpy + memset to increase code reuse.
> 
> The patch only appears big because of indentation changes.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 64 +++++++++++++---------
>  include/linux/remoteproc.h                 |  4 ++
>  2 files changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index da3cddbe7d4c..3c749a39e5da 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  			break;
>  		}
>  
> -		/* grab the kernel address for this device address */
> -		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> -		if (!ptr) {
> -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> -				memsz);
> -			ret = -EINVAL;
> -			break;
> -		}
> +		if (rproc->ops->memcpy_tova) {
> +			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
> +			if (ret) {
> +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
> +					i, da, ERR_PTR(ret));
> +				break;
> +			}

I really like your patch, but I'm wondering why you decided to move
rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both path,
i.e with and without ops->memcpy_tova().  Wouldn't it be better to
unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?

Thanks,
Mathieu

> +		} else {
> +			/* grab the kernel address for this device address */
> +			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> +			if (!ptr) {
> +				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> +					memsz);
> +				ret = -EINVAL;
> +				break;
> +			}
>  
> -		/* put the segment where the remote processor expects it */
> -		if (filesz) {
> -			if (is_iomem)
> -				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
> -			else
> -				memcpy(ptr, elf_data + offset, filesz);
> -		}
> +			/* put the segment where the remote processor expects it */
> +			if (filesz) {
> +				if (is_iomem)
> +					memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
> +				else
> +					memcpy(ptr, elf_data + offset, filesz);
> +			}
>  
> -		/*
> -		 * Zero out remaining memory for this segment.
> -		 *
> -		 * This isn't strictly required since dma_alloc_coherent already
> -		 * did this for us. albeit harmless, we may consider removing
> -		 * this.
> -		 */
> -		if (memsz > filesz) {
> -			if (is_iomem)
> -				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
> -			else
> -				memset(ptr + filesz, 0, memsz - filesz);
> +			/*
> +			 * Zero out remaining memory for this segment.
> +			 *
> +			 * This isn't strictly required since dma_alloc_coherent already
> +			 * did this for us. albeit harmless, we may consider removing
> +			 * this.
> +			 */
> +			if (memsz > filesz) {
> +				if (is_iomem)
> +					memset_io((void __iomem *)(ptr + filesz),
> +						  0, memsz - filesz);
> +				else
> +					memset(ptr + filesz, 0, memsz - filesz);
> +			}
>  		}
>  	}
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 00019b1895e6..e750a127cbc4 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -75,6 +75,7 @@ enum rsc_handling_status {
>   * @detach:	detach from a device, leaving it powered up
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
> + * @memcpy_tova:optional platform hook to copy data into remote memory range
>   * @parse_fw:	parse firmware to extract information (e.g. resource table)
>   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
>   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> @@ -99,6 +100,9 @@ struct rproc_ops {
>  	int (*detach)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> +			   size_t filesz, size_t memsz);
> +
>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>  			  int offset, int avail);
> -- 
> 2.47.3
> 

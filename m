Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E5BC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Feb 2022 03:26:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiBXD0o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Feb 2022 22:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiBXD0n (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Feb 2022 22:26:43 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06B420C1B9
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 19:26:14 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id l25-20020a9d7a99000000b005af173a2875so466114otn.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 19:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=on9uKzhYwhweFCf7oKVhfgEYko95i4/WUYrvIP0RTh8=;
        b=cf2SIGl7qEZZ35vEtrjchIJROC+VBCHm8ieSMJbnyzNLy/6Oy3/nbIQgeoaHJ5PDhP
         we/r2F7Bdh+5d925PQkFdcQKzpvDiiFQN7PUd2e/VHB5R+h+M+gCNtrvI4aJpmxEH8g1
         /xPmRVU9M7A3dYQRCwPRy5Fwd/DON54lJWqOR4N6Onx5UHsAm05UCxkt46fiPtEkmzsO
         FQkjmYloVmegueTVRGf3gBwz82CC/Vj+ApB/GfJG8k/nZjyTXRv5bxDTVc5B5SF6qbw5
         SVUnljrsfqTGSLbzU9MIJq0ZVvpeFyupq2fWuErvA588KcGbJkCly+nNBQch5HVfSZ/T
         a/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=on9uKzhYwhweFCf7oKVhfgEYko95i4/WUYrvIP0RTh8=;
        b=eoqbHHlF/b+v5JusslzNdvNTP1LJGb39g6PH7LM5aX80dWlr4aZy6hx3vtdwMSLdqu
         SdMl8Ecv3Le14y7973ClKpB9v9eV1OpQNiQ8gyQ7wa4JPpaljJpf0rPXfZtr/MPqMh0e
         wo84GSkTUSYGv7/WRHFqvKz1FTIpj+13jdnAaETYdbK4YSoH9+QGRnIiV7Zr1n9lsRM4
         7R03+K7fTyfq1Y5ase/qaExV08IBJYYJb4bCaNcSVpv2K9YWdeteWC6ISJocG63pXYBj
         b638XDI5NlriZdLGlICUFmJUUoRji3xm9is5rZqnBKvWzhIZGEKMBWfMEErXs2hNnyfB
         8O3g==
X-Gm-Message-State: AOAM531oGlOb7mFSP/ahnF8kkfbiHzfHiloJrdcrPo6i8O2lnoa56qQC
        EKjB2y4N4E1s3UvzGNvZJMwMuw==
X-Google-Smtp-Source: ABdhPJx0t/baNQZIQ1Fhsp08N+U5PnUxdY2SAXMYI8Gr8J2zArlZuLhUaYTFliNf2BUItuJ2wDK56w==
X-Received: by 2002:a9d:5f15:0:b0:5af:5928:d5a1 with SMTP id f21-20020a9d5f15000000b005af5928d5a1mr236017oti.343.1645673174040;
        Wed, 23 Feb 2022 19:26:14 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id g11sm763472oan.35.2022.02.23.19.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 19:26:13 -0800 (PST)
Date:   Wed, 23 Feb 2022 19:28:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc:     quic_clew@quicinc.com, mathieu.poirier@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V4 2/2] soc: qcom: smem: validate fields of shared
 structures
Message-ID: <Yhb7S2mwkEIcZO5X@ripper>
References: <1644849974-8043-1-git-send-email-quic_deesin@quicinc.com>
 <1644849974-8043-2-git-send-email-quic_deesin@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644849974-8043-2-git-send-email-quic_deesin@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 14 Feb 06:46 PST 2022, Deepak Kumar Singh wrote:

> Structures in shared memory that can be modified by remote
> processors may have untrusted values, they should be validated
> before use.
> 
> Adding proper validation before using fields of shared
> structures.

I'm not able to find patch 1/2, did you send it out or is it just me
being unlucky finding it?

> 
> Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
> ---
>  drivers/soc/qcom/smem.c | 81 +++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 68 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 96444ff..644844b 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -367,13 +367,18 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  	struct smem_partition_header *phdr;
>  	size_t alloc_size;
>  	void *cached;
> +	void *p_end;
>  
>  	phdr = (struct smem_partition_header __force *)part->virt_base;
> +	p_end = (void *)phdr + part->size;
>  
>  	hdr = phdr_to_first_uncached_entry(phdr);
>  	end = phdr_to_last_uncached_entry(phdr);
>  	cached = phdr_to_last_cached_entry(phdr);
>  
> +	if (WARN_ON((void *)end > p_end || (void *)cached > p_end))

cached is a void * already, do you really need to cast it?

> +		return -EINVAL;
> +
>  	while (hdr < end) {
>  		if (hdr->canary != SMEM_PRIVATE_CANARY)
>  			goto bad_canary;
> @@ -383,6 +388,9 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  		hdr = uncached_entry_next(hdr);
>  	}
>  
> +	if (WARN_ON((void *)hdr > p_end))
> +		return -EINVAL;
> +
>  	/* Check that we don't grow into the cached region */
>  	alloc_size = sizeof(*hdr) + ALIGN(size, 8);
>  	if ((void *)hdr + alloc_size > cached) {
> @@ -501,6 +509,8 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
>  	struct smem_header *header;
>  	struct smem_region *region;
>  	struct smem_global_entry *entry;
> +	u64 entry_offset;
> +	u32 e_size;
>  	u32 aux_base;
>  	unsigned i;
>  
> @@ -515,9 +525,13 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
>  		region = &smem->regions[i];
>  
>  		if ((u32)region->aux_base == aux_base || !aux_base) {
> +			e_size = le32_to_cpu(entry->size);
> +			entry_offset = le32_to_cpu(entry->offset);
> +
>  			if (size != NULL)
> -				*size = le32_to_cpu(entry->size);
> -			return region->virt_base + le32_to_cpu(entry->offset);
> +				*size = e_size;
> +
> +			return region->virt_base + entry_offset;

The only change I see here is that you read entry->size regardless of
size being requested or not, so I don't see any "sanity checking" here.

>  		}
>  	}
>  
> @@ -531,8 +545,12 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>  {
>  	struct smem_private_entry *e, *end;
>  	struct smem_partition_header *phdr;
> +	void *item_ptr, *p_end;
> +	u32 padding_data;
> +	u32 e_size;
>  
>  	phdr = (struct smem_partition_header __force *)part->virt_base;
> +	p_end = (void *)phdr + part->size;
>  
>  	e = phdr_to_first_uncached_entry(phdr);
>  	end = phdr_to_last_uncached_entry(phdr);
> @@ -542,36 +560,65 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>  			goto invalid_canary;
>  
>  		if (le16_to_cpu(e->item) == item) {
> -			if (size != NULL)
> -				*size = le32_to_cpu(e->size) -
> -					le16_to_cpu(e->padding_data);
> +			if (size != NULL) {
> +				e_size = le32_to_cpu(e->size);
> +				padding_data = le16_to_cpu(e->padding_data);
>  
> -			return uncached_entry_to_item(e);
> +				if (WARN_ON(e_size > part->size || padding_data > e_size))
> +					return ERR_PTR(-EINVAL);
> +
> +				*size = e_size - padding_data;
> +			}
> +
> +			item_ptr = uncached_entry_to_item(e);
> +			if (WARN_ON(item_ptr > p_end))
> +				return ERR_PTR(-EINVAL);
> +
> +			return item_ptr;
>  		}
>  
>  		e = uncached_entry_next(e);
>  	}
>  
> +	if (WARN_ON((void *)e > p_end))
> +		return ERR_PTR(-EINVAL);
> +
>  	/* Item was not found in the uncached list, search the cached list */
>  
>  	e = phdr_to_first_cached_entry(phdr, part->cacheline);
>  	end = phdr_to_last_cached_entry(phdr);
>  
> +	if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
> +		return ERR_PTR(-EINVAL);
> +
>  	while (e > end) {
>  		if (e->canary != SMEM_PRIVATE_CANARY)
>  			goto invalid_canary;
>  
>  		if (le16_to_cpu(e->item) == item) {
> -			if (size != NULL)
> -				*size = le32_to_cpu(e->size) -
> -					le16_to_cpu(e->padding_data);
> +			if (size != NULL) {
> +				e_size = le32_to_cpu(e->size);
> +				padding_data = le16_to_cpu(e->padding_data);
> +
> +				if (WARN_ON(e_size > part->size || padding_data > e_size))
> +					return ERR_PTR(-EINVAL);
> +
> +				*size = e_size - padding_data;
> +			}
> +
> +			item_ptr = cached_entry_to_item(e);
> +			if (WARN_ON(item_ptr < (void *)phdr))
> +				return ERR_PTR(-EINVAL);
>  
> -			return cached_entry_to_item(e);
> +			return item_ptr;
>  		}
>  
>  		e = cached_entry_next(e, part->cacheline);
>  	}
>  
> +	if (WARN_ON((void *)e < (void *)phdr))
> +		return ERR_PTR(-EINVAL);
> +
>  	return ERR_PTR(-ENOENT);
>  
>  invalid_canary:
> @@ -648,14 +695,23 @@ int qcom_smem_get_free_space(unsigned host)
>  		phdr = part->virt_base;
>  		ret = le32_to_cpu(phdr->offset_free_cached) -
>  		      le32_to_cpu(phdr->offset_free_uncached);
> +
> +		if (ret > le32_to_cpu(part->size))
> +			return -EINVAL;
>  	} else if (__smem->global_partition.virt_base) {
>  		part = &__smem->global_partition;
>  		phdr = part->virt_base;
>  		ret = le32_to_cpu(phdr->offset_free_cached) -
>  		      le32_to_cpu(phdr->offset_free_uncached);
> +
> +		if (ret > le32_to_cpu(part->size))
> +			return -EINVAL;
>  	} else {
>  		header = __smem->regions[0].virt_base;
>  		ret = le32_to_cpu(header->available);
> +
> +		if (ret > __smem->regions[0].size)
> +			return -EINVAL;
>  	}
>  
>  	return ret;
> @@ -918,13 +974,12 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
>  static int qcom_smem_map_toc(struct qcom_smem *smem, struct smem_region *region)

I presume this function was introduced in patch 1?

>  {
>  	u32 ptable_start;
> -	int ret;

Below changes doesn't affect "ret", so it should probably have been
removed in the previous patch.

>  
>  	/* map starting 4K for smem header */
> -	region->virt_base = devm_ioremap_wc(dev, region->aux_base, SZ_4K);
> +	region->virt_base = devm_ioremap_wc(smem->dev, region->aux_base, SZ_4K);

I don't see "dev" in the scope here, did this compile after patch 1?

>  	ptable_start = region->aux_base + region->size - SZ_4K;
>  	/* map last 4k for toc */
> -	smem->ptable = devm_ioremap_wc(dev, ptable_start, SZ_4K);
> +	smem->ptable = devm_ioremap_wc(smem->dev, ptable_start, SZ_4K);

Ditto.

Regards,
Bjorn

>  
>  	if (!region->virt_base || !smem->ptable)
>  		return -ENOMEM;
> -- 
> 2.7.4
> 

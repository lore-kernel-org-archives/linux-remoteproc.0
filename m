Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE14407598
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Jul 2026 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782919289; cv=pass; b=plcQ7kLQGpnKnq7poupoP5bQ0qdJ3blZkWIHRAi3wBabqSWZ/KXQ8a/ltKfabPmcdZy6ZJTUS3twgaEa5+hedN4p7aKPm7ir3wP1ByoJjNCWnGuHK5K6nEsEU64vQv+I63539S5fbBrMqg2mxerwHHwWgzJq2J42OY4zrLGES5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782919289; c=relaxed/simple;
	bh=kRkIUnYXuR5ohWpPureU/1FLcNhZnt+g040jlbs5/E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkDY9Gx5pcwVPnuCYNcGbMG5G++PpeH90d51S6qnBE6Dq6SqqpGhA8VZtE6qgax1e2mibNaw4RE95ofCHufbHtTRJE+GhPlHAA6wrow9eVmbaBxYd4jfZG490VJ4PaPq7E2PbNs3YQnPgkQwA23aFJHYGB9rwzRAYdJu96ahWHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2TuUV+k; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2TuUV+k"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso1885736a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jul 2026 08:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782919287; cv=none;
        d=google.com; s=arc-20260327;
        b=nHUp1BojSNlypbSbS4A5WEG6fSQ2qjBCfSdWXarKyb4qqbYn7eoefEwkFqbNZSl9Nh
         2dxBSEJzI4rhUAgUIJHhh68gdC4C7WKecd1Mud8wyJQvRdgWf/ZaEcNZzxQYatT1bEB0
         mgBxaA/1RL30YmsJqOPgDb8qc7k5zNaJczTefJkoFYHPuJbP4pDP2Whbtp6GSw5lhn/M
         rF4RmlsoSKKwq+M22zeGVK5g1n7je8ccgI5zaOKIBVFhm5NlfwDgtVse3YHflITKuFgX
         OzfRCuscLR4d7MQy+2vszJGpssO/aEiiYrSAYzr0fcdZZtC3z6FHKIiagcbmt9VMt6cX
         gNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rkfCaB6ftjlI8EPiEVI8jyp4wwfpLzO5MpuCSo6Dj8c=;
        fh=irmpFOIbIL0g+hf866/dxzHn4Xl6f5/UGS+VvVhQ9Jw=;
        b=Uvp//59YXg57bBUzYG3rfmWS5R90KbhnIBOh8lR0NIvxYzxlh/oOleH0jVbC0vZezQ
         TcI5USWcLvgcktZY8Nr3HckBqs64Wiba/GFdZcRmjRH9FpVo125I7g9z20ChDYCAR6MD
         TRzShO6cS+eAD2rnytluWMX3ttCXpabhDzwWJ08kb347n6W2jyURJuJyLYUw0Yf+eRyV
         +nafe0pn7LHCNSXjae4ZnJOuZ7NX1WXpOMQ+vMKajazQLsRNUUSBvzvuhUUV6hgK5aaj
         pgepDwfv+1kMpJRCPPGpjIcgv3RWlUsR+aSN0pMC/tzSAvBd85Ky3Fgz+bno83RfIOrY
         hxqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782919287; x=1783524087; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rkfCaB6ftjlI8EPiEVI8jyp4wwfpLzO5MpuCSo6Dj8c=;
        b=W2TuUV+kKMM2w7YW2nmDKVkKCn6itGHimaQd69idR+0tQMsuZdvX8JF6jn6FjXtwCp
         zNJMdCmxP/GaTfxP/bRbR8Q+5Fm3HvbusykmPDsIJLS4YJMlAVhBXkpKDdPcaiCUTaxQ
         L7sKEZkVdJRAN13Qm9lrI/VcZfkm2IqzOqmMbWxXaAAk5FtwPe72AZYJvxgRRRwiEMOn
         n0LIV2y3mmHk2Bfq0wKY8mogfZwq0n/LoM27fVUUndJkqRFNBbnMsQyCZHqjnIvHFuKJ
         k5IyJ7gRdTRGDb8szy3K6iQm1bfRUVGKu1FolE5AF2wZB+WMdBnqSPB+97Awh4aZw+Mc
         OsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919287; x=1783524087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkfCaB6ftjlI8EPiEVI8jyp4wwfpLzO5MpuCSo6Dj8c=;
        b=rz1Jn4YukOpExt6iDDRlvZpNDzLeiG+Wvf8cfVgnHsVPlotYdgsZ4XX/tyr5I6VeTX
         AyNDHGhs1gfG6wjQ4z55ORmRcxFfGBULtGkH139duJ1vep/KUZRIe912tvjsE/079oC9
         FZIVnntIgr53MDslUbDcrCiY6cApBYNGRQ2hEbOTp5qNhbfFwET13QsbLHgr9wzO8APy
         FXWJkr/NL24A551xeSl0wKWqS4FwNBOL6pHwqSQDek30M3+qBL7WfRTZZB6tMj3rI/uy
         3hU2865CiPUjfDNsIzhKToYDpd374BXK2Hj5agnZZhY9+yUXcAAZtOPLf0CYg1/eiXt9
         qnrg==
X-Forwarded-Encrypted: i=1; AHgh+RrwUsvq02Db4kmTT76aUgkW2Cn+PiBA3dfKxmTrn33fUjIxKA1VV3GW6HRVn2cyJ6w0pLRqWwkb/iErMQc1lELq@vger.kernel.org
X-Gm-Message-State: AOJu0YwoeQ8G+3uVFdbv0/Fv9sDd0tqt9VfrvkE+fVqJfFvqKTGX3WwD
	2IBwVHQHBmxrcY7mpyM53dU9ge98AcIAxPKte/V2bmbjRZEEKlabEKzeiTSIF8Rbp/IH2zx+mcI
	tqCEIedJCORJOhbW6l1lit0zPnM1p/UW1z1MKLVqFmw==
X-Gm-Gg: AfdE7clyEVb6pU0RiL0QfW7TWTQs0xCG2a4AqjwLMw12ByTNng9kICI7EWYu816C0cE
	bR1scgqkbcbOdB92mSjFEwUVkWfsYzGV8RW6+wTp1K2/1ArGvaeCh44Yhk0aYcIa3HwIzXL+yf7
	SYJb4ei+2MZA2sIKPnd5PsmAqdlje3kSKW1vbqJDxit9Qhwk9oU6oSS8+VFiIhvetraYKgW9Ub8
	pY8cmt7DmEiO/fOCBX16ura5Q3WHb9jOMMZeNKrGi8fLKjSg8D/7sUVp45IGWy3eXIgQ7KsdVQw
	ROf1cnyJOV8ZCbMjLdIg2c6T1B4vhK0=
X-Received: by 2002:a05:6402:1ecf:b0:698:3b7c:3b48 with SMTP id
 4fb4d7f45d1cf-698a2cf92efmr549442a12.39.1782919285062; Wed, 01 Jul 2026
 08:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630174056.667646-1-ben.levinsky@amd.com>
In-Reply-To: <20260630174056.667646-1-ben.levinsky@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 1 Jul 2026 09:21:12 -0600
X-Gm-Features: AVVi8CcAWHFMr5hS52zKY9zhz8JEy4Xv5u53u3NzWTsXAqvC-VS6VAWTvdHsgv0
Message-ID: <CANLsYkwHRsuaY3844CBTcaAttvj24S0KN8Q3KSVfFggeenXEaA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: guard wc-ioremap helpers with HAS_IOMEM
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jun 2026 at 11:41, Ben Levinsky <ben.levinsky@amd.com> wrote:
>
> The common wc-ioremap carveout callbacks live in
> remoteproc_internal.h, which is included by the remoteproc core.
> This means the helper bodies are parsed even for builds that do not
> enable any platform driver using those callbacks.
>
> On s390, CONFIG_HAS_IOMEM and CONFIG_GENERIC_IOREMAP depend on
> CONFIG_PCI. A randconfig with CONFIG_REMOTEPROC=y and CONFIG_PCI=n
> therefore has no usable ioremap_wc() or iounmap() declarations, and
> fails to build the common remoteproc objects with implicit declarations
> from the helper bodies.
>
> Only include linux/io.h and build the real wc-ioremap helpers when
> CONFIG_HAS_IOMEM is enabled. Provide no-IOMEM stubs so the internal
> header remains self-contained for randconfig and COMPILE_TEST coverage.
>
> Fixes: 50227acbf4e5 ("remoteproc: Add common wc-ioremap carveout callbacks")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606301559.w8eorNQ2-lkp@intel.com/
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>

Applied - let's see if that satisfies the bot.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 02c00475b010..3a742ef6ef60 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -14,7 +14,9 @@
>
>  #include <linux/irqreturn.h>
>  #include <linux/firmware.h>
> +#ifdef CONFIG_HAS_IOMEM
>  #include <linux/io.h>
> +#endif
>
>  struct rproc;
>
> @@ -123,6 +125,7 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>  void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
>  void rproc_remove_rvdev(struct rproc_vdev *rvdev);
>
> +#ifdef CONFIG_HAS_IOMEM
>  static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
>                                              struct rproc_mem_entry *mem)
>  {
> @@ -148,6 +151,19 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>
>         return 0;
>  }
> +#else
> +static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> +                                            struct rproc_mem_entry *mem)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
> +                                         struct rproc_mem_entry *mem)
> +{
> +       return 0;
> +}
> +#endif
>
>  #define rproc_elf_load_rsc_table_optional(rproc, fw, dev_func, fmt, ...)       \
>         ({                                                                      \
> --
> 2.34.1
>

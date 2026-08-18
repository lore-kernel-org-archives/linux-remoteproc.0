Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C63247DD55
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071349; cv=pass; b=VyliAZSLp8jH//KsmRimIvh/HFkCn53kMqsCI989x5tTAkwVUfkhNnDZeXHhcm8xcs016rc1XGYAqL8LhmArJ9vLyNXx8jjQmT7XQH6e8ckYALrw/+M6G1uIRxL6hdZ2Km+xVla6hLGgUBqB5hRSwSdxnKpRkrwdYo8tSDpIk4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071349; c=relaxed/simple;
	bh=jOe/Qgt4xrTB740jyMnCQA6XR47zjyEenVDyBo7Zhk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+plSDdDbCRXosVMVl7HchPrwATzZNDciLjMhIvsT3px0JB9wyH+j/SGKx7K4tz2ZitVXxJ7hyC/pp3IcsYBmKjcsKURsMm+P9h8MvBtyRKcq5/yIRD7HlY39LTfgHaQ1tePM7xyv6ZXqYkdMu7HYTkCHk7tGuC7s1n5tVZcYXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YuYk0qcY; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuYk0qcY"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1c52d920b8so655217766b.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 09:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787071345; cv=none;
        d=google.com; s=arc-20260327;
        b=TDfE55WoqGMLrXzGibH6spEPNHFbo+OyOSlFKZky/gu0+hL4IGZrh1EK//4gcYB+T8
         6xoxDwuddSgW9OrkvrSgdzvhF+SCRbVQY0KDNlsa+V9nYcHgqJP9mPEuWUh5JpzAtQ4g
         Fpx6lPhxpy5Gx1/8AptCrbOekpq7uDhvEfgbK1Kk7V2OVu7/EF4sB++WQxaUO9uZkDi1
         8PgGPsCmPxw6zbAHvxFYknGWWS3E7lsIdpktMnQow42gEajEmOAyfArJjOv01MpLDMF4
         ogXX8sCfuXcWtrY3QiqWWtZZGGPJDorE0RHBeufDiqddRMrPHz1PQrriOkTrKSBC983x
         MawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C1LqKy0ru7P4gjurmwOxAwwAQ13L5hLvH14rjfrn234=;
        fh=AVcRgPhY/mRf6sYu2/adnV3YsMWyHzJLJw652qGRMgU=;
        b=rSPglLViGnL05ms8KZsxtDRVmiL1cIO+3C+YwA8/XLZecHZwCZi5qvzYOQVdjR4yP6
         erGJup52Nh+1bRxj/rGuEl8ie+Qf+2ju5YMcZFhaKKii+zs0meMKX7ANXnuKi2KxkwQP
         037PV+Y3dyq/sjp+vWhBOobIdzDV4hcY5p658klC33qJ67RtxYFJyU7NZmpEfcl/8rrB
         3iJ64WmiH9lxpQJCdiCkczbPNRaB332JOqMQAG5mcT7ehVtNk5jjDrAgxxfdrk5r4bY5
         q4oNtkXm/V225l//MF9/+BLgXWh09PucfYQuruk4b4d71wARpRyqulkDSCYjcacUK7/b
         JRUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787071345; x=1787676145; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1LqKy0ru7P4gjurmwOxAwwAQ13L5hLvH14rjfrn234=;
        b=YuYk0qcYp+B9Da9akzhGyBvG2mwKu0oPcbyR+lAN3uqA9ustGgs81phGUHsFIOdNC4
         zemkPkWxLyATn4kfUk6YVzoDclod3dJcdKJ8GLIpzSbSVfZ1z4oumMIATu+1F5Kvxim5
         /J+dxgRX9DDUYiueXjwyavosbr2WWQ9LFyO1zPV4J8MxnKbPmG/LcMAFxKwdQASu0t6u
         rcBzFPivg8Vq1xrpjn2OvX9Ub3RO3q3rHkgDuDc03DXbN5pGpB3YSZCh9lR87Ag0Qwgc
         PoHNNGyQNhiuP5jsHSmq7AyG4w5ZXiRlPLeTixxuyP0Syptl7gRUY+0afUESaqEnZ/9Q
         mbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787071345; x=1787676145;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C1LqKy0ru7P4gjurmwOxAwwAQ13L5hLvH14rjfrn234=;
        b=pNhpGd8DA5ZnAVB7DwncSTb2Eg04kSjpQv8Z1TNn1hYEeGHs2QoRir4hJW1lBgKKGJ
         jn3rebj1LhChaOK5QgKC0LWsfn49+QudOHpSfWBFqfEr9anWdSUtZw/VyjCt0Xy0HfzE
         hpzzwYEB54Sw0uV4HXC9Sy1AFBs+c8+cNuqDLMYOf9E3NweVQICsIp0Gsh2ONeetVxo1
         83h1aU0SC5zEQ+y1HPMA8Wr+7clSTN2A12OcSR29P35V75AjvXANvqHIaiHn4sglADqn
         PNjPq8EqDR/MXCJRsxzwpVbJ++G/+2afqkT3ZjQhpGbWgrPX0NxfNxWsjJ+9AYs0SYmF
         KcPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqgZPVEtWqU6BJPxShacI0mNF5mRXuZMQAWzT8Xj1jI+40GEu2fv+KyQBoYuTDrU6aAilZbqFtJKWVL6H1r+O+@vger.kernel.org
X-Gm-Message-State: AOJu0YxaJSfhB40Nh7mJgAht4neZ9+LibzFaaz27o5RJO9H0b6wHiOhe
	PKkRnYaNYR7CsPECa8/aIez7giooxw8gSU4EZG9s2BOilZpK5nId0YECUQhf1MTxod/0HvwLvF3
	RRlFFfCGAbuTyg0yZY8l0HNeFqLDB8+kw5MqRDt9xWZb7AyiMQKBL
X-Gm-Gg: AR+sD102twlmCzxjJKBLkiVCl3Ok3h2HJjSF7wqKwSFjh++F65VBWwiDE7b/xs3eOCf
	V8kHkx1evbYtR47ucYYo/P22x317Lj5xxZG4y09kU4/WPaa18MvpL6CVF0e6JRxnSEj6DO6c3kr
	r65ppC/fbk/WYLgog3gZF08pOG7Irt59qwRrlNC38sJ64gTS2DaBVsKHkcyeQDK6splidQtNNJR
	FfCW38WV5/PvCXMli1V5/EPGzNJ8+pi0fE3A+ztkqAbLTcY6SjXstNNLN1/+E7KzkHETwWD5qkx
	8te+B1s/QTulLGG2MPCANG+Lg/PktIWzIHCWWVx6pQFlY38vShCvjO6ujbe502coE+dupxh6hlk
	j04k=
X-Received: by 2002:a17:907:934a:b0:c15:deea:a178 with SMTP id
 a640c23a62f3a-c212a33b977mr1431132566b.25.1787071345467; Tue, 18 Aug 2026
 09:42:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724025322.2341205-1-sammiee5311@gmail.com>
In-Reply-To: <20260724025322.2341205-1-sammiee5311@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 18 Aug 2026 10:42:13 -0600
X-Gm-Features: AcwNN1W6syuqo9XFENbuqu8SdO9PAKceH7Oqq3zh7WyLsaBRbVXAC33BZH8edaI
Message-ID: <CANLsYkz+h6ONmvhgdfGLNu21J+LrMSySFw9sxRcR4ZxLwPfbsg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: elf_loader: bound the section header table
To: HyeongJun An <sammiee5311@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Good day,

On Thu, 23 Jul 2026 at 20:53, HyeongJun An <sammiee5311@gmail.com> wrote:
>
> The rproc_elf_sanity_check() only checks the image is big enough to hold
> one section header. But find_table() walks e_shnum of them, and first
> dereferences the header at e_shstrndx to locate the section name table.
> Both fields are u16 and both come from the image, so an e_shstrndx of
> 65535 reads about 4 MB past the buffer.
>
> The commit 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read
> past the ELF header") added the same check to the MDT loader, and says
> the header "is sanitized beforehand" under remoteproc. That is what this
> patch makes true.
>
> Check e_shoff against the image size first, so the two bounds can use
> size_add() without an e_shoff above SIZE_MAX wrapping on 32-bit. The
> bounds are separate because e_shnum may be zero while find_table() still
> reads the e_shstrndx header.
>
> Fixes: 400e64df6b23 ("remoteproc: add framework for controlling remote processors")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 23 ++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 94177e416047..da3cddbe7d4c 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -46,8 +46,9 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>         struct elf32_hdr *ehdr;
>         u32 elf_shdr_get_size;
>         u64 phoff, shoff;
> +       size_t shend;
>         char class;
> -       u16 phnum;
> +       u16 phnum, shnum, shstrndx;
>
>         if (!fw) {
>                 dev_err(dev, "failed to load %s\n", name);
> @@ -90,9 +91,27 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>         phoff = elf_hdr_get_e_phoff(class, fw->data);
>         shoff = elf_hdr_get_e_shoff(class, fw->data);
>         phnum =  elf_hdr_get_e_phnum(class, fw->data);
> +       shnum = elf_hdr_get_e_shnum(class, fw->data);
> +       shstrndx = elf_hdr_get_e_shstrndx(class, fw->data);
>         elf_shdr_get_size = elf_size_of_shdr(class);
>
> -       if (fw->size < shoff + elf_shdr_get_size) {
> +       /* keeps shoff in size_t range for the two bounds below */
> +       if (shoff > fw->size) {
> +               dev_err(dev, "Section header table is out of bounds\n");
> +               return -EINVAL;
> +       }
> +
> +       if (shnum) {
> +               shend = size_add(size_mul(elf_shdr_get_size, shnum), shoff);
> +               if (shend > fw->size) {
> +                       dev_err(dev, "Section headers are out of bounds\n");
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       /* find_table() reads the header at shstrndx even with no sections */

Right, but if there is no sections, @shnum in find_tables is 0 and not
arm is done.

> +       shend = size_add(size_mul(elf_shdr_get_size, (size_t)shstrndx + 1), shoff);

Why the shstrndx + 1?

Also, there is no point in doing this check if @shnum is 0.  Please
move this block in the "if (shnum)".

Thanks,
Mathieu

> +       if (shend > fw->size) {
>                 dev_err(dev, "Image is too small\n");
>                 return -EINVAL;
>         }
> --
> 2.43.0
>

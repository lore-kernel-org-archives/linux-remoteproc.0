Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1E62DCBF4
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452173; cv=pass; b=eQ6DvGTLlDrMB9w8TcJGDSbgXspTRygElZcvl79L9hGLcT9pBoBVbocyQMBDwdnb3Dg0BJqvWJshTQG2rwM46jhamz9lyKl6P1AGg5QFsB0V7B7CY/buW3Z9kbQALT2G0rljlFLTMdmSRv7WSmli1TbLwlP6Q8eI4sQ+idH9QYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452173; c=relaxed/simple;
	bh=OIK7+qrTbFOubYpJMUr6Cl33I3M2w/PQQP8Fneqqx6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYnIJ207NuOhi/pU1j5398olE4N5f7/DFeVoEl4pZu4tLCrMTG2/i3zwmiodbka7BQ9lH1m12bp/m3CsIrrZTm6vWKEMV7HOsOa5AbxtihfWrY5vpdEOExbzzjI5I52TpxM2Ri6J/Fjmk3OMjwCLG+AY06yukxGNOF0PUA5u0yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKWZS/lj; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKWZS/lj"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66847de014aso11127958a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 08:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774452170; cv=none;
        d=google.com; s=arc-20240605;
        b=Bz3MV499jIyWHE0vqDj9rGXuMyOZHJlXDU4OYOmcQ38CIxYiBNu4WFqmv19yNcIREY
         tBO/VCKYkNamlaDnlHYHgkb8eEgzoBduhZ+YqyxRwv4Mj3LkHmXbUNxWYh+Tyi3U3mGT
         YdLL832Zerd7d4QznSZvbXGamn6+MtXHJH5xjeLJ4L2RuQmiORkQZmaq4KYPmg3YIvxq
         RNQgpbL+avMvYo4vn9cKpBKcFlmGJFbwglgAPtKozY3NNCpZvmwakzFa0wff82zRWXfr
         EzUETwvfa9abUCpnE/oKCQ24FJNafQp2oghN232TU/nWnCJ6cOIIAW/bsqDvOxLSVHXk
         xOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y5ldE3XGzBFi97mJGegwchCUOJzrx1ToYu7mGlYqdMs=;
        fh=hTPtHZeEbBGRTO6RJTNbf6mac8MNlR7/qcK+EoWdeaE=;
        b=c5MgXrsfKQwu2oR+pOPLiW/rXRZLFM0q+R0NzUE/mjt/gyFmQlEhy721gKArkEPMuZ
         D8UPsmhHqCdQD7Oq98HKRUnFNLjxmjqrJTLSQids+Sp+L39H+myGNvPlPd9HFqbmPVxQ
         Z414JX5GhGEvWrO3g9xrO4XkaS0qp864T4mhi88c8/WVHjgj96/obqIQ3leucAPm0Kb/
         IdCS5181eOSAb08LY/bdcK+4mLJTIWdIWQnBBCJyu10v95bZEFLSD08Tw44bRzs/A3Im
         y5QGYmLz25Kryx7zlH+rPSWoFBQ2pwMjbUSILfeMspjkiJbW4Ds3ZBEwRVxBthVRqf1X
         m6wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774452170; x=1775056970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y5ldE3XGzBFi97mJGegwchCUOJzrx1ToYu7mGlYqdMs=;
        b=QKWZS/ljrW/kT9Rfl0+02QjSrGvD1snRb9namK6v5Dg8Gkhm78lrj62FtjqOC5VXHv
         uuYgiE3ZUTj3f7UNzDTJxMWPqmcr81cWWuVsmR1cmBAt4bX28m8IrUdpZ+CGdFergYon
         vMbJVoiyL54v7GDZ188V8iUoMQWddB3/nU3A7ciZBHpqrsZEq9HCtLWbAO1MERIzIdmW
         eHroBYloTouevlLIDHc/LK2TDSEr/vGR7w9OV+tCq97H28Ii0oa9QN7Pwjx9QV0eCfrX
         p4mi24WC7yR7PXqaxswEDj2dLA75+Nno5FEfGKgvR4PrCBbHOz372US34GOXq7u7PWwV
         rA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452170; x=1775056970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5ldE3XGzBFi97mJGegwchCUOJzrx1ToYu7mGlYqdMs=;
        b=RpowgTWhbCwbXsISYwZu13XwNmcJQuXLatEqp+SFeyqAf+Esrj2WYFW6K/VkyiOcGZ
         TOHGh25W75qXBZs56oGgusEUBc6ijcT8VqDYM2vPREptKkN6RRPWMgWM/bjE/L1zRQO8
         5G0hS635L1wljkCuvi5uNpb4BOHYLSMUrBSlnbXU71aNJWvQjOsZAlbDTLjs5lwMezuk
         o8NA852HMLqMHESWxHqsaNsgDnuScjXUV+Xf9rYO5s4uP2Z3Dp4yzLwu8i33JQVWl0eM
         Tfkp7UbhLtIybWAuxf5bqz0AEQF4MtjizfamVI764lXMrQK3xKtSSUhy5THdrLcxNyI+
         DuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJyJuFTMltGX+sh2S6KAS7udFPOF3BJX95EXZSxNOczBa7gQZsjcVOHt1Hihv09dJRt6y5YkN+0FIBTdNI+HaJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZgHd4T9y0HaodDNKTUk/L4u1dN/E+vkFiwa77fvzfLwCsxZrO
	F9BOuOkFU3HQn2Il7LWEcr8Wvj+BP1KnlohYIcKxNkBLdYiDbPxgOUWyB+9cIMjrpWNidD2vFJ1
	u+glcrdm5v4/rU5gkehhiHLIkmsiNU1/DV3ocLAWEVA==
X-Gm-Gg: ATEYQzyc/Oo35GuUSq3a14vyQzjDguTzRZvTbiFXfGLnUkXq5nbs7lMc/qMW+/lKIx0
	8gGYPj3A4gR7/MDqN4Q1GxsqneZPQAyuaDD+u+T+MIoVdOO3Fs7YXZcxZKZ9MJnm+TNK61n+N72
	hcDsuasrpbDr/zLz7ZggGcCcM/K4RBJkKjqMpLt/RLV/xLbYDl+K+cSmMV/u6dOciFm30zHW19B
	Wso4xUaht7Z47mRWjLPI1u48diFeDi88+DU4V5KnhD1+38bTnuQK54+OAbbkd+cx5d6tEOheBz8
	Xn0kl+LKQPlorURYPMFBb4B6MhO4jKgoSRlQpuyC6A==
X-Received: by 2002:a05:6402:529b:b0:66a:6c0b:937e with SMTP id
 4fb4d7f45d1cf-66a8262e2b7mr2772111a12.12.1774452170134; Wed, 25 Mar 2026
 08:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323070313.42933-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260323070313.42933-1-pengpeng@iscas.ac.cn>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 25 Mar 2026 09:22:38 -0600
X-Gm-Features: AQROBzDY7nOyCtGksNeZt6HLLixxfYhbcI4lrrS7ecHgGX0UpeNf1BtSroOn1Zw
Message-ID: <CANLsYkx6Q4oF6tt7DXKGZ5Y0d5oDeKmdib7dgu2rgdVyzyEXxA@mail.gmail.com>
Subject: Re: [PATCH 6/7] remoteproc: validate resource table offset count
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Good morning,

On Mon, 23 Mar 2026 at 01:04, Pengpeng Hou <pengpeng@iscas.ac.cn> wrote:
>
> rproc_handle_resources() trusts table_ptr->num when it walks the offset[]
> array, but it does not first verify that the loaded resource table is
> large enough to actually contain that many offsets. A malformed firmware
> image can therefore force the loop to read past the end of the table
> header before any per-entry bounds checks run.
>
> Reject resource tables whose offset array does not fit inside the loaded
> section.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/remoteproc/remoteproc_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index b087ed21858a..47fdfe5c2124 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1022,6 +1022,12 @@ static int rproc_handle_resources(struct rproc *rproc,
>         if (!rproc->table_ptr)
>                 return 0;
>
> +       if (struct_size(rproc->table_ptr, offset,
> +                       rproc->table_ptr->num) > rproc->table_sz) {

This check is already present in here:
https://elixir.bootlin.com/linux/v7.0-rc5/source/drivers/remoteproc/remoteproc_elf_loader.c#L305

Thanks,
Mathieu


> +               dev_err(dev, "resource table is truncated\n");
> +               return -EINVAL;
> +       }
> +
>         for (i = 0; i < rproc->table_ptr->num; i++) {
>                 int offset = rproc->table_ptr->offset[i];
>                 struct fw_rsc_hdr *hdr = (void *)rproc->table_ptr + offset;
> --
> 2.50.1 (Apple Git-155)
>

Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1C2BCF4C
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Feb 2026 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770761012; cv=pass; b=M1DFSdaahZ8FG1C9bAjIA5+MyNiRUjEwAGUFZzfjyzDMzDBKMeMmfo6/Fg/L1e+Nm4FLVi755W38BUP56uoNuZeThHzDL0xExsCR+3YKJGWJUZBSMTLJ4iVxMS/bgWyylTuO/djfeR/DaaX6ENRjZXezrYhB1VCPwp6pTvlAeOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770761012; c=relaxed/simple;
	bh=t2JsmQ7gHl2ZvmEVuEnjm9WXT9Hm/NM7NXsCAyMrWmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gcp73xebfimbcOxKuySOW4G+XcFyxDTKDHOYAmXSE05WMh5mRXhHg279lZtN/IaPBA3YCgsImhNO9bTlEPNdmCPw1rPR8bLxXvptgsrrrcSTIIhsgumPOEFTVzpgsGxcVEt4s6izOlWur9/7hUeHKonPru+TsWG1UPO67Rb5GQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXnD66dL; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXnD66dL"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8e9c8ada38so1018269766b.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Feb 2026 14:03:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770761009; cv=none;
        d=google.com; s=arc-20240605;
        b=PMesMMCH13apb9EkKnj0d4N1TzxxiE2sWAg8Z9mgPiortKgyFgI5lvApN30sOry++Y
         jBoFKNJWQgbEbmPifOMHo/sMN1CqQfslYsLPSjODMIDyC9FJFevMhIC3SXvdRqX+UpYZ
         bHR97CGdKWWHdQfULDXPJPtHquib55z17lsFJdfOZ+gYUZwgYvWOLQEjrI0Nw4nUjAY8
         zw6eQiCQuyPh8Sa8O2NM4d2K2r4yRsGuOc74NxioSFXQouBMprDn9YqnZVikrA2t6807
         KppRzqiA5hdxwyONSEbINNxVhBrmfo4yKFKmuPrEc2eYBWHPtm2P6VVqmBc27S/cclVd
         1nsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=;
        fh=Ehd+j2wtO6kaXQbSb9uPnNhTJIli2Hg6fQERLiUUGNA=;
        b=VSpU8rIg+JDLVHjqJl1jqu6ZJ6YB/iBnrfcLjuGf4amrD5EGqaRIzqCEJemxWCGCd7
         RuyAKsTOWUJ6SJCMy6sPV7p85eTLwWxMY/yAENvAZBx0WAPULnWFcQjC8Xfj1gbf4149
         4dI5wPuOegNTlCur9AKUKqbqSVasvHHEHowBJHx/HP/ZB3SYZhBNy2Q2FYl3v4ZWtS5s
         k0pqEsSgqdB9nO+xbxlXcOD+iHdAFIO9L6NSYy9eZtgDKd8u9vxft0bMp0fSNQ4BWQfb
         ExTbox+nPvS+qfIHhdOPjG50CRRg1wnEWKcnMYnv/OTp/y+Wy5SVVR42wnHIy6Ct7pM8
         f1/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770761009; x=1771365809; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=;
        b=TXnD66dLRRAu06hDDAynfki9iHPCqSo+eO9tc+HKrKV8NE60VM1aZ8bl8d3la+3G3k
         x49ieThtw2GtS7g2lyiBOVP0mcWzFNpflHzPy0F1yr6HupK15c2U1tHXnQ5108USGpL3
         zWClCAIxuCjnU/5rJGkcgOcZr6h6W+LK5VG6NZMei04E2UAf8+U6hVpNx351A8S7ZdL4
         6ecYqnqz7Hv352TsT+qAl1ayRwx/WjUP7J1V1A+15XNNwSpHokc9CCuvdooGEHuJozA+
         obZKCO1nBOtn2Ytl/g78aOES3IgIfdgoiZV1ld3goZkfu+tboYz+AcrY+Jr0yV4SHrcS
         o1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770761009; x=1771365809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=;
        b=vk0dIdSHRzWn2DdIShva9s2Gy2wAxeNq3WuCvIOttFCS1wn0iSEO2KW9dfXC4IY4J5
         D1UgETOY5juJo5hzRCw9eKI2B2iq692fh7xFali1yFhSGwUUW85t8URbj7UdqizstKbV
         CQnOqjVwLR8KEP5z1QxiIjuhyBRVrOmef0c9t3faY2Jk5Ob7zAhDeW2tGzJKS9R+TZFY
         8KxYOMmV8zKYfVoaKk90IclwoEYx+Saf7VQfuDLvKoq3tS9oU6GtSdRMrS3GnOcemgIj
         IFPRPmTxlGTe8nVvg5tUQbvOorCnMH4kob6IunNrd26LZ3JM0m29/wrVwwoxEXYR7FjG
         5XxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdagVWRlLEvBEBG9FGoCwPwMYmP2Vqfqinahtt+hKlGU/neg0dKl5lkmQp2Z7u9nZu1JBlA8/6M0YlmmtCXurK@vger.kernel.org
X-Gm-Message-State: AOJu0YztNUjYrEGaABHVM37MXpGQJCJSo41AuddRRJirbrDkc8hLyzlG
	HnPAyVbPvwqVdeHvFzrF5zc7rGGUun/Tq/a5QT+i5PgDigzmVzW5PVYBJLAmEAQmPu91uu0pKaC
	t89TBLTpD/U4Irbpl1zQU4kTOginDymg8t0AWxSi8Tg==
X-Gm-Gg: AZuq6aJT37vgfl5M/9u5nk3PylxLGJo297WgPLvRDciTb5JxKcFazVX7e5/bwVjsFuX
	0i/+clNwSxcb7LW7EF9covIvUcuduMd1pjwwNdVR4nbc2jepoM/2qct2JibasE0QFiVXQHkI43B
	XiU0TokQByNDbG4u2cCtSfJ33FmOBDqwnZzA2jKAHrnJDdhS2EvWtM93xg181wNv/YEdlBsQCoi
	knoeRty42FQMKBNioWtwdt0s9HqBEFk5Ni2qtuP4ELQWVLYJfvZvZKDK5g2W/U9dLRvSkq9z4Rt
	WOTYa4YN3/WYzvZzhxtZ/VGaBx7H8WU+BDmlZv8GhA==
X-Received: by 2002:a17:907:9618:b0:b8d:be68:bc21 with SMTP id
 a640c23a62f3a-b8f6eec8fe7mr6747966b.21.1770761008993; Tue, 10 Feb 2026
 14:03:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
In-Reply-To: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Feb 2026 15:03:17 -0700
X-Gm-Features: AZwV_Qgdm6kPXS9NZM-j5COa-F6f74PqWhNBvMsMK65d02PCcMWV4eo058PVXss
Message-ID: <CANLsYky0HEkzL86XZ5K1NwJ3Gh9DcQKwu=WwiozMmus8UJQDPQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix unreachable platform prepare_ops
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Feb 2026 at 04:29, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Smatch reports unreachable code in imx_rproc_prepare(), where an early
> return inside the reserved-memory parsing loop prevents platform
> prepare_ops from being executed.
>
> When of_reserved_mem_region_to_resource() fails, imx_rproc_prepare()
> returns immediately, so the platform-specific prepare callback is never
> called. As a result, prepare_ops such as imx_rproc_sm_lmm_prepare() on
> i.MX95 have no chance to run.
>
> This is problematic when Linux controls the M7 Logical Machine and is
> responsible for preparing resources such as TCM. Without running the
> platform prepare callback, loading the M7 ELF into TCM may fail if the
> bootloader did not power up and initialize TCM.
>
> Fix this by breaking out of the reserved-memory loop instead of
> returning, allowing the platform prepare_ops to be executed as intended.
>
> Fixes: edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-remoteproc/aYYXAa2Fj36XG4yQ@p14s/T/#t
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d6790519360f446f063e09d018c5654953..8c8ddbf995a46b01627d15a2eb3da0b72eee6285 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -617,7 +617,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>
>                 err = of_reserved_mem_region_to_resource(np, i++, &res);
>                 if (err)
> -                       return 0;
> +                       break;
>

I will pick this up for the next cycle.

Thanks,
Mathieu

>                 /*
>                  * Ignore the first memory region which will be used vdev buffer.
>
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260208-imx-rproc-fix-843dd1031b5b
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

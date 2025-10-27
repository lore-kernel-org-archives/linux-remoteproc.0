Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EA92773EC;
	Mon, 27 Oct 2025 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557583; cv=none; b=Vl1nQu+YXqWO2e5AvX4SALu/hUkPE69FeFtp6AQWlO/Db79au2+HmmGyFihRtQsxVjoNs6y8zcfr87+5dss24hoigZ3o8WL/olD1N2rh9tlM6DyG8AB3yVWN1jejxXGcy4HD+5lqifFROnXnWNjPNpqKM0AqFygJInjO3LlblyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557583; c=relaxed/simple;
	bh=rTgPzkbHTz6CLV0HalVq6PovgVJUM7yM8MpMHc6txvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+G3+hxGFTexkFOvNHI4uqagSPR3tKmVLIB4ovSBKJ+fusn0/0nfQngQpEQq6YPUh/Vn/XM4cvVhdNgiTXk5fL2DSQ68zbu4fWb9bRcGl+g0QfcuLU4guRCzBl9LehUcOfDJl50gtyhSEE4TstW22PlI8qWgNaIX03RpfnE793c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IavK31t9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IavK31t9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761557574;
	bh=rTgPzkbHTz6CLV0HalVq6PovgVJUM7yM8MpMHc6txvU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IavK31t9oKFUguKtvnj6uUkl+zZI+2ndJShUTkxMkNWpcz2bSvDuzD5rtx60eMNt8
	 NDmQKPXEFtuCJJWZMwkxMrnG3rMnZVoqZMJYeFFz17yMfxjVufSmsS2QKdryuAjeNx
	 muCM3jfql29XKccecm0ynWrjB1jGjzICzT79uuefqvgthH4u9IRtTNN2vSRXVtmRSR
	 h8L6R8tyqkEHVsb7t6+dMJvp0jTCBs5fZNZ4HFGlM9HywZ3XswhoQf4IT1hswUjLOl
	 jgGqJVhhFBykQja9wHsa+7QwEE0fds7lb/cwX2y5D9ewxRdVJ0EjHCtl6mdmZv5Bpg
	 bJoUySTZRf2og==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C691017E1340;
	Mon, 27 Oct 2025 10:32:53 +0100 (CET)
Message-ID: <158c16f0-9d50-45f9-a3cb-5deb36d09366@collabora.com>
Date: Mon, 27 Oct 2025 10:32:53 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: mtk_scp: change the snprintf() checking
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <aP8agyKj73bLZrTQ@stanley.mountain>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aP8agyKj73bLZrTQ@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/10/25 08:08, Dan Carpenter ha scritto:
> The snprintf() calls here work but they have several minor style issues:
> 
> 1) It uses ARRAY_SIZE() which is the number of elements in an array.
>     Since were talking about char that works, but it's more common to
>     use sizeof() which is the number of bytes.
> 2) The printf format is "%1d".  The "1" ensures we always print at
>     least 1 character but since numbers all have at least 1 digit this
>     can be removed.
> 3) The kernel implementation of snprintf() cannot return negative error
>     codes.  Also these particular calls to snprintf() can't return zero
>     and the code to handle that zero return is sort of questionable.
> 4) In the current kernel the only "core_id" we print is "0" but if it
>     was more than 9 then the output would be truncated so GCC complains.
>     Add an "a >= sizeof(scp_fw_file)" check for output which is too long.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v2: The v1 introduced a W=1 warning because of the truncation issue.
>      It's a false positive because GCC assumes that "core_id" can be
>      every possible value of int but actually it can only be zero.  And
>      also generally, in the kernel, truncating is fine and it is fine
>      here too.
> 
>      But let's use that as an opportunity to do more cleanups.
> 
>   drivers/remoteproc/mtk_scp.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..db8fd045468d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1127,11 +1127,11 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>   		return ERR_PTR(-EINVAL);
>   
>   	if (core_id >= 0)
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp_c%d", core_id);
>   	else
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> -	if (ret <= 0)
> -		return ERR_PTR(ret);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp");
> +	if (ret >= sizeof(scp_fw_file))
> +		return ERR_PTR(-ENAMETOOLONG);
>   
>   	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>   	soc = &compatible[strlen("mediatek,")];



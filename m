Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E02A11CBA
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Sep 2025 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757660517; cv=none; b=dU6fV4QdOAl3L4oHIH5vABstZhcLuck09cL1jGFf018zikC9Zp/p9aJAFH6cKnTNeIMLeSDqLpYm6yqx84IR7OMnMz5VmGSldtjQpEQTdWgspXg/EtcZViw/FTMclvBOVuJAu0VdoSQIr9p3EbvPOo063NMoc719LUcIofT1YLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757660517; c=relaxed/simple;
	bh=/WybPmMFS6hyUWgKO6ee34fSWhEbB2rgNVNpssWHr+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OALcyapW9UhCW6s6z/KI1qZNq1lbAXhgU8siMYAveajVMK4pWy9IuQ7/gpc5JsR0NOaX+SNNFniDtAFZm/68kGKuD81EboCczJdIu3UfRtGijzwCWx5Zlk7ilES/Sg1GrdVIiT8EkK9ljgS8xZcmp1HRxn3QbTTg7d1Covxevi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAhOxwkq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAhOxwkq"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3e7636aa65fso957792f8f.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Sep 2025 00:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757660513; x=1758265313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YaWj+Wtj/24uprPfhMzjPFyopaRjb/i1iqDzvUVq8gE=;
        b=kAhOxwkq26q0ypj5r9Je0f09RWDv9x0vnNtX+nMAiryxx5jQ/K9nEoF4Oy4FQ4nrNT
         //5ZxfypZtoHvJ5PEfZdKM7yFMCPg5RR4aZrHPJQ2cLDJpLEQDeSyQ88r7q0Elvp9IOZ
         tldSwxgxoo50x6+am2LbWuy8K05ZH6t/kIrels8I3nhfxBcARfHBYUNZRZEN0WMl8Kcc
         oaqfnzSeVxZlWhhJL7JSbCNvqIbLejgaQfTh8LmCd6KIOBqE1n2aYDcngC1GcR1ksqNZ
         WzV1tznSc9PtM0RnkCesLKQu70Akzd8YRMOaicTbpQHThBCKgyRnnpZhBz4voT3nxQ4p
         dupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757660513; x=1758265313;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaWj+Wtj/24uprPfhMzjPFyopaRjb/i1iqDzvUVq8gE=;
        b=fHAkddcXrb0vHsCLKWE3+ZFNxlV86MIC7j/Ovdxtn4mJybX2yLmyENT9KAZqRlFZt1
         B6DiwqkGz6wwRgSwoq4KdSNjl7kmB8+GoKHwYpspUL9NJlMiQWGVaACNYlyjLbnv9w3n
         YFqBuJLz2BzS+oRbhUrVTyypDBeZkTFvD57EYwHgo++C5lymBvtRgxdPHYGFlHKKB8vp
         oE9D+Ce2j9KoKBFGnvVZ6uE0dKtz7RySEjfembtVh2rHMEu+1z0e28jUa0tKxjwu4/mA
         aut/NfrZaXx++64vefgR+VF7qQTky+BXiMJtSGsfdlJmRBEEA83mokZUiLFgdj7ycxBe
         BGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZFh2xIaFdOFYenUDg8uqRNKg6j9bLDZHtIjt+XHodAfjj/mqGy2XI0v4DbF08OUyLXyWcJt3KhnkvPFqP7f+N@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyxJwePN6xwra6LP1n7amLHcn2h6OHetSAHCKRkfWT1QS5IVc
	NnLDsAzBp2ef8iC4VfwX5awOKR8wHSv1MKouORyv15iKEuLf1w7E23oh
X-Gm-Gg: ASbGncvDqbVuMnpcQ5/FUPzovrTzEo6hAhWYhN5KrWLs8cpBVvwpysOK/PFz6+hsRHH
	x/WKLh81Amr3ssPPImb6L53A/7XsStmE0RiFxty4V9QQ0rNZMUVkE5T0bjHaak5HR9wderKwRPi
	qvQ9b/ukBSihn5MjWmvu0M5dDXPZlvgfBpIkpCsK5P63Qo2BX8a+ZnH9Z7/xwoWh+gWNKXZnmfz
	xVXe/51XjAbm70lyS43u/vZs506oGogJzuB2oc13gPAyifhw+yfPRdoIWmklTZtgttF9dyLzS7c
	AhrtnZl+9zzfHQs8CETUpiea6mjFh96QJxrHVI5XQk+xQJuFxRlVKWyrGnuTev91EyoPXhS7Gi4
	24lrNIM2OOUKlfDP0NmDAo8JRaCn4UfY=
X-Google-Smtp-Source: AGHT+IEOlpS//jr2i1NsakDvG6pEzwnvWvf80bQZB97SnNY1RtBItPkLSDjlNWiHmg/Wj/paRb2sRQ==
X-Received: by 2002:a05:6000:2407:b0:3ce:9872:fd3 with SMTP id ffacd0b85a97d-3e765a2dd81mr1373225f8f.34.1757660513106;
        Fri, 12 Sep 2025 00:01:53 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e015775f1sm54638945e9.8.2025.09.12.00.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 00:01:52 -0700 (PDT)
Message-ID: <6f60bb97-86fc-4cda-a373-a991547bbd77@gmail.com>
Date: Fri, 12 Sep 2025 09:01:49 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mtk_scp: Construct FW path if firmware-name
 not present
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-remoteproc@vger.kernel.org
Cc: arnd@arndb.de, andersson@kernel.org, mathieu.poirier@linaro.org,
 wenst@chromium.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250911140043.190801-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250911140043.190801-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/09/2025 16:00, AngeloGioacchino Del Regno wrote:
> After a reply on the mailing lists [1] it emerged that the DT
> property "firmware-name" should not be relied on because of
> possible issues with firmware versions.
> For MediaTek SCP, there has never been any firmware version vs
> driver version desync issue but, regardless, the firmwares are
> always using the same name and they're always located in a path
> with a specific pattern.
> 
> Instead of unconditionally always relying on the firmware-name
> devicetree property to get a path to the SCP FW file, drivers
> should construct a name based on what firmware it knows and
> what hardware it is running on.
> 
> In order to do that, add a `scp_get_default_fw_path()` function
> that constructs the path and filename based on two of the infos
> that the driver can get:
>   1. The compatible string with the highest priority (so, the
>      first one at index 0); and
>   2. The type of SCP HW - single-core or multi-core.
> 
> This means that the default firmware path is generated as:
>   - Single core SCP: mediatek/(soc_model)/scp.img
>     for example:     mediatek/mt8183/scp.img;
> 
>   - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>     for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>                      mediatek/mt8188/scp_c1.img for Core 1.
> 

As we inventing a naming scheme here: if we decide that signle core FW is calle 
scp_c0.img we can get rid of some code.

> Note that the generated firmware path is being used only if the
> "firmware-name" devicetree property is not present in the SCP
> node or in the SCP Core node(s).
> 
> [1 - Reply regarding firmware-name property]
> Link: https://lore.kernel.org/all/7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com/
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 64 ++++++++++++++++++++++++++++++++----
>   1 file changed, 58 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8206a1766481..80fcb4b053b3 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -16,6 +16,7 @@
>   #include <linux/remoteproc.h>
>   #include <linux/remoteproc/mtk_scp.h>
>   #include <linux/rpmsg/mtk_rpmsg.h>
> +#include <linux/string.h>
>   
>   #include "mtk_common.h"
>   #include "remoteproc_internal.h"
> @@ -1093,22 +1094,73 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>   	}
>   }
>   
> +/**
> + * scp_get_default_fw_path() - Get default SCP firmware path
> + * @dev:     SCP Device
> + * @core_id: SCP Core number
> + *
> + * This function generates a path based on the following format:
> + *     mediatek/(soc_model)/scp(_cX).img; for multi-core or
> + *     mediatek/(soc_model)/scp.img for single core SCP HW
> + *
> + * Return: A devm allocated string containing the full path to
> + *         a SCP firmware or an error pointer
> + */
> +static const char *scp_get_default_fw_path(struct device *dev, int core_id)
> +{
> +	struct device_node *np = core_id < 0 ? dev->of_node : dev->parent->of_node;
> +	char scp_fw_file[7] = "scp_cX";

We provide a string that we later overwrite. I'd prefer to have just the 
reservation without any 'artificial' string in it.

> +	const char *compatible, *soc;
> +	int ret;
> +
> +	/* Use only the first compatible string */
> +	ret = of_property_read_string_index(np, "compatible", 0, &compatible);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	/* If the compatible string's length is implausible bail out early */
> +	if (strlen(compatible) < strlen("mediatek,mtXXXX-scp"))

Seems like a double check of compatible. Why is dt-bindings for that not enough?

> +		return ERR_PTR(-EINVAL);
> +
> +	/* If the compatible string starts with "mediatek,mt" assume that it's ok */
> +	if (!str_has_prefix(compatible, "mediatek,mt"))

Same here.

> +		return ERR_PTR(-EINVAL);
> +
> +	if (core_id >= 0)
> +		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +	else
> +		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> +	if (ret <= 0)
> +		return ERR_PTR(ret);
> +
> +	soc = &compatible[strlen("mediatek,")];
> +
> +	return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
> +			      (int)strlen("mtXXXX"), soc, scp_fw_file);
> +}
> +
>   static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>   				      struct mtk_scp_of_cluster *scp_cluster,
> -				      const struct mtk_scp_of_data *of_data)
> +				      const struct mtk_scp_of_data *of_data,
> +				      int core_id)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev->of_node;
>   	struct mtk_scp *scp;
>   	struct rproc *rproc;
>   	struct resource *res;
> -	const char *fw_name = "scp.img";
> +	const char *fw_name;
>   	int ret, i;
>   	const struct mtk_scp_sizes_data *scp_sizes;
>   
>   	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> -	if (ret < 0 && ret != -EINVAL)
> -		return ERR_PTR(ret);
> +	if (ret) {
> +		fw_name = scp_get_default_fw_path(dev, core_id);

Wouldn't it make more sense to encapsulate the whole fw_name retrival in one 
function, e.g. scp_get_fw_path.

> +		if (IS_ERR(fw_name)) {
> +			dev_err(dev, "Cannot get firmware path: %ld\n", PTR_ERR(fw_name));
> +			return ERR_CAST(fw_name);
> +		}
> +	}
>   
>   	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
>   	if (!rproc) {
> @@ -1212,7 +1264,7 @@ static int scp_add_single_core(struct platform_device *pdev,
>   	struct mtk_scp *scp;
>   	int ret;
>   
> -	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
> +	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev), -1);
>   	if (IS_ERR(scp))
>   		return PTR_ERR(scp);
>   
> @@ -1259,7 +1311,7 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   			goto init_fail;
>   		}
>   
> -		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
> +		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id], core_id);
>   		put_device(&cpdev->dev);
>   		if (IS_ERR(scp)) {
>   			ret = PTR_ERR(scp);


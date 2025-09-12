Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5CD280035
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Sep 2025 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757670695; cv=none; b=RBQCeGpS0XBjPZ9GqapF8Wx35A/f7UBlP0hXa9YS3WhC2NBaNxHzBfujusXfR6M1MwNM1+zolYgBrVnbKT4hd8cUt8tSKuZ0xQhlzXrEZ6pG3bR7MMEatNMgKCToKKsNwJyJUFZrN7fm0CtP+Ci1mqyUcF5B++CVzv41AFmyDo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757670695; c=relaxed/simple;
	bh=ixMYmndT1bRE/9KdUqp2lDI6i634aV/nJhUsK4VpDAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vnr6MfCsuBMa/whQTqNnhWX7kcH+l0fe3vJQApOdX66kBKM8x4b5ulPQHAil7sEP3lOaWnreaRSo0VZnM9qsXGJ3bjMLH3MymsfqcefB6GXUcxZKrTvAXXvDYOmvIkKo+QUttn5n9bMwKsuSFOX2P7AxejG6DgA3P/TXUpk8KbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j52W5E8e; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j52W5E8e"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dda7d87faso11776295e9.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Sep 2025 02:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757670691; x=1758275491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mpHfD0y/k7EQ4L8qNlMkR36kG/8VWpplR8Qp6+wp9Q4=;
        b=j52W5E8eZ+HOicMEoWb/VrCJZ1fTOudbyrtG6WqjEYDoyBGmpROTkgchQ5xi506Hqt
         aosKS6sNFHKr9OLgWAjuVoLpK4/t4TjCW6RDitx+4S12kjA7k5AqeX5bEXnMFWaGMnZt
         qoAUHqXoujwp1w9SWAPs83Q1Os7rqqq7rITwlrunEyaEGKcBFfbfFx8BDTjHGnmxIcYN
         icCN44o7DhdpZ26vnYjxLk9QMivtdOW5CXiAKZXk07sNDHVFxNoL7flD+umCfH/5IfEv
         tYUfoUCMHCr4aHB/F433EBfkTaLa4/zeXiU7O8ZxrPZMVByXqxWkQT9NFbwzVnHt1hq2
         eiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757670691; x=1758275491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpHfD0y/k7EQ4L8qNlMkR36kG/8VWpplR8Qp6+wp9Q4=;
        b=LJnqclBYtgoAzVqdNUimu+1n7HQRlvtizqYolfh+P72HA5wzCchYHGLv6VzKtRRX9d
         eg9pFK7h9lw1Kuy6jo56l0bObfYlmcfOJmXxnMdqfKBHw83ixQvLH8xWiM4KK2KjkqbJ
         +XYvLnmur3gUMsWMFuNuBe3euS6Ubk/cHf5Nb/OFV6wGF1C2SY91z3LoKajr1X+jSRBP
         0KS7MOiCfFGjuZ3fiwA/g+pTTwEYQ2gbr8H3tTRr+CKnPkx8/xY0P+jSY2svhLpfkFMZ
         9hOHPeWiEQoiZYqbr5BBmZbVOyUWMZCE3ntSd3++MFMGuPniwAMuLT/fhZCroHCCjcjt
         nbrg==
X-Forwarded-Encrypted: i=1; AJvYcCVixE3w4web5q+SLeJqpGBDha9oclLdEK0J7/x3z1Ij4Whh7X4zth1Mu0xyffG20/5IBjahgvTShPnUYDh23ClB@vger.kernel.org
X-Gm-Message-State: AOJu0YzX1m8srJGOnOE56CoGhHrE7nSae/hjRR2zRKqhd/pzppr561sm
	pdgg+wxa0JApSlGci+3z9OurH9DkwMFx2/szLWvBQwkAga3sjoyacFBJ
X-Gm-Gg: ASbGnctt/wzOIfaJr6q+So4T1tj14b6qegxq8hUz/Eu5RCHCyfiPlI0Zf9YNsbzjCcL
	vKclB6M+48yBfXcVm0RGyKj8XYrb+wUsf1kCmpiF5fJAp8R03p3HHNGai13j7h/453m9d5G4DbV
	IBbpK9m5H4Wp0sdQn2xu/yucbk8/56eIlmTLm8Bt3+o+C5bnJ5D0yeJ7Kg5AxtesXSY0Ap1UlZ3
	TRRCqj4t6JBaSNSFWLvxgxI5pLcIfQj0jBtemtZG+412NXeT6ZCKWKzOt+wr2OMwceGntuuB+ro
	/TvfrieFJDWOUvfMfmFuqaONlkKAlYiAR3D/UWwFFtnrBOUinMklwcV91qy9eeItAreMFIro1M7
	N2DKJ9US6cCvYW0ZKXyUV69ZTwW4uzxplFe8DJvxxCA==
X-Google-Smtp-Source: AGHT+IEPfrQ+CFb6oLC8kg4XbM3mRlwGUzo193ZQhuiCWDXCCVP561IfMvDCA4TmRoi+c0kYYXN6JA==
X-Received: by 2002:a05:600c:83cf:b0:45b:43cc:e558 with SMTP id 5b1f17b1804b1-45f21207be1mr22680385e9.35.1757670690897;
        Fri, 12 Sep 2025 02:51:30 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157619fsm59474995e9.7.2025.09.12.02.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:51:30 -0700 (PDT)
Message-ID: <748d6a49-3ee0-45af-bee3-fb40b98f94c4@gmail.com>
Date: Fri, 12 Sep 2025 11:51:28 +0200
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
 <6f60bb97-86fc-4cda-a373-a991547bbd77@gmail.com>
 <9fafe6a4-e30b-4ea8-a85c-2e66ebd34040@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <9fafe6a4-e30b-4ea8-a85c-2e66ebd34040@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/09/2025 10:45, AngeloGioacchino Del Regno wrote:
> Il 12/09/25 09:01, Matthias Brugger ha scritto:
>>
>>
>> On 11/09/2025 16:00, AngeloGioacchino Del Regno wrote:
>>> After a reply on the mailing lists [1] it emerged that the DT
>>> property "firmware-name" should not be relied on because of
>>> possible issues with firmware versions.
>>> For MediaTek SCP, there has never been any firmware version vs
>>> driver version desync issue but, regardless, the firmwares are
>>> always using the same name and they're always located in a path
>>> with a specific pattern.
>>>
>>> Instead of unconditionally always relying on the firmware-name
>>> devicetree property to get a path to the SCP FW file, drivers
>>> should construct a name based on what firmware it knows and
>>> what hardware it is running on.
>>>
>>> In order to do that, add a `scp_get_default_fw_path()` function
>>> that constructs the path and filename based on two of the infos
>>> that the driver can get:
>>>   1. The compatible string with the highest priority (so, the
>>>      first one at index 0); and
>>>   2. The type of SCP HW - single-core or multi-core.
>>>
>>> This means that the default firmware path is generated as:
>>>   - Single core SCP: mediatek/(soc_model)/scp.img
>>>     for example:     mediatek/mt8183/scp.img;
>>>
>>>   - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>>>     for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>>>                      mediatek/mt8188/scp_c1.img for Core 1.
>>>
>>
>> As we inventing a naming scheme here: if we decide that signle core FW is 
>> calle scp_c0.img we can get rid of some code.
>>
> 
> Ohey!
> 
> No, well, we're not inventing a naming scheme... if you check in linux-firmware
> and in the current devicetrees, you'll see that the path adheres to what I wrote.
> 

Well I'm not able to find any *spc_c* firmware :)
Actually mt8188 has scp.img as the only file.

> As in - all of the single core SCP always had the firmware in path
> mediatek/mtXXXX/scp.img - and the dual core SCP has two firmwares.
> 
> The dual core one is a bit special in that the two cores are *almost* (but not
> fully) independent from each other (not entirely relevant to this discussion tho)
> and can load one firmware per core.
> 
> In short - in upstream, the only naming that we're inventing is the multicore SCP,
> but we're simply keeping the same name for the singlecore ones.
> 
> Even for multicore, I'm not really inventing that out of the blue - MediaTek are
> using that naming in downstream, so I'm just copying that.
> 

Which is no guarantee to be a good way to go ;)

Anyway I think the actual naming scheme just makes us add code for no buy-in. 
For me it would make more sense to fix the firmware naming in linux-firmware 
then "working around" that in kernel code.

> Btw... I really don't want to change the single core FW name to "scp_c0.img"
> because my plan is to get this merged and then cleanup the devicetrees for all
> MTK machines to *remove* the firmware-name property from the SCP node(s).
> 

OK, but that's independent. We could keep symlink in linux-firmware for backward 
compability, if needed (delta linux-firmware maintainer gets mad).

> firmware-name support in this driver is retained only for retrocompatibility
> with old DTs (and perhaps "very special" devices needing "very special" firmwares,
> of which none exist right now and hopefully we'll never see anything like that in
> the future).
> 
>>> Note that the generated firmware path is being used only if the
>>> "firmware-name" devicetree property is not present in the SCP
>>> node or in the SCP Core node(s).
>>>
>>> [1 - Reply regarding firmware-name property]
>>> Link: https://lore.kernel.org/all/7e8718b0-df78-44a6- 
>>> a102-89529d6abcce@app.fastmail.com/
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/remoteproc/mtk_scp.c | 64 ++++++++++++++++++++++++++++++++----
>>>   1 file changed, 58 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
>>> index 8206a1766481..80fcb4b053b3 100644
>>> --- a/drivers/remoteproc/mtk_scp.c
>>> +++ b/drivers/remoteproc/mtk_scp.c
>>> @@ -16,6 +16,7 @@
>>>   #include <linux/remoteproc.h>
>>>   #include <linux/remoteproc/mtk_scp.h>
>>>   #include <linux/rpmsg/mtk_rpmsg.h>
>>> +#include <linux/string.h>
>>>   #include "mtk_common.h"
>>>   #include "remoteproc_internal.h"
>>> @@ -1093,22 +1094,73 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>>>       }
>>>   }
>>> +/**
>>> + * scp_get_default_fw_path() - Get default SCP firmware path
>>> + * @dev:     SCP Device
>>> + * @core_id: SCP Core number
>>> + *
>>> + * This function generates a path based on the following format:
>>> + *     mediatek/(soc_model)/scp(_cX).img; for multi-core or
>>> + *     mediatek/(soc_model)/scp.img for single core SCP HW
>>> + *
>>> + * Return: A devm allocated string containing the full path to
>>> + *         a SCP firmware or an error pointer
>>> + */
>>> +static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>>> +{
>>> +    struct device_node *np = core_id < 0 ? dev->of_node : dev->parent->of_node;
>>> +    char scp_fw_file[7] = "scp_cX";
>>
>> We provide a string that we later overwrite. I'd prefer to have just the 
>> reservation without any 'artificial' string in it.
>>
> 
> Yeah, this one is a leftover that I forgot to cleanup. I fully agree with you.
> 
> Will change that in v2.
> 
>>> +    const char *compatible, *soc;
>>> +    int ret;
>>> +
>>> +    /* Use only the first compatible string */
>>> +    ret = of_property_read_string_index(np, "compatible", 0, &compatible);
>>> +    if (ret)
>>> +        return ERR_PTR(ret);
>>> +
>>> +    /* If the compatible string's length is implausible bail out early */
>>> +    if (strlen(compatible) < strlen("mediatek,mtXXXX-scp"))
>>
>> Seems like a double check of compatible. Why is dt-bindings for that not enough?
>>
> 
> It's more than that... (check below)
> 
>>> +        return ERR_PTR(-EINVAL);
>>> +
>>> +    /* If the compatible string starts with "mediatek,mt" assume that it's 
>>> ok */
>>> +    if (!str_has_prefix(compatible, "mediatek,mt"))
>>
>> Same here.
>>
> 
> ....and it's because.... (check below)
> 
>>> +        return ERR_PTR(-EINVAL);
>>> +
>>> +    if (core_id >= 0)
>>> +        ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", 
>>> core_id);
>>> +    else
>>> +        ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
>>> +    if (ret <= 0)
>>> +        return ERR_PTR(ret);
>>> +
>>> +    soc = &compatible[strlen("mediatek,")];
> 

Shouldn't we use strchr(compatible, ',') or similar here?

> ...I'd otherwise anyway have to check here, as this is a pointer to the middle of
> the compatible string, used below to extract "mtXXXX" (mt8195, mt1234 etc) from it.
> 
> Sure I get your point about bindings - but IMO those multi-purpose checks make the
> code robust, and will avoid exposure of random memory locations (and/or produce
> undefined behavior) in the event that the compatible string is shorter than needed.
> 
>>> +
>>> +    return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
>>> +                  (int)strlen("mtXXXX"), soc, scp_fw_file);

I would have expected that there exists a function to extract a substring, but I 
didn't find any. Anyway, I think instead of hardcode the value we should search 
for '-' or use the remaining string as a whole. That would also fix the issue of 
a too short compatible string.

>>> +}
>>> +
>>>   static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>>>                         struct mtk_scp_of_cluster *scp_cluster,
>>> -                      const struct mtk_scp_of_data *of_data)
>>> +                      const struct mtk_scp_of_data *of_data,
>>> +                      int core_id)
>>>   {
>>>       struct device *dev = &pdev->dev;
>>>       struct device_node *np = dev->of_node;
>>>       struct mtk_scp *scp;
>>>       struct rproc *rproc;
>>>       struct resource *res;
>>> -    const char *fw_name = "scp.img";
>>> +    const char *fw_name;
>>>       int ret, i;
>>>       const struct mtk_scp_sizes_data *scp_sizes;
>>>       ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>>> -    if (ret < 0 && ret != -EINVAL)
>>> -        return ERR_PTR(ret);
>>> +    if (ret) {
>>> +        fw_name = scp_get_default_fw_path(dev, core_id);
>>
>> Wouldn't it make more sense to encapsulate the whole fw_name retrival in one 
>> function, e.g. scp_get_fw_path.
>>
> 
> Sorry, not a fan of that, I don't see the actual benefit, as in, (imo) it doesn't
> improve readability and it doesn't remove any duplication (as it's called only once
> in one single place).
> 
> But of course, I'm open to understand if I'm missing any point :-)
> 

My point would be to encapsulate the logic how to determine the fw_name in one 
function call. I think it improves readability because you look at the code and 
can say "OK here they somehow determine the fw_name" and only have to look into 
the function if you really care and skip over it otherwise.

Regards,
Matthias

> Cheers,
> Angelo
> 
>>> +        if (IS_ERR(fw_name)) {
>>> +            dev_err(dev, "Cannot get firmware path: %ld\n", PTR_ERR(fw_name));
>>> +            return ERR_CAST(fw_name);
>>> +        }
>>> +    }
>>>       rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
>>>       if (!rproc) {
>>> @@ -1212,7 +1264,7 @@ static int scp_add_single_core(struct platform_device 
>>> *pdev,
>>>       struct mtk_scp *scp;
>>>       int ret;
>>> -    scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
>>> +    scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev), -1);
>>>       if (IS_ERR(scp))
>>>           return PTR_ERR(scp);
>>> @@ -1259,7 +1311,7 @@ static int scp_add_multi_core(struct platform_device 
>>> *pdev,
>>>               goto init_fail;
>>>           }
>>> -        scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
>>> +        scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id], 
>>> core_id);
>>>           put_device(&cpdev->dev);
>>>           if (IS_ERR(scp)) {
>>>               ret = PTR_ERR(scp);
>>
> 
> 


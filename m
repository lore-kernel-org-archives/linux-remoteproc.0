Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE29223336;
	Fri, 12 Sep 2025 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757666732; cv=none; b=nu22PMnYOO96EQaQCjhiD/KMEwtvhOCzGq+nDr4vIREzMOLXOt4EVIgHJ/3yHVS7B7FqLHY65ZbpZGQsd0KeIBV1s9UfjFdHBypq3GDe8zOCKvDHFLrXxZ+BuOUhpfn8DUTItLSEQYLaL57I5mZIBHgrj/OgAYEG9F1FAv3YBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757666732; c=relaxed/simple;
	bh=++xvC23WhHonK4sqNZlcsGHCfTMQ0DzxYYwMOSCnYoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LGxNvDrPRG9qXVYugy8/B5OfwHI7WaDVzwXofvj295WWS7J44kowBb3cqmDZ/Rit2aoLsMrPweQX16mBmd7I/XbHnL+ZpWRXpll6ji1gvm65bwMzapUIXjzV/h80SfiP5Dn2fzJpPVajt+g90OwXZJswedm9rJkGHO92iN8gty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=edj1OScb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="edj1OScb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757666728;
	bh=++xvC23WhHonK4sqNZlcsGHCfTMQ0DzxYYwMOSCnYoU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=edj1OScbrKjpPVqztmCVz9kh91znYHmnqwOnX4GXTDDv1rtZIK728AZjneSp3elzY
	 Q7faCe9qJ2iiDgBK2Y8ie1+DtY0ffIDT82bLf4glmBgbN6B4YfNWivCtP5HyyYqO3p
	 3XisioVSWwPoQAO3fPmGoexGmx9Pdi2yJf1JnTYw7uHIKrqwa5ZDkUO17yYxITw5fa
	 0Tui/EJ8SPEeBpZ239R/oexYToNreeCKobYAq5jCftly1XQ8CdbDkzA9l0QCdUe5kk
	 VzHljIsbAwGjt2YvnnVipRTIeWsQ7nwvL1QXdSgGqSl0XSI8FQdAITNLxaqKKR9pCE
	 AMcHm6kBRF2og==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0093717E04D6;
	Fri, 12 Sep 2025 10:45:27 +0200 (CEST)
Message-ID: <9fafe6a4-e30b-4ea8-a85c-2e66ebd34040@collabora.com>
Date: Fri, 12 Sep 2025 10:45:27 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mtk_scp: Construct FW path if firmware-name
 not present
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-remoteproc@vger.kernel.org
Cc: arnd@arndb.de, andersson@kernel.org, mathieu.poirier@linaro.org,
 wenst@chromium.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250911140043.190801-1-angelogioacchino.delregno@collabora.com>
 <6f60bb97-86fc-4cda-a373-a991547bbd77@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6f60bb97-86fc-4cda-a373-a991547bbd77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 12/09/25 09:01, Matthias Brugger ha scritto:
> 
> 
> On 11/09/2025 16:00, AngeloGioacchino Del Regno wrote:
>> After a reply on the mailing lists [1] it emerged that the DT
>> property "firmware-name" should not be relied on because of
>> possible issues with firmware versions.
>> For MediaTek SCP, there has never been any firmware version vs
>> driver version desync issue but, regardless, the firmwares are
>> always using the same name and they're always located in a path
>> with a specific pattern.
>>
>> Instead of unconditionally always relying on the firmware-name
>> devicetree property to get a path to the SCP FW file, drivers
>> should construct a name based on what firmware it knows and
>> what hardware it is running on.
>>
>> In order to do that, add a `scp_get_default_fw_path()` function
>> that constructs the path and filename based on two of the infos
>> that the driver can get:
>>   1. The compatible string with the highest priority (so, the
>>      first one at index 0); and
>>   2. The type of SCP HW - single-core or multi-core.
>>
>> This means that the default firmware path is generated as:
>>   - Single core SCP: mediatek/(soc_model)/scp.img
>>     for example:     mediatek/mt8183/scp.img;
>>
>>   - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>>     for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>>                      mediatek/mt8188/scp_c1.img for Core 1.
>>
> 
> As we inventing a naming scheme here: if we decide that signle core FW is calle 
> scp_c0.img we can get rid of some code.
> 

Ohey!

No, well, we're not inventing a naming scheme... if you check in linux-firmware
and in the current devicetrees, you'll see that the path adheres to what I wrote.

As in - all of the single core SCP always had the firmware in path
mediatek/mtXXXX/scp.img - and the dual core SCP has two firmwares.

The dual core one is a bit special in that the two cores are *almost* (but not
fully) independent from each other (not entirely relevant to this discussion tho)
and can load one firmware per core.

In short - in upstream, the only naming that we're inventing is the multicore SCP,
but we're simply keeping the same name for the singlecore ones.

Even for multicore, I'm not really inventing that out of the blue - MediaTek are
using that naming in downstream, so I'm just copying that.

Btw... I really don't want to change the single core FW name to "scp_c0.img"
because my plan is to get this merged and then cleanup the devicetrees for all
MTK machines to *remove* the firmware-name property from the SCP node(s).

firmware-name support in this driver is retained only for retrocompatibility
with old DTs (and perhaps "very special" devices needing "very special" firmwares,
of which none exist right now and hopefully we'll never see anything like that in
the future).

>> Note that the generated firmware path is being used only if the
>> "firmware-name" devicetree property is not present in the SCP
>> node or in the SCP Core node(s).
>>
>> [1 - Reply regarding firmware-name property]
>> Link: https://lore.kernel.org/all/7e8718b0-df78-44a6- 
>> a102-89529d6abcce@app.fastmail.com/
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/remoteproc/mtk_scp.c | 64 ++++++++++++++++++++++++++++++++----
>>   1 file changed, 58 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
>> index 8206a1766481..80fcb4b053b3 100644
>> --- a/drivers/remoteproc/mtk_scp.c
>> +++ b/drivers/remoteproc/mtk_scp.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/remoteproc.h>
>>   #include <linux/remoteproc/mtk_scp.h>
>>   #include <linux/rpmsg/mtk_rpmsg.h>
>> +#include <linux/string.h>
>>   #include "mtk_common.h"
>>   #include "remoteproc_internal.h"
>> @@ -1093,22 +1094,73 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>>       }
>>   }
>> +/**
>> + * scp_get_default_fw_path() - Get default SCP firmware path
>> + * @dev:     SCP Device
>> + * @core_id: SCP Core number
>> + *
>> + * This function generates a path based on the following format:
>> + *     mediatek/(soc_model)/scp(_cX).img; for multi-core or
>> + *     mediatek/(soc_model)/scp.img for single core SCP HW
>> + *
>> + * Return: A devm allocated string containing the full path to
>> + *         a SCP firmware or an error pointer
>> + */
>> +static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>> +{
>> +    struct device_node *np = core_id < 0 ? dev->of_node : dev->parent->of_node;
>> +    char scp_fw_file[7] = "scp_cX";
> 
> We provide a string that we later overwrite. I'd prefer to have just the 
> reservation without any 'artificial' string in it.
> 

Yeah, this one is a leftover that I forgot to cleanup. I fully agree with you.

Will change that in v2.

>> +    const char *compatible, *soc;
>> +    int ret;
>> +
>> +    /* Use only the first compatible string */
>> +    ret = of_property_read_string_index(np, "compatible", 0, &compatible);
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
>> +    /* If the compatible string's length is implausible bail out early */
>> +    if (strlen(compatible) < strlen("mediatek,mtXXXX-scp"))
> 
> Seems like a double check of compatible. Why is dt-bindings for that not enough?
> 

It's more than that... (check below)

>> +        return ERR_PTR(-EINVAL);
>> +
>> +    /* If the compatible string starts with "mediatek,mt" assume that it's ok */
>> +    if (!str_has_prefix(compatible, "mediatek,mt"))
> 
> Same here.
> 

....and it's because.... (check below)

>> +        return ERR_PTR(-EINVAL);
>> +
>> +    if (core_id >= 0)
>> +        ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
>> +    else
>> +        ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
>> +    if (ret <= 0)
>> +        return ERR_PTR(ret);
>> +
>> +    soc = &compatible[strlen("mediatek,")];

...I'd otherwise anyway have to check here, as this is a pointer to the middle of
the compatible string, used below to extract "mtXXXX" (mt8195, mt1234 etc) from it.

Sure I get your point about bindings - but IMO those multi-purpose checks make the
code robust, and will avoid exposure of random memory locations (and/or produce
undefined behavior) in the event that the compatible string is shorter than needed.

>> +
>> +    return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
>> +                  (int)strlen("mtXXXX"), soc, scp_fw_file);
>> +}
>> +
>>   static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>>                         struct mtk_scp_of_cluster *scp_cluster,
>> -                      const struct mtk_scp_of_data *of_data)
>> +                      const struct mtk_scp_of_data *of_data,
>> +                      int core_id)
>>   {
>>       struct device *dev = &pdev->dev;
>>       struct device_node *np = dev->of_node;
>>       struct mtk_scp *scp;
>>       struct rproc *rproc;
>>       struct resource *res;
>> -    const char *fw_name = "scp.img";
>> +    const char *fw_name;
>>       int ret, i;
>>       const struct mtk_scp_sizes_data *scp_sizes;
>>       ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>> -    if (ret < 0 && ret != -EINVAL)
>> -        return ERR_PTR(ret);
>> +    if (ret) {
>> +        fw_name = scp_get_default_fw_path(dev, core_id);
> 
> Wouldn't it make more sense to encapsulate the whole fw_name retrival in one 
> function, e.g. scp_get_fw_path.
> 

Sorry, not a fan of that, I don't see the actual benefit, as in, (imo) it doesn't
improve readability and it doesn't remove any duplication (as it's called only once
in one single place).

But of course, I'm open to understand if I'm missing any point :-)

Cheers,
Angelo

>> +        if (IS_ERR(fw_name)) {
>> +            dev_err(dev, "Cannot get firmware path: %ld\n", PTR_ERR(fw_name));
>> +            return ERR_CAST(fw_name);
>> +        }
>> +    }
>>       rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
>>       if (!rproc) {
>> @@ -1212,7 +1264,7 @@ static int scp_add_single_core(struct platform_device *pdev,
>>       struct mtk_scp *scp;
>>       int ret;
>> -    scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
>> +    scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev), -1);
>>       if (IS_ERR(scp))
>>           return PTR_ERR(scp);
>> @@ -1259,7 +1311,7 @@ static int scp_add_multi_core(struct platform_device *pdev,
>>               goto init_fail;
>>           }
>> -        scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
>> +        scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id], 
>> core_id);
>>           put_device(&cpdev->dev);
>>           if (IS_ERR(scp)) {
>>               ret = PTR_ERR(scp);
> 



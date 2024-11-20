Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E3136E28;
	Wed, 20 Nov 2024 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732119050; cv=none; b=oMEFn2WTRTa3RPaeSkC4Owis1zf5g6R+QvAr4H8oCtPUo9hgxAJPnhBgg2MU5/QE8Md0EvvFJOwR2oFSgYfmY+TtIdmfZv9BdvxS33k2pJzH7OSrIGf3p0eITZRA8yR6aoGgnF4BRDSOtPAgbgT2RuiOKdvZZhIHqPuIBLhyX7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732119050; c=relaxed/simple;
	bh=8uw2UiPOihw4XekbjhrmWMSSKE7U6wCvWE4g5JpeIXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KzP6eU1/2oTymWiOc6dC1qA2OJQIzX6IR+cLif8zoPDBS7dxXDDXzFkSzPXEVOuDzdQ9zXvZVc8knuUrb4m2gI+CBp1+orT2WlCyz4B1CY3iQ7doDUt28VgdMNxCtHRp5qbvcqipLzbs8uEZVoKpxFp6G3ehaBlx1dqPRj6MYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dSAp+LbU; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dSAp+LbU"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKElasO023498;
	Wed, 20 Nov 2024 17:10:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	9eQlFCNQ6D5bVENGrHZ2ywRcIPNqAYRplKluLwt9MvI=; b=dSAp+LbUurtI1+Z5
	wefQV53HDmnwQyoh4GCMTbLtPoQbAoAooxuE34RZZYGrriBNEPlYMJBPnm8oM2+T
	p7PAEFq8f0lCFmUAGFyXT7KCDpTpu+Ty+0z9UACqahBgC1SRO3y+m2UgZ+5SkIzz
	IjG1SYs55WeHK2co7HUQYX1k5Le/J0OcMRJAk5zSyfVd284GfkjGGytaaMy+YDo+
	q9BB+mx6Z686At5E8UG6D/fg1eAFVcud6Mt13fnk7czNVq55dgbUckWBq+LuxmA1
	qQ+NNj6IUAUeTHta0dFX9SKg5fvUt6KF31QJ3JglpKJsIO0ZAQN42xAxjdOs9CRe
	LydB5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqf2fvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 17:10:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8228340047;
	Wed, 20 Nov 2024 17:08:59 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF9D42928BC;
	Wed, 20 Nov 2024 17:08:09 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 20 Nov
 2024 17:08:09 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 20 Nov
 2024 17:08:09 +0100
Message-ID: <b3fd3231-3b09-4eef-9ea6-c11b54c712c4@foss.st.com>
Date: Wed, 20 Nov 2024 17:08:08 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/7] remoteproc: Introduce release_fw optional
 operation
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
 <Zzt+7NBdNjyzWZIb@p14s> <0d9075cd-68c2-49ec-9b9c-4315aa8c8517@foss.st.com>
 <CANLsYkxvTuLv8Omw-UeyPaA9g9QokmtMaMYD0eoUPo20wUuONQ@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <CANLsYkxvTuLv8Omw-UeyPaA9g9QokmtMaMYD0eoUPo20wUuONQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01



On 11/19/24 21:38, Mathieu Poirier wrote:
> On Tue, 19 Nov 2024 at 11:14, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>> Hello Mathieu,
>>
>> On 11/18/24 18:52, Mathieu Poirier wrote:
>>> On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
>>>> This patch updates the rproc_ops struct to include an optional
>>>> release_fw function.
>>>>
>>>> The release_fw ops is responsible for releasing the remote processor
>>>> firmware image. The ops is called in the following cases:
>>>>
>>>>  - An error occurs in rproc_start() between the loading of the segments and
>>>>       the start of the remote processor.
>>>>  - after stopping the remote processor.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>> Updates from version V11:
>>>> - fix typo in @release_fw comment
>>>> ---
>>>>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>>>>  include/linux/remoteproc.h           | 3 +++
>>>>  2 files changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>> index 7694817f25d4..46863e1ca307 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>>>>
>>>>  static void rproc_release_fw(struct rproc *rproc)
>>>>  {
>>>> +    if (rproc->ops->release_fw)
>>>> +            rproc->ops->release_fw(rproc);
>>>> +
>>>>      /* Free the copy of the resource table */
>>>>      kfree(rproc->cached_table);
>>>>      rproc->cached_table = NULL;
>>>> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>>>  unprepare_subdevices:
>>>>      rproc_unprepare_subdevices(rproc);
>>>>  reset_table_ptr:
>>>> +    if (rproc->ops->release_fw)
>>>> +            rproc->ops->release_fw(rproc);
>>>>      rproc->table_ptr = rproc->cached_table;
>>>
>>> I suggest the following:
>>>
>>> 1) Create two new functions, i.e rproc_load_fw() and rproc_release_fw().  The
>>> only thing those would do is call rproc->ops->load_fw() and
>>> rproc->ops->release_fw(), if they are present.  When a TEE interface is
>>> available, ->load_fw() and ->release_fw() become rproc_tee_load_fw() and
>>> rproc_tee_release_fw().
>>
>>
>> I'm wondering if it should be ->preload_fw() instead of ->load_fw() ops, as the
>> ->load() op already exists.
>>
> 
> I agree that ->load() and ->load_fw() will lead to confusion.  I would
> support ->preload_fw() but there is no obvious antonyme.
> 
> Since we already have rproc_ops::prepare() and rproc_prepare_device()
> I suggest rproc_ops::prepare_fw() and rproc_prepare_fw().  The
> corollary would be rproc_ops::unprepare_fw() and rproc_unprepare_fm().
> That said, I'm open to other ideas should you be interested in finding
> other alternatives.
> 


1) Using ops::prepare_fw/unprepare_fw:
My concern is that it could also lead to confusion as we would load the firmware
on ops::prepare_fw and do nothing on ops::load(). That would not match with the
ops action. look to me that in this option, ops::load() must be kept as
mandatory ops for consistence.


2) Using ops::preload_fw:
This seems to better reflect the use case. Concerning the antonym choice , could
we consider that ops::release_fw() is the antonym of both ops;;preload_fw and
ops::load?
some other antonym proposal:
 - unload_fw
 - postunload_fw


3) Other alternatives:

3-a) using ops::rproc_prepare/unprepare_device.
Same concern that prepare_fw/unprepare_fw
another drawbackis that rproc_tee_load_fw() would be not directly mapped to an
rproc ops but platform
driver should need to call rproc_tee_load_fw() into its ops::prepare() function
(a.e stm32_rproc_prepare).


3-b) Another alternative I can see is the one I proposed in version 3 [1]. The
principle was to keep existing ops but propose an alternative boot sequence.
Perhaps a backup solution is to reanalyze this option if no other is suitable.

[1]
https://lore.kernel.org/lkml/8af59b01-53cf-4fc4-9946-6c630fb7b38e@quicinc.com/T/

Please just tell/confirm me your prefered solution that I propose it in next
revision.

Regards,
Arnaud

>>>
>>> 2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
>>> call to rproc_fw_boot() fails, call rproc_release_fw().
>>>
>>> 3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
>>> before rproc_start() and call rproc_release_fw() if rproc_start() fails.
>>
>>
>> I implemented this and I'm currently testing it.
>> Thise second part requires a few adjustments to work. The ->load() ops needs to
>> becomes optional to not be called if the "->preload_fw()" is used.
>>
>> For that, I propose to return 0 in rproc_load_segments if rproc->ops->load is
>> NULL and compensate by checking that at least "->preload_fw()" or ->load() is
>> non-null in rproc_alloc_ops.
>>
> 
> I agree.
> 
>> Thanks,
>> Arnaud
>>
>>
>>>
>>> 4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
>>> in rproc_load_fw().
>>>
>>> 5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
>>> The former is already called in rproc_shutdown() so we are good in that front.
>>>
>>> With the above the cached_table management within the core remains the same and
>>> we can get rid of patch 3.7.
>>
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>>
>>>>      return ret;
>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>> index 2e0ddcb2d792..08e0187a84d9 100644
>>>> --- a/include/linux/remoteproc.h
>>>> +++ b/include/linux/remoteproc.h
>>>> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>>>>   * @panic:  optional callback to react to system panic, core will delay
>>>>   *          panic at least the returned number of milliseconds
>>>>   * @coredump:         collect firmware dump after the subsystem is shutdown
>>>> + * @release_fw:     optional function to release the firmware image from ROM memories.
>>>> + *          This function is called after stopping the remote processor or in case of an error
>>>>   */
>>>>  struct rproc_ops {
>>>>      int (*prepare)(struct rproc *rproc);
>>>> @@ -403,6 +405,7 @@ struct rproc_ops {
>>>>      u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>>>>      unsigned long (*panic)(struct rproc *rproc);
>>>>      void (*coredump)(struct rproc *rproc);
>>>> +    void (*release_fw)(struct rproc *rproc);
>>>>  };
>>>>
>>>>  /**
>>>> --
>>>> 2.25.1
>>>>

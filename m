Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45438210184;
	Wed, 16 Oct 2024 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729097017; cv=none; b=j2DR7eXyO7L5U5hgF16JotfCefPqgINRaocWXSTuDYFfUi9Ig31BUshkB0GGK2Q4/JsOuqRH13GYpRFaewyrHYwgLqVO1Tn1yMiY1LjPAqO7jMWTYG+i2ROkSnxvJYePE/yVRThplqbUbv0t+ApXZEtW9yzX9fwYHDFrHHPY4r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729097017; c=relaxed/simple;
	bh=3yW0jPoqpuLtTF7vOk6MT6y6MZ5px9RVH+Nhky2xbog=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gFtuQlh3x1evsXPKakKYPdsnQNN5S0NRHjfh7ns+FLiRiQ36GHj1waEZVseDuMA5ErseR+3UGZPkDxZCPbc0QpF8Q0ZNJFU316Dj0aJqXhZur8bNFPn3jgbyMu1sbQKVY0fKTQWrcU0h5SrWFeJ5ItZYPRCVtn3h5sJp62PDuRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ay5FHM5M; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ay5FHM5M"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49GGhSQq050198;
	Wed, 16 Oct 2024 11:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729097008;
	bh=PXQVfKsvfKxcsT9u+G0+jDHJ/QyMGLSljkiiaGvU1iU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ay5FHM5MBRhS1ahfVL9EN7SFsYgciApG4WEga///RZwPYutO9yh/i5r5NcLSCKNe7
	 5tPBW8nu8aLOHA7RkHgtzBQi7PV2BeA5Vdk1//cSnJDTdwrjTN0qqNez8GXPGA4JIi
	 O3BuZb0pCUlMM8ExoCHR6PqguwcK9MHYLuFK6tdw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49GGhSW2108785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Oct 2024 11:43:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Oct 2024 11:43:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Oct 2024 11:43:27 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GGhRVM110543;
	Wed, 16 Oct 2024 11:43:27 -0500
Message-ID: <ca621caa-0b6c-47c7-b602-3db6fc5be839@ti.com>
Date: Wed, 16 Oct 2024 11:43:27 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox, remoteproc: k3-m4+: fix compile testing
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Martyn Welch <martyn.welch@collabora.com>,
        Hari Nagalla <hnagalla@ti.com>, Jassi Brar <jassisinghbrar@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241007132441.2732215-1-arnd@kernel.org>
 <4d8a9786-ee4b-43b8-9207-e048c66349fe@ti.com> <Zw/bIItwk0jeqKoR@p14s>
 <07e5b001-b251-4f4f-8ce9-56b43032b5c4@ti.com> <Zw/jkpnGXW6ez56o@p14s>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <Zw/jkpnGXW6ez56o@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/16/24 11:02 AM, Mathieu Poirier wrote:
> On Wed, Oct 16, 2024 at 10:37:35AM -0500, Andrew Davis wrote:
>> On 10/16/24 10:26 AM, Mathieu Poirier wrote:
>>> On Mon, Oct 14, 2024 at 09:56:11AM -0500, Andrew Davis wrote:
>>>> On 10/7/24 8:23 AM, Arnd Bergmann wrote:
>>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>>
>>>>> The k3-m4 remoteproc driver was merged with incorrect dependencies.
>>>>> Despite multiple people trying to fix this, the version 6.12-rc2
>>>>> remains broken and causes a build failure with CONFIG_TI_SCI_PROTOCOL=m
>>>>> when the driver is built-in.
>>>>>
>>>>> arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in function `k3_m4_rproc_probe':
>>>>> ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined reference to `devm_ti_sci_get_by_phandle'
>>>>>
>>>>> Fix the dependency again to make it work in all configurations.
>>>>> The 'select OMAP2PLUS_MBOX' no longer matches what the other drivers
>>>>> dependencies. The link failure can be avoided with a simple 'depends
>>>>> do, so turn that into the same 'depends' to ensure we get no circular
>>>>> on TI_SCI_PROTOCOL', but the extra COMPILE_TEST alternative is what
>>>>> we use elsehwere. On the other hand, building for OMAP2PLUS makes
>>>>> no sense since the hardware only exists on K3.
>>>>>
>>>>> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
>>>>> Fixes: ba0c0cb56f22 ("remoteproc: k3-m4: use the proper dependencies")
>>>>> Fixes: 54595f2807d2 ("mailbox, remoteproc: omap2+: fix compile testing")
>>>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>>>> ---
>>>>>     drivers/remoteproc/Kconfig | 6 +++---
>>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>>> index 955e4e38477e..62f8548fb46a 100644
>>>>> --- a/drivers/remoteproc/Kconfig
>>>>> +++ b/drivers/remoteproc/Kconfig
>>>>> @@ -341,9 +341,9 @@ config TI_K3_DSP_REMOTEPROC
>>>>>     config TI_K3_M4_REMOTEPROC
>>>>>     	tristate "TI K3 M4 remoteproc support"
>>>>> -	depends on ARCH_OMAP2PLUS || ARCH_K3
>>>>> -	select MAILBOX
>>>>> -	select OMAP2PLUS_MBOX
>>>>> +	depends on ARCH_K3 || COMPILE_TEST
>>>>> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
>>>>
>>>> This line is odd. IMHO "COMPILE_TEST" should only be added to ARCH_*
>>>> dependencies, as often only one ARCH can be selected which prevents
>>>> compile testing drivers with various multiple architecture deps in
>>>> one compile test.
>>>>
>>>> Normal dependencies, on the other hand, can simply be enabled if one
>>>> wants to compile test its dependent drivers. In this case, TI_SCI_PROTOCOL
>>>> cannot be enabled as it has a dependency up the chain that doesn't
>>>> allow selecting when not on a TI platform. We can fix that as I posted
>>>> here[0]. With that fix in, this line can be simply become:
>>>>
>>>> depends on TI_SCI_PROTOCOL
>>>
>>>   From the above and the follow-on conversation with Nishanth, should I understand
>>> you are working on a patchset to address this issue?  If not I will apply Arnd's
>>> patch.  People are sending different fix [1] - the issue needs to be addressed
>>> well before the end of the cycle.
>>>
>>
>> This is a bit complex as it touches multiple subsystems. You should take Arnd's
>> patch. This will fix this for M4, I will then add a follow on patch doing the same
>> for the other two remoteproc drivers (DSP and R5).
>>
>> When my series here[0] goes in I will then send a final patch removing the depends
>> TI_SCI_PROTOCOL=n oddness from all 3 drivers. This final step does not need to happen
>> this cycle though, only the first two steps are needed to prevent any further compile
>> test issues.
>>
> 
> I have applied Arnd's patch.
> 

Follow up series sent: https://lore.kernel.org/lkml/20241016164141.93401-1-afd@ti.com/

Andrew

>> Andrew
>>
>> [0] https://lore.kernel.org/lkml/20241015213322.2649011-1-afd@ti.com/
>>
>>> [1]. https://lore.kernel.org/linux-arm-kernel/20241016013922.1392290-1-zengheng4@huawei.com/T/
>>>
>>>>
>>>> Andrew
>>>>
>>>> [0] https://lore.kernel.org/lkml/20241014144821.15094-1-afd@ti.com/
>>>>
>>>>> +	depends on OMAP2PLUS_MBOX
>>>>>     	help
>>>>>     	  Say m here to support TI's M4 remote processor subsystems
>>>>>     	  on various TI K3 family of SoCs through the remote processor

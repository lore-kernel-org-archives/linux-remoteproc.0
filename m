Return-Path: <SRS0=Vkxm=5Z=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D04C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 18:48:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 644CC20757
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 18:48:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RZ6kN0zS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgDISso (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Apr 2020 14:48:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60134 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDISso (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 14:48:44 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 039ImbOF078380;
        Thu, 9 Apr 2020 13:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586458117;
        bh=diXm0hCzdJ5gSjwD8grkUCdZOduFBzpxdSIHY2srCvQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RZ6kN0zS8yZPZNQa99lyG/JJn5RBO8voYl5CV26jB6n0lfBB2qS8D0eror8viOwWZ
         kEUHCCNK6CP3pJdi/aYajM1nkPiKiOq5jLj/8gv9mcZSNMbMtwE3hYLDc1pzT4SDOq
         IQgHKilD4KtTc2dRHNJAiMKZMRsdUA7Nrb3PaQPw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 039ImbpE102530
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Apr 2020 13:48:37 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Apr
 2020 13:48:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Apr 2020 13:48:37 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 039Ima6P114124;
        Thu, 9 Apr 2020 13:48:36 -0500
Subject: Re: [PATCH v2 09/17] remoteproc: Call the right core function based
 on synchronisation state
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <loic.pallardy@st.com>, <peng.fan@nxp.com>,
        <arnaud.pouliquen@st.com>, <fabien.dessenne@st.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-10-mathieu.poirier@linaro.org>
 <006ab94d-daf3-0e28-7098-982d473c00d5@ti.com> <20200402201642.GA9160@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <b3d01aec-280f-4ca1-e725-affbeff8def0@ti.com>
Date:   Thu, 9 Apr 2020 13:48:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200402201642.GA9160@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200409184836.nQPTtF8rHvNf8trVrhD3VWzpccIDyY6fTTDNV_EZPzI@z>

On 4/2/20 3:16 PM, Mathieu Poirier wrote:
> On Tue, Mar 31, 2020 at 10:10:50AM -0500, Suman Anna wrote:
>> Hi Mathieu,
>>
>> On 3/24/20 4:45 PM, Mathieu Poirier wrote:
>>> Call the right core function based on whether we should synchronise
>>> with an MCU or boot it from scratch.
>>
>> This patch does generate some checkpatch warnings.
> 
> Right, checkpatch is complaining but other than duplicating the same code for
> all functions, I don't see another way to do this.
> 
>>
>>>
>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> ---
>>>  drivers/remoteproc/remoteproc_internal.h | 36 +++++++++++-------------
>>>  1 file changed, 17 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>> index 73ea32df0156..5f711ceb97ba 100644
>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>> @@ -106,38 +106,41 @@ static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
>>>  	}
>>>  }
>>>  
>>> +#define RPROC_OPS_HELPER(__operation, ...)				\
>>> +	do {								\
>>> +		if (rproc_sync_with_mcu(rproc)) {			\
>>
>> So this does make the logic a bit convoluted, since you have three
>> different flags for rproc_sync_with_mcu, and you apply them in common
>> for all the ops. This is what I meant in my comment on Patch 1.
> 
> There is indeed 3 different flags but they are only valid in a specific state.
> What "ops" are you referring to here?

All the rproc_ops callbacks, since only a subset of each might be valid
at each of the three different states. Granted this provides the maximum
flexibility for platform drivers, but it's a bit convoluted. Kinda goes
with Loic's comment on Patch 7 [1].

[1] https://patchwork.kernel.org/comment/23249975/


I'm also not sure about the comment in
> "patch 1" - which one would that be and how does it relate to the current block
> of code.  Apologies, I need more clarifications.  

I meant the following comment,
"And I am wondering if it is actually better to introduce the sync state
to check against here, rather than using the stored sync state and
return. The current way makes it confusing to read the state machine."

regards
Suman

> 
>>
>>> +			if (!rproc->sync_ops ||				\
>>> +			    !rproc->sync_ops->__operation)		\
>>> +				return 0;				\
>>> +			return rproc->sync_ops->__operation(__VA_ARGS__); \
>>
>> Use the same semantics as the regular ops instead of two return
>> statements, the code should fallback to the common return 0 after the
>> RPROC_OPS_HELPER when neither of them are present.
> 
> Yes the tests are exactly the same, no reason to proceed differently.
> 
>>
>> regards
>> Suman
>>
>>> +		} else if (rproc->ops && rproc->ops->__operation)	\
>>> +			return rproc->ops->__operation(__VA_ARGS__);	\
>>> +	} while (0)							\
>>> +
>>>  static inline
>>>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>>>  {
>>> -	if (rproc->ops->sanity_check)
>>> -		return rproc->ops->sanity_check(rproc, fw);
>>> -
>>> +	RPROC_OPS_HELPER(sanity_check, rproc, fw);
>>>  	return 0;
>>>  }
>>>  
>>>  static inline
>>>  u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>>>  {
>>> -	if (rproc->ops->get_boot_addr)
>>> -		return rproc->ops->get_boot_addr(rproc, fw);
>>> -
>>> +	RPROC_OPS_HELPER(get_boot_addr, rproc, fw);
>>>  	return 0;
>>>  }
>>>  
>>>  static inline
>>>  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
>>>  {
>>> -	if (rproc->ops->load)
>>> -		return rproc->ops->load(rproc, fw);
>>> -
>>> +	RPROC_OPS_HELPER(load, rproc, fw);
>>>  	return -EINVAL;
>>>  }
>>>  
>>>  static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>>>  {
>>> -	if (rproc->ops->parse_fw)
>>> -		return rproc->ops->parse_fw(rproc, fw);
>>> -
>>> +	RPROC_OPS_HELPER(parse_fw, rproc, fw);
>>>  	return 0;
>>>  }
>>>  
>>> @@ -145,10 +148,7 @@ static inline
>>>  int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
>>>  		     int avail)
>>>  {
>>> -	if (rproc->ops->handle_rsc)
>>> -		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
>>> -					      avail);
>>> -
>>> +	RPROC_OPS_HELPER(handle_rsc, rproc, rsc_type, rsc, offset, avail);
>>>  	return RSC_IGNORED;
>>>  }
>>>  
>>> @@ -156,9 +156,7 @@ static inline
>>>  struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
>>>  						   const struct firmware *fw)
>>>  {
>>> -	if (rproc->ops->find_loaded_rsc_table)
>>> -		return rproc->ops->find_loaded_rsc_table(rproc, fw);
>>> -
>>> +	RPROC_OPS_HELPER(find_loaded_rsc_table, rproc, fw);
>>>  	return NULL;
>>>  }
>>>  
>>>
>>


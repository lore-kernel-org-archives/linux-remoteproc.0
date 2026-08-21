Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC8341169B;
	Fri, 21 Aug 2026 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294170; cv=none; b=dumhqS1V5KeOAZLYMMSyo56mk9MUWKfDUQL8BNVAFP+bFqMJQv4KwwZ9Z6qpGvzgym2AVQUe9cotBmnva7yOLkS7fQNz+c3//sVxUnC90pqNlLUWx150qP157arsdfdFNDr0BAsk37EF94fn1l3u+ShNtGeYocQDLZm2m6dERQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294170; c=relaxed/simple;
	bh=fWzhvxr4a/sLeJPe/1v2NF5fNebBN1hiMDIf/zflUEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZQ9X5KlpQi2awd4+XQxyiO7RnAN0sJ2RUt+bumQOuSmownwCWVEEzCOP5KKhzRzvtpSuaL/nwng2RR6zjlDMqbI8WG2IE2WeocCkhzdxz+IFF/GV2dlyyboMdfiN8CSnpGabZPjgSOp5oaDdQL0lKFwNNLRCDqI/SblD30oFyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Kv6D9hrV; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Kv6D9hrV"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hR9Wz1T2Wz69S2;
	Fri, 21 Aug 2026 08:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787294079;
	bh=fWzhvxr4a/sLeJPe/1v2NF5fNebBN1hiMDIf/zflUEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kv6D9hrVcE3tlzweEpaFeqbL12Wunuz7tbgpAiOGwkkpguPK3N6sioxGtcdEQWd40
	 B4ofRsI6L/U8vXmHbyoqfY8Z81YThU+CDMslPhFs+UJn+xGYbz+Saiz0osxpGRoZZ9
	 40XBfZ7FSehAGA5+8KASM/+9jW6cQGUy7muhgTV1eKA4alMPEJ9tRjyuNy8gMkPO6A
	 OpikIkqiQcKNkMKllvqYnBLBkZYfvZ9kqMB0JeuHM2hDeCde6wfTz9QAUFzU3n67AG
	 IOoJRe9RM1P4icGUKh/885jgANtqszshPnR8i1E0VI9w42eEWxAUhpNdITLsOzONjB
	 ElOBd6VNT5OHQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hR9VV6CK4z4yWc;
	Fri, 21 Aug 2026 08:33:22 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hR9VT3rfvz8sch;
	Fri, 21 Aug 2026 08:33:21 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 7B9D35F9C0;
	Fri, 21 Aug 2026 08:33:20 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <943d1db3-f117-4e9c-94db-7221b47d9d29@leemhuis.info>
Date: Fri, 21 Aug 2026 08:33:19 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom PAS TZ API migration breaks GPU and modem on
 TrustZone without PAS (sc7180 trogdor)
To: Konrad Dybcio <konradybcio@gmail.com>,
 Paul Hollinsky <phollinsky@holtechnik.com>, sumit.garg@oss.qualcomm.com,
 andersson@kernel.org
Cc: mathieu.poirier@linaro.org, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, akhilpo@oss.qualcomm.com,
 konradybcio@kernel.org, mukesh.ojha@oss.qualcomm.com,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20260808034716.58888-1-phollinsky@holtechnik.com>
 <b63e93e4-2f4c-4cad-b726-e1b0565379d7@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <b63e93e4-2f4c-4cad-b726-e1b0565379d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178729400123.2293361.5180616562923228567@mxe9fb.netcup.net>
X-NC-CID: mdasp+gq17ABdqs7sDaa4dURyEqNXzgIFUK85nSdbZpvVCs/raw=

On 8/17/26 17:41, Konrad Dybcio wrote:
> On 8/8/26 5:47 AM, Paul Hollinsky wrote:
>> Two commits from the "firmware: qcom: Add OP-TEE PAS service support"
>> series break the GPU and the modem on SC7180 Chromebooks (trogdor):
>>
>>   f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs")
>>   0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs")
>>
>> Both are in linux-next as of next-20260805 and neither is in a released
>> kernel yet, so there is still time to fix this before v7.3.
> 
> First of all, thank you for the amazingly thorough write-up. I've been on
> holiday so I couldn't look into it quicker.
> 
> [...]
> 
>> Suggested fix, drm/msm
>> ======================
>>
>> Given the above, I think the right fix is to move the availability check
>> behind the DT discovery rather than restore the SCM check. Boards with no
>> zap-shader node then never consult PAS at all, and boards that do have one
>> keep the qcom_pas_is_available() gate the original patch was going for:
>>
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -52,6 +52,12 @@
>>  		return -ENODEV;
>>  	}
>>  
>> +	/* We need PAS to be able to load the firmware */
>> +	if (!qcom_pas_is_available()) {
>> +		DRM_DEV_ERROR(dev, "PAS is not available\n");
>> +		return -EPROBE_DEFER;
>> +	}
>> +
>>  	ret = of_reserved_mem_region_to_resource(np, 0, &r);
>>  	if (ret) {
>>  		zap_available = false;
>> @@ -170,18 +176,11 @@
>>  int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>>  {
>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> -	struct platform_device *pdev = gpu->pdev;
>>  
>>  	/* Short cut if we determine the zap shader isn't available/needed */
>>  	if (!zap_available)
>>  		return -ENODEV;
>>  
>> -	/* We need PAS to be able to load the firmware */
>> -	if (!qcom_pas_is_available()) {
>> -		DRM_DEV_ERROR(&pdev->dev, "PAS is not available\n");
>> -		return -EPROBE_DEFER;
>> -	}
>> -
>>  	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>>  }
> 
> I believe this is the right fix

Just wondering: who will submit the proper fix to ideally fix this
before the culprit hits mainline (as Linus afaik does not like it much
if changes that are know to cause regressions in -next enter his tree)
-- or at least before -rc1 is out?

The culprit afaics was authored by Sumit Garg, whose last msg on Lore is
from 260731 -- which indicates a well deserved vacation or something
like that, so waiting for Sumit to act might take too long.

Ciao, Thorsten
>> I have this booting here: the GPU initialises and logs "Zap shader not
>> enabled - using SECVID_TRUST_CNTL instead", as it did before the
>> regression.
>>
>>
>> Suggested fix, remoteproc
>> =========================
>>
>> Keep an SCM gate for need_mem_protection and add a separate PAS gate for
>> need_pas_mem_setup. This is what I did to get it working:
>>
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -2079,7 +2079,16 @@ static int q6v5_probe(struct platform_device *pdev)
>>  	if (!desc)
>>  		return -EINVAL;
>>  
>> -	if (desc->need_mem_protection && !qcom_pas_is_available())
>> +	/*
>> +	 * Memory protection is done through qcom_scm_assign_mem(), which needs
>> +	 * SCM but not PAS. Only the memory setup path issues PAS calls, so
>> +	 * requiring PAS for every need_mem_protection platform prevents the
>> +	 * modem from probing at all on TZ firmware that offers no PAS.
>> +	 */
>> +	if (desc->need_mem_protection && !qcom_scm_is_available())
>> +		return -EPROBE_DEFER;
>> +
>> +	if (desc->need_pas_mem_setup && !qcom_pas_is_available())
>>  		return -EPROBE_DEFER;
> 
> And likewise this looks like the correct fix too, feel free to submit
> both as patches
> 
> [...]
> 
>> On the API contract
>> ===================
>>
>> For what it is worth, the kernel-doc for qcom_pas_is_available()
>> (qcom_pas.c:256) reads:
>>
>>   Note that it is mandatory for any PAS client to invoke this API.
>>   If it returns true then only any other PAS API can be invoked.
>>
>> That is a guard to call before invoking a PAS API, not a statement that a
>> driver touching TZ at all should refuse to probe without PAS.
>> ipa_main.c:764 consults it only on the loader path that genuinely needs
>> PAS rather than as a blanket probe precondition, which is the shape both
>> fixes above are aiming for.
> 
> This is a sloppiness that got through the transition patchset.. previously
> as you mentioned, qcom_scm_is_available() was a blanket "can we talk to TZ
> yet"?, and as the conversion happened, it was largely just find-and-replaced..
> 
> Konrad
> 


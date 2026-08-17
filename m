Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A1D441636
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981279; cv=none; b=kDSFwW8mjQXFxBwGOiopWuoTGABPg0daOhzwG10sIyXqdA33KNpP8/inN2RxXxl7YMYqyhxUtnL9E9pE0zf8e6nsXKidl7ZL+qjkMxtadC91ohqSG9WBlmWmuT88xcwhq0wM0GbvjqgbiFxRUY2/q8phT+Rfuj7ZCAWf+F3BZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981279; c=relaxed/simple;
	bh=k+dY+mjQTyIfFH9G1nyagfSApaJYPRf5aPzLSO40tRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9MpBDleXBbvFV5kORQUKR5PajTUiPLKkN9yI9QQA3RZ3KXJml+wgx8WZiRsXQhMvZyDWvnAwXParjMdzsAUct9+LmqdsctpnhGsWaD3tT7/WyQu8BN4Q7zIQZ47Sj/WHhsj0grRyei+4/OhOU1rIXzHKBhWBJpj9wkxJygi7+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbsfDcfU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbsfDcfU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c197eaaab00so666879366b.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786981276; x=1787586076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoBtZfhuywbVuLLdP5All4NoUQGWiUJ7pstL6sIhZxI=;
        b=DbsfDcfUa8Cvowgke5R67j5EPPeKisPJCnlWY8gDrym/XG/P7NTflnUM/XaLputeQX
         UcBMfUtDvVgW4uyxm1uIxuMuUAFg6AzPQsttcbxUbdyC/jnwRyRIZyMJeQFJAFTG8IP+
         1quEc/apiDOXDgR9+awoXZLjfRp99/IK+frZfNslHNwPsGRefr+Y812K+OL5n9wk3Vpc
         7b50eynvxpJg0mFPQ4k0sZmdCzcK9rUSZi7qDXvZABvMLCcK9kQ5fhBgcjsPoEiysj7Q
         A9Cq8MFti0tSj1ewOmzM/h/ltnhppQ+FpCXIlUP1W1gtWZD8AfZgZJm1uhLdZGgJst5V
         UzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786981276; x=1787586076;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoBtZfhuywbVuLLdP5All4NoUQGWiUJ7pstL6sIhZxI=;
        b=LBErSyT/LMpkXBfN1WcRERqB9sWwK6GUgUxi4K5eGvHcGhGeL5fVfbmF+/+oeUszBZ
         x3Zl/9hpo4HgrTNzULFUa8F/2mpvkTJDiVbULq5u+ozfalCGonVtETbwLou59W+DsdHv
         l+i++TOkLOP34Fms8q+QgLpSORRlh6qmyX3kBegxGTb3OgjEpPwXrQ06eV44q4D2agbh
         gdA4B7o7PBTq+lYbVQP11E+S5SF9ltbGWwCxnfuIyihiWAeh3E+sgw5bkOuCCsEYe4/Q
         MCQX77Jtvy2VAAMWRlGvwRA/msRO2w51beHowOmoJwlvK5gL5A9ZoqGCwRGZq7zDQKXm
         mq6A==
X-Forwarded-Encrypted: i=1; AHgh+RoyrBFnZv22MH5HYsMpOaafJJVZnLASsPw56tD4yWlHHpOzxIAH3tpi2SuUYxT/dOqXmZ59/v/8zAV3a+iiIVix@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ8TOELU9IlSOisiOhprG8cTkIPHfBLVywzy8xGka1ili0//fs
	YuignBYmt9C4a0eXUHzy1ne2DkvujTAxEWsx4tGIZlmf19WQtz6l6v1v
X-Gm-Gg: AR+sD13t4FGUKCnnxj2Eya/338ss6fDDj9X5A9LmMgyGtSpwmRK1s/twyLpct8Rp+wK
	n2gFBlJ2xm0vtvSSl0N9l/ZozESE7OtQbBGIbi2OFJhTvLL2NiYBQzm5VUOFzfDX1Ygo+TRlkk/
	F4Z4wHX888lXzcJEUqt+h9z7S3l9dqI4HvhFBO7XerL/An2fh4b6D8+JKOZOeahHpx+bwCqRJuV
	aVLRBLGatF8vZvDp+lga3sChc+1yxnfzLT1UblVUmmUeny/EuE/cQbuTQaLSBeY1D388GHjCmYy
	gW1Gofs88653B7FukGbtRSqAmd/VdJF/g615vZ4weGdtzyKr1dC3kqpltl9H5fdMH8Rb0DRUiZ1
	6+XpOO4fBgggL2FDDWJVrhIS/ePNyawGI35+SQyer/j998+HoGYwHoOLXopYKuXGH28WcsTEYuW
	2A19akfq/YlemZyP837+dz4N0tD4P1eYH8tbPOtkxmt26SmSERpQCqWCKALwYM08M1zVI/Ry6e
X-Received: by 2002:a17:906:ee84:b0:c20:eeaa:ec85 with SMTP id a640c23a62f3a-c212a1857cfmr1355311566b.17.1786981275977;
        Mon, 17 Aug 2026 08:41:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc9697sm44467766b.61.2026.08.17.08.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:41:15 -0700 (PDT)
Message-ID: <b63e93e4-2f4c-4cad-b726-e1b0565379d7@gmail.com>
Date: Mon, 17 Aug 2026 17:41:11 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom PAS TZ API migration breaks GPU and modem on
 TrustZone without PAS (sc7180 trogdor)
To: Paul Hollinsky <phollinsky@holtechnik.com>, sumit.garg@oss.qualcomm.com,
 andersson@kernel.org
Cc: mathieu.poirier@linaro.org, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, akhilpo@oss.qualcomm.com,
 konradybcio@kernel.org, mukesh.ojha@oss.qualcomm.com,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20260808034716.58888-1-phollinsky@holtechnik.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20260808034716.58888-1-phollinsky@holtechnik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/8/26 5:47 AM, Paul Hollinsky wrote:
> Hi,
> 
> Two commits from the "firmware: qcom: Add OP-TEE PAS service support"
> series break the GPU and the modem on SC7180 Chromebooks (trogdor):
> 
>   f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs")
>   0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs")
> 
> Both are in linux-next as of next-20260805 and neither is in a released
> kernel yet, so there is still time to fix this before v7.3.

First of all, thank you for the amazingly thorough write-up. I've been on
holiday so I couldn't look into it quicker.

[...]

> Suggested fix, drm/msm
> ======================
> 
> Given the above, I think the right fix is to move the availability check
> behind the DT discovery rather than restore the SCM check. Boards with no
> zap-shader node then never consult PAS at all, and boards that do have one
> keep the qcom_pas_is_available() gate the original patch was going for:
> 
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -52,6 +52,12 @@
>  		return -ENODEV;
>  	}
>  
> +	/* We need PAS to be able to load the firmware */
> +	if (!qcom_pas_is_available()) {
> +		DRM_DEV_ERROR(dev, "PAS is not available\n");
> +		return -EPROBE_DEFER;
> +	}
> +
>  	ret = of_reserved_mem_region_to_resource(np, 0, &r);
>  	if (ret) {
>  		zap_available = false;
> @@ -170,18 +176,11 @@
>  int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	struct platform_device *pdev = gpu->pdev;
>  
>  	/* Short cut if we determine the zap shader isn't available/needed */
>  	if (!zap_available)
>  		return -ENODEV;
>  
> -	/* We need PAS to be able to load the firmware */
> -	if (!qcom_pas_is_available()) {
> -		DRM_DEV_ERROR(&pdev->dev, "PAS is not available\n");
> -		return -EPROBE_DEFER;
> -	}
> -
>  	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }

I believe this is the right fix

> I have this booting here: the GPU initialises and logs "Zap shader not
> enabled - using SECVID_TRUST_CNTL instead", as it did before the
> regression.
> 
> 
> Suggested fix, remoteproc
> =========================
> 
> Keep an SCM gate for need_mem_protection and add a separate PAS gate for
> need_pas_mem_setup. This is what I did to get it working:
> 
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2079,7 +2079,16 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> -	if (desc->need_mem_protection && !qcom_pas_is_available())
> +	/*
> +	 * Memory protection is done through qcom_scm_assign_mem(), which needs
> +	 * SCM but not PAS. Only the memory setup path issues PAS calls, so
> +	 * requiring PAS for every need_mem_protection platform prevents the
> +	 * modem from probing at all on TZ firmware that offers no PAS.
> +	 */
> +	if (desc->need_mem_protection && !qcom_scm_is_available())
> +		return -EPROBE_DEFER;
> +
> +	if (desc->need_pas_mem_setup && !qcom_pas_is_available())
>  		return -EPROBE_DEFER;

And likewise this looks like the correct fix too, feel free to submit
both as patches

[...]

> On the API contract
> ===================
> 
> For what it is worth, the kernel-doc for qcom_pas_is_available()
> (qcom_pas.c:256) reads:
> 
>   Note that it is mandatory for any PAS client to invoke this API.
>   If it returns true then only any other PAS API can be invoked.
> 
> That is a guard to call before invoking a PAS API, not a statement that a
> driver touching TZ at all should refuse to probe without PAS.
> ipa_main.c:764 consults it only on the loader path that genuinely needs
> PAS rather than as a blanket probe precondition, which is the shape both
> fixes above are aiming for.

This is a sloppiness that got through the transition patchset.. previously
as you mentioned, qcom_scm_is_available() was a blanket "can we talk to TZ
yet"?, and as the conversion happened, it was largely just find-and-replaced..

Konrad

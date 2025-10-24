Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69943009E5
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Oct 2025 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761291950; cv=none; b=RMCMTE9j/eIxikNgmt6c7eL7C3eVN768TYiM/ilzlUxH2i0LY3L/nRnsviEsGYvbwd2mGcsnzWBQKi/GVWDNfrZ8yO4Nxf0KggBvv4UQn7SdrA293heNrau9zvEjzKYFzlMvqxH0UC2RlItwfJkEUJnvGKiOPIuXwEYmBhMo8UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761291950; c=relaxed/simple;
	bh=vX5yRwm4ftbWjAX7FZLs+c0d/+jm7B2nEL118mfYl/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgWIzaiilysaxy6XcQI5GBdHSr4PnbnzyB7urIvNu7kpYAw2Zrlaod5yIfDNAvbbErPx3h17QG1twc1hjgk0Mf/s3OEnqRCzPjyL1jBxvDQUyvm2ZDRhen7PnfNJT6ODHCtLtvKB6pIbJx5NmW31PABPAzUCM1GmIxdD+ETVh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdIyeh+5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdIyeh+5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426f1574a14so997530f8f.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Oct 2025 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761291947; x=1761896747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=76x+2Uo/HbKBYMvTIwWyzfeiAti3Egen0c4fS6B0f94=;
        b=AdIyeh+5GAg5sj8EaqoGV3NrgSlMU32fcpXNUeM79Hs9TW5fEHeffQR7nMTG0kZLoI
         AMNqLNmWbW1BZ8J+7i0OMJqg1T3QIduZozMA7726Ua5/4/lsg/gbbzBlULjORjlMOvI/
         ZTwPc+QW1Ya4gI7tj/gIP1N9mdYueusE1ScmpRQPFsKT3SvyAaR+N7r4GG+h4pCuSjdd
         vFwmUocbYjn+JGKSsNPPQuujCfnaNNbcj7GFcXGL8qOOmaodeeMPlKc05wGXkgSXGqSy
         ZYLqmYbrhTtADOWZ15v51UsT5kUN57FXQKQX4sOCnhslGCrFB3u4CAE0u7dbHKrGL92l
         1Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291947; x=1761896747;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76x+2Uo/HbKBYMvTIwWyzfeiAti3Egen0c4fS6B0f94=;
        b=HW6fXZwUH8OlAEnggf9JedFcvdJIF+9/+pMYFUeiKIxol/2r2sMhLwAnKewXzKQsOs
         VLSbIwzGnFLJO+dXRYn6masyRaf2GERn8+LoAVTNl8D4cRDAm3mYCt0b6u93SfmAZQMl
         V2e0h47ZYjrhrWropI7gt0Fj+eOfPZsTuHIOLy4Jx//uYALtQE3+2J86Yis56ooqdkJG
         J2nt8nMc07gxnUG8XcJwqQ/2cnt7H3G/L9J6lyDfq6DFnWyooCrZBHc/dVy/i4LIAZKB
         Lw3IDjV5ALcArtD1glD+ZJVixKj8yN+U5NX2fRwl0HVQewaK6+DoDpx4HahFtSEj1zdF
         JlXA==
X-Forwarded-Encrypted: i=1; AJvYcCX6zZqdGlBLF+jf0BlhMRWIWcfAaot8Fn6TfNlrs1NnfIP8uXz3JHINaVde1RlvCAhWyv60jzUei0jmMysss7He@vger.kernel.org
X-Gm-Message-State: AOJu0YzikpYc5AJwOTHVfY9p8G8mVmr/tYW6H52fTCSUG8pX6HvZ6Vfc
	kcWDP6zKZluCMKK3IvA7QipLSvy6aBnLCz4YMDu2BHM9Du5IWNfUPeQA
X-Gm-Gg: ASbGnctK45G8C1ojlcdm9IykFWLUCNCXnCDcb9ZcAehkmHAIuMsOFH9BTzMJ/r9NStO
	qgJVBjVHORA1PMAZ96M6cz1d7neZrGBwQBy/T7TByx8K9bYbuuIrtTnNXwijeolUEdMD4irlsvo
	aiVQ5d5zmmznXUKges2MWhK/9iS08jQvzbrK34hpe169pVHnN1eEPZ+X7i0k6kCD1kRoEymboV8
	05VNXa4ukztq51ex4aiNgndr+5d6SM2EuEGKCEIEzmKRnz/6xqrIR2QgUiXwZk3dceGALdXRn8n
	QbGOc5jxK2/M/1ObXl48oxn12MSwkqtY3CBv1P2w36I75bdmqK0t3Nc+lzqVxJkZVmmrIztVL1L
	9xktP21YyofFk5maZvv048CilqJq3ttYUeY2nj49Nx13loFg357cTo/0mZFLOQWgVwgpxEeskoq
	oykxB94k5sJTLxnF19hSk4T40vex2ow6W2FyDU77RAcWXJ1D0Lp7qqNJji9JhzkxEqOQgtz73HF
	tlaK3kWTy8=
X-Google-Smtp-Source: AGHT+IGe6ga7m7ZRRmcMM4nfZdnjZB5cllJaC3HfPAXtJdQL58NqGFmpsTnEdoLSRE2c4zUMbOWrFA==
X-Received: by 2002:a5d:5f91:0:b0:428:3d14:7385 with SMTP id ffacd0b85a97d-4298a059f15mr3287804f8f.28.1761291946952;
        Fri, 24 Oct 2025 00:45:46 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4298bd78c69sm5998825f8f.4.2025.10.24.00.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:45:46 -0700 (PDT)
Message-ID: <d19785f7-6b1a-4f3a-841b-dc737c7b7e5c@gmail.com>
Date: Fri, 24 Oct 2025 09:45:44 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
 <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
 <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
 <fdfzoemfxdz2p622hvixpaznh2n22hweit2e43plfu2kdd6kad@reulvi4vs5v4>
 <cdc01b6d-370d-45dd-a3fd-9866d2a5f36d@gmail.com>
 <7952ed3d-f019-4593-af43-b2df7f738d04@oss.qualcomm.com>
 <c0e6b667-2e87-4419-81ad-3366ed56830e@gmail.com>
 <1f98f83f-328f-47c8-84e7-2c77abb37a6a@oss.qualcomm.com>
 <91288aa0-0088-4b50-8b33-661d8c0c25ae@gmail.com>
 <e5befb65-3d9f-4cc7-afd0-c418e8c2310a@oss.qualcomm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Autocrypt: addr=k.kozlowski.k@gmail.com; keydata=
 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
 PN9NZAOyb771QoVr8A==
In-Reply-To: <e5befb65-3d9f-4cc7-afd0-c418e8c2310a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/10/2025 09:42, Jingyi Wang wrote:
> 
> 
> On 10/24/2025 3:28 PM, Krzysztof Kozlowski wrote:
>> On 24/10/2025 04:10, Jingyi Wang wrote:
>>>>>
>>>>> Hi Krzysztof，
>>>>>
>>>>> I tested with falling back to sm8650 cdsp but it will fail with:
>>>>> [    4.739615] qcom_q6v5_pas 26300000.remoteproc: unable to resolve shareable memory-region index 0
>>>>>
>>>>> sm8550 and kaanapali define 2 memory regions: 
>>>>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;"
>>>>>
>>>>> sm8650 and sm8750 define 3 memory regions:
>>>>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;"
>>>>> with the driver:
>>>>>
>>>>> static const struct qcom_pas_data sm8650_cdsp_resource = {
>>>>>         .crash_reason_smem = 601,
>>>>>         .firmware_name = "cdsp.mdt",
>>>>>         .dtb_firmware_name = "cdsp_dtb.mdt",
>>>>>          <...>
>>>>>         .region_assign_idx = 2,
>>>>>         .region_assign_count = 1,
>>>>>         .region_assign_shared = true,
>>>>>         .region_assign_vmid = QCOM_SCM_VMID_CDSP,
>>>>> };
>>>>>
>>>>> When kaanapali fallback to sm8650 it cannot parse this region_assign_idx.
>>>>>
>>>>> So shall we still fallback to sm8550 or define a new node "kaanapali_cdsp_resource"
>>>>> in the driver?
>>>>
>>>> And partially the point here is that you might need the third region, no?
>>>> Best regards,
>>>> Krzysztof
>>>
>>> On kaanapali, the global_sync_mem region is not managed by kernel, so it should
>>> be removed.
>>
>>
>> OK, then please mention this in the commit msg, so it is clear why this
>> is not compatible with previous generation.
>>
>> Best regards,
>> Krzysztof
> 
> Sorry for being a bit verbose, but I would like to make it clear that we can still
> use this fallback if we clarify it in the commit message, right?


Yes, you can.

Best regards,
Krzysztof

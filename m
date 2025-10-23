Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277735B14F
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Oct 2025 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761200941; cv=none; b=plnb6Ssu2tOOnBVAZqpVd1REmayYhFz1/AzMHhVlpE6O5zRHuwlCGUbmja+fY5hJBhPwJpuBewRCrcW1Rb0jwI7BDP6NfJd0mugAYG/JNWaCrQx25Xdkxv6IK9YKU78ZSgnspU9vmGpltilWIBsgQYCp+9w5jbJwQi3lkhP7U7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761200941; c=relaxed/simple;
	bh=fosxcRfm4IcPp2XyRa43blhpzgOGKZ7BZ6k6bvuh/k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqJTR3hhCt1LWBOeFORmEL/MJD9cStHcpsCMwTOivXcHF9Z4mr1taiTKAL0UtI4lfBAaqfzHAuoxIq4ht6892W3d6MJJpfhPU7HU3NywYyz0JbGvcLpYGUD2M7NLAPYn6gAy1Ujxro3cnB2w0o4HmbzOkgGbi5EkxQeMKe1Q1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQAUXPLx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQAUXPLx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-427007b1fe5so335629f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761200938; x=1761805738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cfXSNBJ3Lj8HMC9TG4zI26WPaoxL73AUzeIid3gj+Vk=;
        b=UQAUXPLxGaQ3JIiVdYUdrATpty4kk/Z9z3E91wSmzMgugOkFu8e0KzyK4GpMaskD/e
         qwbfgLjF4zKM7T/Jvndu3HlD9Ni5ypLSEBk8Nv7FsACmln67QlF+4NtuyvuG9LmfTz1J
         QOx5mwOom7Zqy3OQR/WgptokT6lsyYfrq55L9eNcmvUGOxjGlVAlwUuDz4T639CYurWd
         trSRj2LZyOzXBT88jnlckn9+xetqusl3IEYsSWXOHy0tahfNY9Bh4ocV+FAcotHj95oM
         3VXgO1H9Lvc3t/zzi5wLt2HaC4x3kKnqyaAkWEMYr5k0mJYDsslcS4DNNEDSOUF3R54u
         oNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761200938; x=1761805738;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfXSNBJ3Lj8HMC9TG4zI26WPaoxL73AUzeIid3gj+Vk=;
        b=JlI3Rt42Y8RN3qz/kKMUFQOIVGhCpP2UZfS5SGHdZqPIF92QvGV2yWbkK4smMjmD6S
         yDXgk//YimAO6PV0xtScfVlCtSurDt7bFUWiE3Gl2W5U8xGA3Iia2F8g/sOty2d0ufiG
         albFggOGRXA+vXWtL0Pn920Mse+Q2T5RyXe0XKyOXwGgTc761dZ2KynSNRG0rpWTkLQm
         v0CC/oCbMYAz0YPeFEmhFDudZhAlARNvwLR3BvHvUW9djtBr7VVqDrWyEIMLFvVx4hSY
         NmO9BdHtvID6IZ5hN0b0rC67BeJ+R5Sx/480o5ncAKiu2zxz6TLIczhWAqpQZ+a4y53x
         D/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVw2ZqYrgMpb5IBSrsrNQTg6MYOoQTGRoyCv8FXVQyqhDQi0/oCAV9+OtNAm7FFdOt3dXvKR8rA9zOls55Afwg@vger.kernel.org
X-Gm-Message-State: AOJu0YzsU8qxV0RND6K3HeBTCzQ7BAmrqWthtLw/z8rjXA85I4Yl69sx
	kVNUjeoFtDeg1q3raVsy6tU9+iWTQ1cYSbWetMTRQqJRlmrxSpZePtwA
X-Gm-Gg: ASbGncsbiAqEQ3F4nu4HNfDQJxWfl7QcHVTIkRFqQ7JCMFIKnSrNU3nkCvjEEsds83/
	qJOYTPWXDVkuSI8IVzlDsDQbMHAOlRsaeGj8UAmo5HAMSOTo7JYqle0kpl9YP/rwBXNAQIRalcT
	rh0/nqZlsJNGI2O29HHMwy1fMiXVszThEwAcaqSXgm9Vl/uLyEDTZZDHKXnqipIKWWJvWAo5N1d
	U7u6EQZNB0VYRBUJ1I/evplScBs/6+eQ6ygysMIStV/yj/zz5i8Zz6Ewc2OxmbKQL3hmlYyRlpW
	J0mNcU5JbeEBOF/5JZ2hoLTCA39xPWQ0XA3lD5QEIJhOP9ZwBmk348hVv3RwKd878oFzseZevUz
	6btpWREySqs7UT8WosHoz0kS5UC8fIRjWmAnEKewmJIWoMHY7Kc+qhMTMdARFJml4Ub2+VbAZPL
	NNUZtaqXEtdgyqwEhiSe287rWE3ee9LLIvlm+zYE6HYj4ogIv/JKE3sEShajVRvJnRKhVyjhuDn
	6IUn8bwyAD6VCwDv0c3cA==
X-Google-Smtp-Source: AGHT+IGQYsYCoWv277/L1DZqnSFky9hUnqtHFEhUT8R9Ao9EsxWIgBx6V3qKm2hKAnUcCyUKYbX8NA==
X-Received: by 2002:a05:6000:2911:b0:426:da92:d390 with SMTP id ffacd0b85a97d-42704d83ce7mr16609944f8f.10.1761200937708;
        Wed, 22 Oct 2025 23:28:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429897f52aasm2190315f8f.12.2025.10.22.23.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 23:28:56 -0700 (PDT)
Message-ID: <c0e6b667-2e87-4419-81ad-3366ed56830e@gmail.com>
Date: Thu, 23 Oct 2025 08:28:54 +0200
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
From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Content-Language: en-US
Autocrypt: addr=k.kozlowski.k@gmail.com; keydata=
 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
 PN9NZAOyb771QoVr8A==
In-Reply-To: <7952ed3d-f019-4593-af43-b2df7f738d04@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2025 06:07, Jingyi Wang wrote:
> 
> 
> On 10/9/2025 6:29 PM, Krzysztof Kozlowski wrote:
>> On 29/09/2025 19:03, Dmitry Baryshkov wrote:
>>> On Mon, Sep 29, 2025 at 05:41:10PM +0800, Jingyi Wang wrote:
>>>>
>>>>
>>>> On 9/29/2025 5:34 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
>>>>>>
>>>>>>
>>>>>> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
>>>>>>> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>>>>>
>>>>>>>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>>>>>>>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>>>>>>>> interrupt.
>>>>>>>>
>>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
>>>>>>>>  1 file changed, 19 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>>> index be9e2a0bc060..031fdf36a66c 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>>> @@ -35,6 +35,9 @@ properties:
>>>>>>>>        - items:
>>>>>>>>            - const: qcom,sm8750-cdsp-pas
>>>>>>>>            - const: qcom,sm8650-cdsp-pas
>>>>>>>> +      - items:
>>>>>>>> +          - const: qcom,kaanapali-cdsp-pas
>>>>>>>> +          - const: qcom,sm8550-cdsp-pas
>>>>>>>
>>>>>>>
>>>>>>> This time maybe without HTML:
>>>>>>>
>>>>>>> This looks wrong. This is not compatible with SM8550.
>>>>>>
>>>>>> Could you point out what is the difference from your perspecetive?
>>>>>> it is the same as SM8550 except for there is one more interrupt,
>>>>>> which is also described in this patch.
>>>>>
>>>>> I'd second Krzysztof here. Your description points out that it is _not_
>>>>> compatible to SM8550.
>>>>>
>>>>
>>>> Here is the binding for sm8750 cdsp. Fallback to sm8650 but describe the
>>>> difference in interrupt:
>>>> https://lore.kernel.org/all/20250221160036.159557-1-krzysztof.kozlowski@linaro.org/
>>>
>>> Interesting. Let's wait for Krzysztof's response then.
>>>
>>
>>
>> Because it is evolution of sm8750, so it did not go back to old design.
>> from three generations ago. This is compatible with sm8750 or with sm8650.
>>
>>
>> Best regards,
>> Krzysztof
> 
> Hi Krzysztof，
> 
> I tested with falling back to sm8650 cdsp but it will fail with:
> [    4.739615] qcom_q6v5_pas 26300000.remoteproc: unable to resolve shareable memory-region index 0
> 
> sm8550 and kaanapali define 2 memory regions: 
> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;"
> 
> sm8650 and sm8750 define 3 memory regions:
> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;"
> with the driver:
> 
> static const struct qcom_pas_data sm8650_cdsp_resource = {
>         .crash_reason_smem = 601,
>         .firmware_name = "cdsp.mdt",
>         .dtb_firmware_name = "cdsp_dtb.mdt",
>          <...>
>         .region_assign_idx = 2,
>         .region_assign_count = 1,
>         .region_assign_shared = true,
>         .region_assign_vmid = QCOM_SCM_VMID_CDSP,
> };
> 
> When kaanapali fallback to sm8650 it cannot parse this region_assign_idx.
> 
> So shall we still fallback to sm8550 or define a new node "kaanapali_cdsp_resource"
> in the driver?

And partially the point here is that you might need the third region, no?
Best regards,
Krzysztof

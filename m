Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D21F12E9
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799028; cv=none; b=G0P0j9LOd44s8ggPZO8RvrX3OUlhpinpjHZnC5tmx+H1POUg4NYD14ofSsUeCezV/iYkiiynZ7RklXn6ChQBHkGj3uec3S1oNuv2CtkVsUQ4mYkPMjO77AgjFXpXTVfTJg7pUUh4eXFLLELPMnEOQKfRtQiG6nxcHZZV/RVjwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799028; c=relaxed/simple;
	bh=kRy3R7VfGoc1bssAiwrUHSgpndwIcCOFEjYQX7QEk9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRy0qVuPYY67d7JGEs6f4MgnxyMFHgY+7qW0v5io0YgN3c3XJyNhuBM0vmNT6a7YckIjOUPUX2SQCkk0jLSM9tfuNVVq/khqXjY//gINJALaQw0AfVsULfZv1xP61zXgQVdTW3TB0TDyDXIGWF4UIYZkd/crXUrPB+mRb54gsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xle/3ZVb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xle/3ZVb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OG67eX007072
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 21:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVJI6aOBGl4t4VmrNckaYkNqLm0/IYYdUwHHZ9TzyaQ=; b=Xle/3ZVbKSl5LU4M
	NV2lwkFhV3XkKoPWc3beKvEv09ETVlRI5aKyLx/HxgVDGiHRJqwwfGeX/8gi+cAF
	ZjCk6iLcelFOcSbr9WuliGdEsTxvg/gQxe5hnDeJB+riplD+KSHRisE7jcA4/j33
	WhW0C2JQEiaKHw4CEeqfzqjbALT3RRcKfQjxPHIOYX+WzJFyThBwcsP1/eDiwd1C
	ETBh5F853UjwHP16GZhTQDO/0pktcgmY8lD7i/Mgi73QOVXevmAaoK1KS8S3cttB
	3WeeQu4U+LNVEtxHfauN+NVJ852kzgURb1fhNHTUAYM4dk/IVCNXbljwh4nrjIeO
	TDaYwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttvv90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 21:03:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d4133a2081so115172185a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 14:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799023; x=1751403823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVJI6aOBGl4t4VmrNckaYkNqLm0/IYYdUwHHZ9TzyaQ=;
        b=UTOCZhEmy6zPTRV+9oV5G3vmmGw5ZdQlY8McOzMJ/nlhgwsUlNZwtTSk+r7X63IBmO
         I6rORAH9q6xThHMQNg4EGZ9lmDSDPMM0wJzlBDeGtvJlh7LZzzZZPbcu05tBPIaqSpUN
         DolvFRH0IHx+3UAqHQtudRUQHjeBh4HNVvLApx4kBOI1YBpFlAms3mmPPimvlBCuVBrB
         O4PziRqKMr9IB+ZLQepUuP6IjASypAYZ1tQoKERLFKeMybD64tzLqwaoYwKioaKxOcYc
         eBezzhQ28MRkGGnWF9R41Lm935hwmruBm0e3G60cR5gQgF2oqirnlF9o529OE8YjH5CR
         c39Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrkL1iXSUhob/plnivebtlTvat6octP9oi2enKjn3HmKELLtf34rf/97/b+3V5HtJxGvGbMyOYiL7aAx/c/Wop@vger.kernel.org
X-Gm-Message-State: AOJu0YzvOudAX20OXOsLoEJttdzRh+Fs3oXBRJKC/HF4XGWFJp/VJWqt
	pGQArzlRlBQCNgj0zH3l7tG/IXj+OuVk+jHO4SocB2m0xslDtab/fBIFYa6/0dLW2GN4EsLbome
	4kiIoMnuWywSa6BDiHpPAKTvP+VVQpwhRJL7bTuW+3jo/cj1RlpSNuCph9240g2sZQMtM0ttn
X-Gm-Gg: ASbGncso3v7tyBqH4+Ab24OOA1Vz/0v6LA9ud/X9HDwNghlmJDEaGbz1y1bfoH6Yg3K
	ZNp982KzyaxoMAIxj+3Ymtmm8I1xHQkgfz6pArGBepYBOV4Ynn2iMBZ9+soPiSKX1IfWAcgMoke
	pzAMo6rjWnWFrch+/1ZQiaL0GaVkx2ixxwaKYPBJS9wo+lORAkDRQLKhcx2AZjMpwwUAumCqFM4
	IvHpYhqWf2BuXhJIc0kjop6aCGroxsDXlUk2MaCx5jUVMAOsYm19uhl2uACeazorCVy/G+k11gD
	/5Gg2ZJQfjbj/R4UdKCKJaLc7MG9l+a3msqVwvNxgli3tkTitLS5xDxam0tHlcsm2YgwLwgHYkC
	Py64wmM2EzhNrHIg3RwsXnssB
X-Received: by 2002:a05:620a:4053:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d42965f652mr79133385a.14.1750799023319;
        Tue, 24 Jun 2025 14:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdXH0d1f6aDkKnx6CCNg4hy12ddxcs0mjWOfhKxBZypB1VzHs0Gz8oM9mgx/g5oqmSwc4ULw==
X-Received: by 2002:a05:620a:4053:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d42965f652mr79129285a.14.1750799022848;
        Tue, 24 Jun 2025 14:03:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980f0800sm17872221fa.114.2025.06.24.14.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 14:03:41 -0700 (PDT)
Message-ID: <225b94a0-eea5-4061-aebd-da497d349527@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 00:03:40 +0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
 <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685b12b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=6ZqSrkSmcNyY40qCGO8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: Obi2QBQF3FjR0MtD1eJ40WVeIhToYKv_
X-Proofpoint-GUID: Obi2QBQF3FjR0MtD1eJ40WVeIhToYKv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE2NyBTYWx0ZWRfX2ImtgGtPcZBE
 W42EgMR1D6DNip6mKMmSPs/TBkoV/7IRdAufj7MXDdgRVrpi+X69vdzMkZX6D3mYUHhw4I0GD9E
 0JcACb4EMHu+dCuN7fxxH1Wx17gPh3XOiQYlJwAmnY7jtQl/cRtuZVytf+hyZTRNmC2hUligXyc
 /0zoBtFpcoIgQjcA4Bj24NwtX7+GmITwIrgooCltEEazApIyVRJiVy3Ho4sLOelFc0Qq45TNOhs
 ER/+dKW05Jepkt0hJAnMvkK2F4haBt7T0hQLix/PhQNo+gNRQLHQIAoVxpOV9bCYUGu7Pxs7tEI
 k3ySXoMFPuMyAOOk047QOq3QLeghKjpTUhkHia+Lai/hO1pgRMhis7vG6I3x+6NEV/JPkuundf+
 0la8X38YDdAXI9a6EwAUbCA7di5Lj7dBFbqzJtW82a1N09kTArCu+Mm/UjRjKUKyxPjBhgFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240167

On 24/06/2025 21:46, Luca Weiss wrote:
> Hi Dmitry,
> 
> On 24-06-2025 2:59 a.m., Dmitry Baryshkov wrote:
>> On Sat, Jun 21, 2025 at 03:19:55PM +0200, Luca Weiss wrote:
>>> Switch over the ADSP PIL to use power-domains instead of a regulator,
>>> and have one commit switching over the MSM8974 SoC plus all the devices
>>> to use power-domains.
>>>
>>> Note, that I'm aware that these changes are not backwards compatible and
>>> not really bisectable, but since it only affects the ADSP on these
>>
>> Why? The cx-supply is handled unconditionally. A single-domain usecase
>> is also handled via a special code path. I think this might be
>> backwards-compatible, by the pure luck.
> 
> Honestly I have not tried and not looked much. I mostly added this 
> paragraph to avoid the response that this change might break and is not 
> really backwards compatible. If it does (by accident) work with the 
> updated dts without the driver and the other way around, then even better.

I think it's worth checking that new kernel works with older DTS (that's 
the usual rule). The platform doesn't have many users upstream, but I 
think it has been used by some PmOS users, which might mean 
not-yet-upstreamed DT.

> 
> Regards
> Luca
> 
>>
>>> pretty old boards, I say it's fine to have this. Get all the patches
>>> into the same release (6.17?) and then we're good again.
>>>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>> Luca Weiss (4):
>>>        dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as 
>>> power domain
>>>        remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974
>>>        ARM: dts: qcom: msm8974: Sort header includes alphabetically
>>>        ARM: dts: qcom: msm8974: Start using rpmpd for power domains
>>>
>>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 18 ++------
>>>   .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
>>>   .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 12 ------
>>>   .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
>>>   .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
>>>   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 +++++++++++ 
>>> +++++++++--
>>>   .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
>>>   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
>>>   .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
>>>   .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
>>>   ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
>>>   drivers/remoteproc/qcom_q6v5_pas.c                 |  2 +-
>>>   12 files changed, 56 insertions(+), 114 deletions(-)
>>> ---
>>> base-commit: 7fa2fb97cd28e1d9670da538095565b6fba83977
>>> change-id: 20250621-msm8974-rpmpd-switch-b19b166c02be
>>>
>>> Best regards,
>>> -- 
>>> Luca Weiss <luca@lucaweiss.eu>
>>>
>>
> 


-- 
With best wishes
Dmitry

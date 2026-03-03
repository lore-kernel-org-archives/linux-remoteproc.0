Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBD94DC543
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 18:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772563836; cv=none; b=J+V5SB5jjgNApK7YuNefreeDQLMgmY/Lpsce86puojkGhX9S5qg/JRaCFg6AzVtQQrvtKqJL5ISL3W/EjcDDZlI6ZuoF0PIscPoucQQfE/NZras5vVnMun9L1FMhqzaixPVeTXux7/wWhS11sl5rnvbutbFx2h/MUcyzbez2CZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772563836; c=relaxed/simple;
	bh=BhzdJyekgz0SUdQuPdU2KmCe50jZgn4HDDf2/xppf6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=apV7/QeDfCu/OEmwU/Vv0w1pq69wZsEorG2vt4icHl2mF519IsfLlrMAox4bxmjGnV8NS1HfEGoaVTrzN/LlGejhk/8Hs9qRXzpQQX6gA3+ov929iVNkgJT/jtcgQNlhffbsJqxKZO6AAV7j4cfL398CEvezTFyxDXc5bHC+n7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4lVI/sN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iE4JIt4I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4lVI/sN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iE4JIt4I"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0Xca3238644
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Mar 2026 18:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	buvZSBdZ9Dfv2lUvs2TTRnj/m5Lm8hd3/JQq4D8/ppg=; b=I4lVI/sNO29U8EMf
	6T5bSMKzok+c0ixTGjwSAdTDDHPUhM0ANx7n6CzqqvZ0v+TWbxN4UyYnfnRPQbxr
	NDNjUFcySTA80kgjdjCxS6PAjiKpcHJPMct1ISSiR68RbPi675LSNu8PtwtBxoj/
	tesbhmyn+MVG3Cq0lQh9R/OdGr6nqNKI4/N7RtOCh3m3fVCr65H/T75D0IIV5AMj
	vcPPPTlkGXa66j0xiWsDhkzWEIvk/Xlj+Krl8bdIzqzGzL7gvHOJBf9Mrc5mCJrB
	/+Sm18nxc8AmINZFf3xgzuTx95JX6W5cEIHaTCcwSmSQkSMrOlWe1KZD4BHmR2S1
	Uk5Ycg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu9upv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 18:50:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adc527eaf5so29739095ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 10:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772563831; x=1773168631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=buvZSBdZ9Dfv2lUvs2TTRnj/m5Lm8hd3/JQq4D8/ppg=;
        b=iE4JIt4IDYSVb5jo9Z8c84tkSn2fesXHOnhHJUB4jUfudfMvUMWtnFYAbLyzc2DsKx
         +D3isqakTDqPhprRZhqqjTpuHWqgJ3WBlQtb9ZE0Ek5Blsrd+YsM/T7rVK8KFsbND+eQ
         OMm3BLuiehomRRP2RkQEuyvK0qpGnlZ1xa0cYgo+it0qrh7VBgf2rj9f02B+hyRjDcrS
         G9LdB6NRIbJSr96xuqzhOp58ozCwq9dP9c6RcvvAd+TcA+wI3ObQ+MzZpEU5Q9zaq+cu
         YBY/eT1PKwBpC67XlZUfrD2EvyPMA05bImvuxK/pBft7x2DE53gDWkbbdbPntI0uni0I
         x/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772563831; x=1773168631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buvZSBdZ9Dfv2lUvs2TTRnj/m5Lm8hd3/JQq4D8/ppg=;
        b=LaP+7QboUQCSd0kzfZPncrLx5SLndsMdGwcT/W8zKGLzx9fae3Drpl1WPAzHDNlLBv
         SLaDLITjZOOa+4yqWoivn1Y/upxWYwnAA3U8eEwW6UVP0d0lAaSCctkPu+Qq47UkgbM/
         T2GIuk25JsDHIWb38oNkEwxrlGKiyj6owsY0KgzP8bLM2GFZUXIez+rF2W/BU6oRnvBM
         8c+fmUHNOYlhPmfk365Ro6c62GcZNCv9GQseAMHKqmRLzo0KCOSVmiIcV4/1cgdntv3n
         86OkSOQOg7s1tkVKhdWqF8j+U0xMwLota3lEsHNBjFDY/KCsTv6GyjsV+UWBG6YNMM6w
         QSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ86lqNKu5wOeWeP28SI4xpfM47jjXsIgUQMIXK6uis6fvFEfK+r57mEpWRxmm7h9iMosmFhVk1hntndN7WLpP@vger.kernel.org
X-Gm-Message-State: AOJu0YzuOqamb4AeJ4hX6ueaaJFgu0jjCrowgwngCJIhe44JDy4zmv0u
	HRViDB9iFChhau5lX9FyfDUbdg9HTi+Vv08LIuvEHVVKMLQEZURjkLp8HJnO1Th0GSfZeQyVza0
	Wwmau2qU2RKt5DyxOSBZaSXLpvAb1//r/fyvTN56CtFuDNUcuRWl+OvZPZFmRx/Jb6RIl7BDc
X-Gm-Gg: ATEYQzyxIRn0boRIuW02vu/i8Fr9OaCmuuZETH6sIXQOCBdBZqw7Yy9NGsiRh/2KLjz
	Wi6fMk1ApxdXDtSOkUJG3vL01oOp59ni41ikaB0OMGsRNtf46Nrxs7eYIdZ5v9zE4lEJOA5cySj
	uZMUxbHITDjMe9/hhOJUyD48ZAzWeG1n/g2n0jjBAmzkQQAbboBJSf+iHtTD64/6I7YwTir7EjB
	YL1OukryFnXyw9tQU0s8tKmBHpUlwQhH3EXNBkeYyxGk+25xbBtlEg9PRYcc91r90pirAIvjV32
	CMr1petjiHlfdjrbg+ytbHu6wiuCfuS41orPhZDDizmKAIkD4UjPzyx2wvsvmyMm77et6rby6gS
	MS8b02pb7/Y06XaySnFKW6r5ZjlIG+T6OWdRwp8RVNTB3BuFFZXy9N4P8RiIpTpc=
X-Received: by 2002:a17:903:984:b0:2ae:4e43:a606 with SMTP id d9443c01a7336-2ae4e43b42cmr81715985ad.20.1772563830852;
        Tue, 03 Mar 2026 10:50:30 -0800 (PST)
X-Received: by 2002:a17:903:984:b0:2ae:4e43:a606 with SMTP id d9443c01a7336-2ae4e43b42cmr81715735ad.20.1772563830250;
        Tue, 03 Mar 2026 10:50:30 -0800 (PST)
Received: from [192.168.0.107] ([183.82.176.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6f0ff9sm188970095ad.84.2026.03.03.10.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:50:29 -0800 (PST)
Message-ID: <756630f0-b6d6-4869-aec5-91aab0f6f074@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 00:20:24 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/6] Add new driver for WCSS secure PIL loading
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K7SFtvrXkVPcwsfvAgA3GBKO-_whtDiP
X-Proofpoint-ORIG-GUID: K7SFtvrXkVPcwsfvAgA3GBKO-_whtDiP
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a72d77 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nh/15Aj2rvbLbjah8EXp4w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=Z0qTAJmwHQViJ36sbxQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1MiBTYWx0ZWRfXxf8jkLxcWeYU
 6tuW6JKM1pBIrFKxGr9FOiiTBU6c56hcwE6wWrFS9jaJ/RCsJA5p7spFhv6MOxGF4wBQDeVxEA1
 XsGkjtSMFk7BFmOdfwvemHfIXYNMqUs9lA2KArRc+1azH9Bue5bJhCuClDfQVztilDX36G0FEh1
 eRfJEjZmA0oj3S+x98yIPRGca5xwfsPjTyF+Wr8a13RufgH6s1o5mzdCdGddF1PI0F+lIRU0HbW
 1xWk+chn0y4346lAzbODkcopyDVy8yiGFcLUZk94U6o0ucJP6GYc7rmt3TTwkncGf5uM0blVlNb
 DSFi7Dzxjygnnq7pEGtzzLWDPhmYqVyNRI9tymzShF7X6NPwFVsJSaCPNCQ1gWRYMuCcNFQUkQN
 +/p9aeDuB3BatE3vYL11GgrWS6at+Sl1CisxgIcUR7TqUoabgwE2a3acU/aOPa4thrvk54E85B5
 HwxEphicO3pjNW8s5vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030152

On 1/13/2026 2:50 PM, Varadarajan Narayanan wrote:
> As discussed in [4] posting this series after dropping IPQ5424 support
> to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].
> 
> Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.
> 
> Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> I've resumed Gokul's work as the last submission dates back April 2025.
> 
> - Secure PIL is signed, firmware images which only TrustZone (TZ)
>   can authenticate and load. Linux kernel will send a request to TZ to
>   authenticate and load the PIL images.
> 
> - When secure PIL support was added to the existing wcss PIL driver
>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>   This series adds a new secure PIL driver for the same.
> 
> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>   reposted from [3].
> 
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
> 
> [2]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
> 
> [3]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
> 
> [4]
> https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/
> 
> Changes in v10:
> 	- Add R-b tags
> 	- Remove unused fields from 'struct wcss_sec'
> 	- Remove glink and ssr subdev if wcss_sec_probe() fails
> 	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/
Hi Bjorn,

With Dmitry's R-b in patch 3/6, all 6 patches now have R-b tags.

Could you please help review and pick up this series ?

Thanks,
Vignesh


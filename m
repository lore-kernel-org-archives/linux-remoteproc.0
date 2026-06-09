Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D648C8B1
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019777; cv=none; b=knrQDOZ63rPImIqhjb8GlyWV4TxiTxC2JutWtebxMj/nSrNYg2Lkf07x3zDVB5IPAuEwWnP4tSU2qxYH89iqYwOabrBE9UD56vNI/7JlN5jJjp1MsGu57JaQjsVPgkatLWJiEYO9sQcEAKYsDJ0xx3EpOl74+yUUiSvnzEVr6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019777; c=relaxed/simple;
	bh=gqr5ohazsZyTasddooxt15i9sIDUHi6ZxT2bvwDtjME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pk4Nx7bUlbGjRjm0yiH8i97/y5G0VQU69pPww8pH0xFJMwoEKH9knHlyjj9FJwDh1jeJt9ZFs+2YrNf2TzTCO4nR0NsvDtUaXllqESPlxRNvnE4i7ATcnnmhXpI/DXDQzzG1k1EPa9Xkd0d1M0cajSqwACF02CYOSPiGC5/A0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D39SZ7a8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZhSzPiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D39SZ7a8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZhSzPiF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClKp7652175
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 15:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8cHJxOBc5Xe8d7YrcCfFV5AL9qZw+skq3zLnjeLTEDs=; b=D39SZ7a8IjOskgri
	S9RCiOP/R1kujtUpFKg2zm/nyS6LoKlIHQVf7mDN332toLJm+U40U6uK/R143VBD
	3eBsqTnEIkyiIPv6pZ6j46q4N53+1pQdxLAxDKdou4ShDBg+UF1M+ljfxSS0BwF3
	Lol4Le8d1s4KEX1PKIFizOZPDlgBetoRyQ7u10R6u+V/TF1RF35G4bNDeKAQ5n70
	1Egg+LIt68GjvbjWtmQP1OD12cUm7KDcX8kB+HzsjUdM243t6NtJAT0q9WjgkkIn
	x4TD+IPgtYzob9ZMs0w9VdfYJnI+/qJae1HtNtnv39HO9vmrv+RcR60iGbB/p5WD
	v4H/9A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0st680-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 15:42:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304ed777a96so3684217eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019773; x=1781624573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cHJxOBc5Xe8d7YrcCfFV5AL9qZw+skq3zLnjeLTEDs=;
        b=HZhSzPiF03w+nzTTaTezEPcoJGYJUadkrbMLbG0PIWF55fSbnFxtnGVyaTia1ngXWp
         /i7fZlCrfo5XnNHR3kTN7RQnq7NT5JAisCFTMMCOH2C+7uBFjpxE0DOCYH/QXp2cfpbw
         fxvFEfZ36fFE3iugRTaESfFaAnR62CmwtG1aB1rRjYsBs24XPS+Rvf/pfP5hzuxaqqZV
         /dEbcFxntfmVVdkeM5jZO+GN6VNzgTiYI4jJpPadjIBxyfDB5l/4exeYJbhFKv2E0d/B
         3T4JL9DJaeHjz0QNx6ZbpdAdRrO2lWO9XD0rA83Rl4DRMOfGUh0OzcaCq5F9q9lYDtNL
         Etfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019773; x=1781624573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cHJxOBc5Xe8d7YrcCfFV5AL9qZw+skq3zLnjeLTEDs=;
        b=LIhVDXH31976uvWoZ7DpGVyXrEKrgPK4NiT1uBWwz7yrkRbvSYVjm445ZTzGRoRBpd
         aY+8ElRLpR5EgtMx2bsvQny5Bvuia7NAYmW62xg03H+7UV5mBRedr0uYHy1XgeIe8jY3
         qmuFGXTN0E06h2gv4I/K9sjmF8YvC22KPzkGoERJmbK14TmqRWEDPXMAPt1HcqaD1xYq
         EfZDeaNeLInvQDX9vEovqkBaumqb8x0foc0aiLsAFrenEPWX3EzxJtMAesPce2caF7C7
         dXm76qQz/a3sjbkRMsHS1mEKjdgrx4sF4EZhPEiPvK90kVHkLdauQD3iWWRPUWVOcTM2
         mczA==
X-Forwarded-Encrypted: i=1; AFNElJ+gGCRyCw4vLGN2h0bDeZBFQ24UxR1tsPzrMKgLDagZ3rRnm+OB34ZXuALNX6/f70VxpvJxk/9GjsMApshE7sGo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+vq0pqcwAzu50ygpAjZs3FBYe77pMeGom2NVf2Al3Xx2Y1Hlg
	8HB5fbf9XYgAWqg23q2tJ17w7KvvBzvhvmvTls69Fmg9w9cL6sctuE02RD0guJZNvaOKnnOFjSV
	Tr6JzQ/s0rB1o6Iq3Y7MST8r4vHBv/Bn2ONW28o6GLiHIawgDh+riInm3LHFah6nrf6LKjSX30x
	NbqOD9
X-Gm-Gg: Acq92OGVj6dkmhx4w2sJb36D3ZWGj53Y2VT23YT74sJ7FwxZo6mrjTrn4U9qcVd4HYa
	apOTxVrwXoB4RU227BmN1VXVR2hb822aJQRe3xWcIhaN/j/1053Ha/apfAiU3ehq0ggVeg/Wand
	xTI30rgzAD/KBWrjrnXHqNT75yZw+AqlQ/xa03gENyhN5DHw2Zu9mjiEIetQlJfWnugykdw/gzp
	As9LesFXYzGe9EtDpaZKIPEsCV+Eyujl9lyeJjuVRniVhtIS1wNSea9FaltOJ9J5Sx2vN0wwNHc
	g7aFiIobJkfHmwp0bp2Wz4hHLBpKh1kcj89BeKWMLEWdQEKTC1wUxDlmmq9fkBkBLzwWY/MQzPh
	Deq8IqQJB/Gn6nvNwfXlT72K0XW935W4aLULk+W44+uty4mKaSX8srN1WtiuHZcnpmyJQbZDz67
	RvE2maGTYogc1kJlWl
X-Received: by 2002:a05:7022:3d03:b0:123:3c24:b15 with SMTP id a92af1059eb24-13807d94f3bmr9505300c88.19.1781019773000;
        Tue, 09 Jun 2026 08:42:53 -0700 (PDT)
X-Received: by 2002:a05:7022:3d03:b0:123:3c24:b15 with SMTP id a92af1059eb24-13807d94f3bmr9505263c88.19.1781019772510;
        Tue, 09 Jun 2026 08:42:52 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm26793961eec.8.2026.06.09.08.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:42:51 -0700 (PDT)
Message-ID: <dc655263-99d1-4dc5-a5b8-f2d64af36421@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 08:42:50 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] remoteproc: qcom_wcnss_iris: Add support for
 WCN3610
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        wcn36xx@lists.infradead.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
 <20260306004344.10968-3-kerigancreighton@gmail.com>
 <4f94c20c-d06f-48e5-95fb-5380c84a1b99@kernel.org>
 <ecad737b-ea4c-4f32-b519-f338cfd6d48e@oss.qualcomm.com>
 <aieCcYXkmDqfb0Bj@baldur>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aieCcYXkmDqfb0Bj@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OCBTYWx0ZWRfX17JJPUulkETP
 TjBHUhgF8cw5iXy5fbA81fZgJCgdjjiz9ODUm1itVQI6eJPovlq1mkIuqYk/Ocr90Og6SiUcXr2
 sFPNEKKOom3WqRO6QeCvWVDjgQbcvhHxJ7S2lpfP/lzZf4J5wb78sEasnMZ9SZA5AeCMr3Pb1g5
 xxaMmBteK0pkW7DLOf+XyXCwpaEws7BNkmT0n+H7ZCS1D6WeFocJdzEyXiuTdiNdaNrShtP04JE
 VmPoxYdNA3jo9iPPYo9rkdLVWYZdcwF3hGYH2mbtFtdYIcwp/UnCE8j+KBmITw7tsHkgVvYoOnT
 hJb0Ou7kenDT26V6zsYjLIoY/Q5czA+4FQuD2R679Aj/9tCELjcDZJVx9WQeQLtIvbPM1R4eE/b
 TyZnuZRg2V9Y+XHB0GUy2BzxqH5U3RSOYJQsfVNxd9KLiNO/lA4E/1zn0djvE5rDSyGY9FE8vd0
 SFS5TE6A9tbcy7UDWBQ==
X-Proofpoint-ORIG-GUID: YO99aVHiLa2N4UuGthgpG5jt55qPrzoR
X-Proofpoint-GUID: YO99aVHiLa2N4UuGthgpG5jt55qPrzoR
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a28347d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=kV-QE96C91QsJRX880IA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090148

On 6/8/2026 8:04 PM, Bjorn Andersson wrote:
> On Fri, Jun 05, 2026 at 05:33:22PM -0700, Jeff Johnson wrote:
>> On 3/5/2026 11:25 PM, Krzysztof Kozlowski wrote:
>>> On 06/03/2026 01:43, Kerigan Creighton wrote:
>>>> WCN3610 has the same regulator requirements as
>>>> WCN3620, so in qcom_wcnss_iris, we can use wcn3620_data.
>>>>
>>>> A separate compatible is needed for WCN3610 because the
>>>> wcn36xx driver uses it for chip-specific configuration.
>>>> Specifically, it sets BTC (Bluetooth Coexistence) CFGs,
>>>> disables ENABLE_DYNAMIC_RA_START_RATE, and disables
>>>> STA_POWERSAVE for this specific chip for stable
>>>> functionality.
>>>
>>> This goes to the binding description where you describe the hardware,
>>> how I asked.
>>>
>>> Please wrap commit message according to Linux coding style / submission
>>> process (neither too early nor over the limit):
>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>> This series is sitting in my patchwork queue.
>> Based upon Krzysztof's comments there should be a v4 that moves some
>> descriptive text from 2/3 to 1/3.
>>
>> Bjorn: Once v4 lands, do you want to take this series or should I?
>> (Need to know if I should wait for ACK of 2/3 or give ACK for 3/3).
>>
> 
> I don't see any build-time dependencies between patch {1,2} and {3}. So
> I'd suggest that I pick the two remoteproc patches and you pick the WiFi
> patch.
ACK

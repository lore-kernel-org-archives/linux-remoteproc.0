Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63412472B8
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246783; cv=none; b=UZ7qM6lQkrQxIi1voYS06iFGBxbyad+9rLbA4AH6AmJfo5eh0Lp4RmtbZ6tDO5Pct0GizrZy9aEEK/0KB/M/V1scDQEnsxtpk1m37tXBEEtFL4KTJJU+zhDPR77BB33XlzLLV2WWhSuxeJdyvg2G6sDK+Dox8HpoLTA7VLi6MvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246783; c=relaxed/simple;
	bh=xBY+X7nL5AZz+gzrhUliZqJVFe9VocGCCYH1oenG6VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBKyJsBkaunYtbwzNBWUjOz4h/YLxCVs8uiqQYb7nFSvlGstsq/VvQe68DR63/J8yN3gQ/pqjLpnoQSOJ/h2iq/EBjpjrXjyYQvJIzmYbQU9gTUsGBbnGOsGmCW0+Xx/MBJ/ToXYYjXPzIh/5GTw1xchy8BgmlsjksTrNDUWOCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/p/r6Ck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pp53hrYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/p/r6Ck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pp53hrYK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655H4pG679559
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 10:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xpbe7dAQLjNnNWc71nhAnTIRBBKphawt2IUV/ANXlWw=; b=d/p/r6Ckktk9AztM
	pGL3GsxkNLlTiaAAekulPH8g6Z9lVwCHBHkqkfzqMlZc0jPDh2RUkq4r97Uh6Hry
	bkT7G9R/Sx/AceKnkVKzXGQVqDYSzmpn4tVKuhl3JzrCrSP0Ar03ljwrYrQCPZeV
	xIDsucmeigO5sbEFiX7dm4z/3Yk3lmgc5//ZxJYcRhQe7vn47rl8sz7y5DtgyaQF
	pfID5+WfqrlG+FhaaTmIEZxmJxBO4GSJFd9/PMaDg45fOJqJ5CbnUugtO5jzUKJm
	T/f1et17VY7/NQZ1AYciPCvMYDJkd+DmuX/t5CyENXMCnzlabqweu9AqHCV7FqAx
	+WbiZA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf82bw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 10:19:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381e93bfcacso3897099a91.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783246780; x=1783851580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xpbe7dAQLjNnNWc71nhAnTIRBBKphawt2IUV/ANXlWw=;
        b=Pp53hrYK0gv1vMVTS86dM6B3gzRWw5hiUbew1MImcTIN6D+ij7WCuuDwmXn9kdgxSv
         hWDP2YfumHNNjcr+38Clhx1qZDvT2bg6novyuAMIyLhx+dWN1FvpjExEpKlHmn2Nvk5j
         F4w/T7pcHOwPOnDbYnZBCQWRjDphVRT9T+yKMplUU4cB39Y4sfZEXsndiy0xRqUX8arD
         wFdksZrv82UnWYWuuPn+vH67AG+Gbs8agpgHYuZjHuOEM9itlKJm3vjL8kzAkjwEKLAC
         URG/jDoVR50Kb/wT1s6ci9FlEXyWbUGwHS9zRvBYRpRiCXZ26LbGbaUC+qpkNqWROlfg
         1v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783246780; x=1783851580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xpbe7dAQLjNnNWc71nhAnTIRBBKphawt2IUV/ANXlWw=;
        b=lErZGJ1BT/tWhlshz8Bf2M98OkUQjNhBhZy85bNMXHzrhL6341b195c7FYquKJH2aL
         le/V8cBiMdESetyc2pLTtYNYPluBlmZAZpUCahWdNegpyce2vFlFiaDbJycsruwrxRn2
         giJtTMuNXAlXxqQTtS8SPGlQfWTXMlJwAp2j8coDP+2AvR31Bii+xsJgK3qyWXdTXG2/
         OPuFFj2jIOzrDx90an1pPsWXpxcpUFqC5CYidLC6o0dhs2yrrm4nWTkeGMlwolfeooVy
         KD2fvkB2x05UAdN+rNcm6gv+qeDwabAN9Vb/8EAVI8Ur0nDn+p5H+UVK3HIf0K/o7zMM
         /XqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrM3nvJS6JKlpDhTjEQ2w4GyoK1E6e2HQLiHapbvhvrZeSz1lVq/zbpocqzVazYXQ/y5x8uacC7TAOlBvJKJ+3v@vger.kernel.org
X-Gm-Message-State: AOJu0YyCAQ0QTTvGnRsJDs0FuLzKWjaKD3L4wZfdEQzyLX6dI000v1zV
	OfeIck1jl5qGhlbJ6t+3I/f3keFgyVLqeSlcFG6VYHxmc7J4WPAkS4hEW1ofOJkCyDjn1v08mw+
	67VssVKb5kmL/THXKXbyyroNHWCvfpASR5AshSAJ2oPTVMIelVoP1XUj7WdQZ8+cClqAVO0Jp
X-Gm-Gg: AfdE7cm6Vppdsp6KPfSBN3tN6MKFdUa2UbVv70KShVqqw7WIE3cPIdYVr0tYGGvzIpY
	kb9tyuYeUppN9i2INpnbz2hv4IEetXY9XTeiqSYdjDnDxsYE5zFKvO+ZMmFI/d2wrYRZAbXPzb4
	p0fB40mvye4Nq7QjlKBgdLHGzN1h21z+KH2jbLFEFJ7NpcUlVzmUDX86GlM1PPbmAZaODkAr2oc
	YRupgDmAha+XDr9eZu93Is1qHfSXr5BIHHEWED1CqQnRWx5GOS12Ui8ZrW70fGtfONyWLwE8NSW
	gtHnsZE3rDxTeyVU516ehDlEuSPQ6UVpA827+DsDf85vfT6IUXmnk9waEl/m0nksfWWnLRwM+Vz
	FpT05JCiFSbuz1Nkxnugaf8bOVOOWJ2fzA8rq3K9VpA==
X-Received: by 2002:a17:90b:3fcf:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-3829f100a13mr5642963a91.23.1783246780488;
        Sun, 05 Jul 2026 03:19:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcf:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-3829f100a13mr5642945a91.23.1783246779990;
        Sun, 05 Jul 2026 03:19:39 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm9099831eec.15.2026.07.05.03.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 03:19:39 -0700 (PDT)
Message-ID: <49566b40-324b-4234-bb07-09e84749e666@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 15:49:31 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-6-3882189c1f83@oss.qualcomm.com>
 <pli4napz5xis7i24oum73wnaecvqz53nxy7ek6mftlxsq7qkyt@nc7jp6oi4fix>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <pli4napz5xis7i24oum73wnaecvqz53nxy7ek6mftlxsq7qkyt@nc7jp6oi4fix>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Csm5Sg6RSNi7xaP3JEuhMAYXoK8tjE7J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDEwNiBTYWx0ZWRfX3tU3TQ3oN5Ox
 V3nN/gpmqPNFqHNQK1A/8v5jFCPnrgiWt4FLrPhqBizBvKwyfPYR9A6bgd7eP9uNsx0s9pCyjej
 m9t0HGqIMZOaUiP3r3VIqWU3RyWkRKU=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4a2fbd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dzk2ctQkzv_BcHpUmM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Csm5Sg6RSNi7xaP3JEuhMAYXoK8tjE7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDEwNiBTYWx0ZWRfX0QCrDD/6JbBV
 eQrB/Y8ItcQ74GJ9Vgm26V2Nlfcq6hvi5VCKw6HMJxALAKPvgm1ZzPjMP6N9IhLMffJrJn558UK
 9v5Vx0L2J78bH7iIykw8zS8TaidccUJ7sKhGviME4ef/efA82EMOXWqBCIttn4B5wKlfXDNxsTl
 En1MgeUhau68wfp4qLOFWIGqRWdje1N9lU3duvFQVr5W/LpXPtfhUn4RsglLw4orezyWh7UAlOi
 Bc4xnLKEg11jOKfuudLZ8u2vllIt69/k8kVEpIJAh24XqfsC0dbbQEcAWxA7htMMuSa6lrrCG9K
 pRZzRovpeumAgEv9533GOrijZpHdM/tJKiFh+i/L5TVRV2qNm1e9Csdn0DN4fYu2xbhujDX7vis
 4ZyJhc0BTLIYwyWxPQBn1/gWBxtPADezdZ3fftf9zZBUpbF4XJ4emKQVrdcsy9qdT/VIPFUTfs/
 zPr2lUbQC0j8aAkX/jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050106



On 7/3/2026 9:18 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 10:33:09AM +0530, Gaurav Kohli wrote:
>> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
>> when it reaches high temperatures in kodiak.
>>
>> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
>> for modem when it reaches to 95°C.
>>
>> Since the remoteproc_mpss node doesn't exist on non modem boards, the
>> cooling-maps that reference it cause DT compilation errors. To fix that
>> remove inherited mdmss cooling-map nodes.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi               | 134 ++++++++++++++++++++-
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  17 +++
>>   .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
>>   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
>>   .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  17 +++
>>   .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
>>   7 files changed, 231 insertions(+), 4 deletions(-)
>>
>> @@ -7716,6 +7722,8 @@ map0 {
>>   		};
>>   
>>   		nspss0-thermal {
>> +			polling-delay-passive = <200>;
> 
> Why? This applies to all added polling delays.

Thanks for review, will update the reasoning(passive polling mode) in 
commit message.

> 
>> +
>>   			thermal-sensors = <&tsens1 3>;
>>   
>>   			trips {
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> index bb5a42b038f1..400d128132fc 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> @@ -24,6 +24,23 @@
>>   /delete-node/ &adsp_mem;
>>   /delete-node/ &cdsp_mem;
>>   /delete-node/ &ipa_fw_mem;
>> +
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
> 
> Don't kill what is unnecessary to be killed. Remove only MPSS maps.

Thanks for review, will change this to delete only the MPSS map entries.

> 
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &mpss_mem;
>>   /delete-node/ &remoteproc_mpss;
>>   /delete-node/ &remoteproc_wpss;
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 37a3b51323ce..187bc2899191 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -25,6 +25,23 @@
>>   /delete-node/ &rmtfs_mem;
>>   /delete-node/ &adsp_mem;
>>   /delete-node/ &cdsp_mem;
>> +
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
> 
> But MPSS is there. Why are you removing it?

thanks for review, Let me recheck this and fix this.

> 
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &video_mem;
>>   /delete-node/ &wlan_ce_mem;
>>   /delete-node/ &wpss_mem;
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
>> index a5ad796cb65d..1e190ed18ae5 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
>> @@ -22,6 +22,23 @@
>>   /delete-node/ &cdsp_mem;
>>   /delete-node/ &ipa_fw_mem;
>>   /delete-node/ &mpss_mem;
>> +
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &remoteproc_mpss;
>>   /delete-node/ &remoteproc_wpss;
>>   /delete-node/ &rmtfs_mem;
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
>> index f47efca42d48..8e8dd4efd8c0 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
>> @@ -23,6 +23,23 @@
>>   /delete-node/ &adsp_mem;
>>   /delete-node/ &cdsp_mem;
>>   /delete-node/ &ipa_fw_mem;
>> +
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &mpss_mem;
>>   /delete-node/ &remoteproc_mpss;
>>   /delete-node/ &remoteproc_wpss;
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>> index b721a8546800..1e9d7e7b5fa2 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>> @@ -26,8 +26,25 @@ &ipa {
>>   	status = "okay";
>>   };
>>   
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   &remoteproc_mpss {
>>   	compatible = "qcom,sc7280-mss-pil";
>> +	/delete-property/ #cooling-cells;
>>   	reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
>>   	reg-names = "qdsp6", "rmb";
>>   
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
>> index 3ebc915f0dc2..6642076f62c4 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
>> @@ -7,6 +7,22 @@
>>   
>>   /* WIFI SKUs save 256M by not having modem/mba/rmtfs memory regions defined. */
>>   
>> +&mdmss0_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss1_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss2_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>> +&mdmss3_thermal {
>> +	/delete-node/ cooling-maps;
>> +};
>> +
>>   /delete-node/ &mpss_mem;
>>   /delete-node/ &remoteproc_mpss;
>>   /delete-node/ &rmtfs_mem;
>>
>> -- 
>> 2.34.1
>>
> 


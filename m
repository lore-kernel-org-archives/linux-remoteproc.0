Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7160F33DEF7
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583782; cv=none; b=dtwWOHKR1TdccKd/UkVBcp6eE3ssG9njq59yUYjStGXn1yfZ+Q5GA+KsdaeSOC055PhPepCBMvPL42mHNSNgbmLNgomXHDanr1o/BS7ygmkme/UQN9/tEVzuELrhcTcaZopvPB59zi9AEAxeyrDvcbXogAvIiuwFp1Mh1v9wdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583782; c=relaxed/simple;
	bh=G5at7ibjN0g14PaG2FatNt8F41ngH9k8/i1n0QqS/zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a0PLblgVn9aBp+/toipLZvA5kbDrc9dhypWPnzsdicsV2g13Lt5aVPgvt13W62RcWP6VsZZPJ8YWzkBUknaru9wwBigm9x4PINr0+GrnPZ/+7FlH7Tsap+9S1QueLmJ2xeU+Lv+y9mu6rjLT7D6NxZUL6JL3xNW0b8q/lchHeq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKQQHNmD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF3xLkvh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKQQHNmD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF3xLkvh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rreq1851333
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 10:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	73hsc16MmRU/mTVMGpbbBTJJ3KemmpyZ4ao7J6lqNsg=; b=RKQQHNmDXinPsObc
	wzVKb4XY4P2Qyj2ukBVebHrLACA6MGsrpO5mQa+F6/XY8N9FGONoHO2yrn/yFvaE
	uoexgLkrwuo0rJ7nJzHjWsuFX/b233GLbvFXbae0RK96LKQ7poprIq22ecY+H3kI
	Dvpihf/UJX8OWR+DArsVEVjg5qtz2k7vRAsk9xXSrGn2cVluNaGomNJUStYIQRtC
	vnhMH5Q1MjJqUPTbXZr7kXrx7xS5ZCGezCT6btHl5mRHJ4TimQFCrPCi79NPxor+
	fLhmsB4SX66X8lAKvpmFXD+aaI71ZcwrQyGq/54kJzd+DXD07uPJ7C/z4KJmc5RX
	vGoqzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce9ng9uwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 10:36:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cb31bcdso195899885a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 02:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771583780; x=1772188580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73hsc16MmRU/mTVMGpbbBTJJ3KemmpyZ4ao7J6lqNsg=;
        b=gF3xLkvhUM6ppVEpUWUvydHoJii3B6YPIP9DG24kdUCadoCOJORjKFlut5Rg4B1hqw
         1YsVumG1ACmvIXPM4WZT2ZP2WdSWwIR4uQuB5ujhfkDDe45n75A3Umc86rzDM+YlTGNx
         UAwDUPAQUtq0a+fq4Zp4D4Iz69FgIbchHtsOzuC5aQjlwgy4r8uTUVpi8tkgZuy25Gz5
         npUHb8VzKmeFHAPfTtHQQPORCgFd/F53luhD/sGjWUflbtMl7tNDf2Gyv1/hcDjjLO4q
         FHuiE9IlvxIaLROwZC95ejf18s2vstLgXte3LjdvLZ89ZWY4T25opQOkdFPYL42r97h/
         1OYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771583780; x=1772188580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73hsc16MmRU/mTVMGpbbBTJJ3KemmpyZ4ao7J6lqNsg=;
        b=HUXb6S/BexeAEjxE10VJm0Cbbt4J7dMyPK06k+c/DgdxphBWh5RNU2NHOuKi/BA9Jd
         veFwQt56WZYlQ/VlTF5QHVtZjS2nHluSRWOcrqCaxG1BKrVGwOYow85yq86w9Oiaf1bG
         p1KJHToC+fYalAVBXLl1sa7s+SytM8GyZWNDnCLrsR6P9MprEHlgn3kIK24N/FAVC47Y
         YVPhWbq/40OgcWm2cOHnSbitEDZMii5VTiuSMr2jTd2L6wiKgqNuRHzVPt0toqygHBzS
         LlRPzdJcANjYKzX14L5H1uaLiBqm4feWPLcxdoIxGAIHMuU6rkiPLqlbLFFJ+DB/HwbU
         yixg==
X-Forwarded-Encrypted: i=1; AJvYcCVi90Ltcbzu+3lz7rfHobExLesHK817hRCjs5bVqxDuogvB5Ts3ySAMykM81fuC8S6lv2sv8Ra9igiOr12i14YU@vger.kernel.org
X-Gm-Message-State: AOJu0YwaSrXdg8sQyjJvuxLVLr7h26/c9tmgbNY4Ka6AwPDfyigr22xN
	KJWVzVshWXNYpdzDqOd2+1aL3aKAu0hA/3+hqJLzwX5YmMWIRZ4PtCPEs2mvcFoHLlkL4j7bMpC
	IYlLK9RSOGzgCuaBhhol97frCJtyqoTZUOh6+kLJiL8NoxXpaa6nNo5G/NCOt06x6Z5PPbPY3eW
	jRQa4v
X-Gm-Gg: AZuq6aIKJRXDWvWtfouDvVZauBHj8jZS2OdR8wpW8Wtu7gQYW4WLn1NFpeiD8Chtu9v
	vpj7zQmiErhUNRiYSBOKJZ9cOANsVt24JNv2ClfiIxn6X4Y+NIRed6D5eA560bmP+aGC8Exe2j9
	NeJIGn2oENoF3e7wKinGkGMngMh72WF7VPRS10KqjAwbLfhckKCxxGLkmpFTj3kWjrzL1HnVrJ9
	7iWKZZ7vjTehSjqxFWMxWK/WuAmgNj+qsc7jCbbwByIznlfrKusKCk45qugzGPRZq8RuF24XByj
	ZJ2TLruVYDI//u/QnjSiDARFBGJWINILGOLEnBKQvmCpXZc8KOnRt88ZTxCAx80/3UVi1GQZ7k4
	D7yNd4usgk8qWrJgIwXqT8to7m9N9XX0YxkVVVOOC2v7OrlkJLru0DeoDAouIDnyjGpHj8bmdDw
	/m1+Y=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr2416018585a.1.1771583779840;
        Fri, 20 Feb 2026 02:36:19 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr2416017585a.1.1771583779333;
        Fri, 20 Feb 2026 02:36:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad2a9d1asm4594244a12.15.2026.02.20.02.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 02:36:17 -0800 (PST)
Message-ID: <be05578a-d90e-42ce-a1de-4f670fce03d0@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:36:14 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
 <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA5MiBTYWx0ZWRfX+5mwIexpyswS
 cbfPa2vIUWULxYnha/riZnycylUfTK4h1pWmZE6r3CEaGMmaYSUW9xX3qXU5vcRJTv5F/RHRoNa
 kK1FC4lbs63lRdA/TkrPz83e2Y1kxxwwyb4l/abanP+q/L4cM7mP4u8h6njRlfxaZCMwwB4A+61
 q9yCL9QOjgBanQc9/PWXQD3v/RalgE5GXwFqbkJomvJorl1n/ZOHholVTMLhkOwOlUAf8zuHPVJ
 Lnp5OvKlhlTcgbgg+P8UYu+6Xcf0Lvy6TZl7YQ9ygV/8RmhAi2mx0c/nRB4Kk4WJm0lVSCU4vSI
 JJQF9xBXmI8YvgFxd5LNTovDghh2q3oaxb2SN0Z1lmvFkmulPbXic3IMpZsKOVXE+odlkVKffyb
 tLdSdQRXsLPklH5C1efSmeqafCVTxCvxKlVbrKI6y82GKKzmJ7QvFDw4FnURujEDI7qcLgauvm8
 UfyfvYmXMmAfgRkY+5A==
X-Proofpoint-ORIG-GUID: BuGjMHkGLOrfgFazicl2BsXaJd86icJz
X-Authority-Analysis: v=2.4 cv=Sbj6t/Ru c=1 sm=1 tr=0 ts=69983924 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=UqCG9HQmAAAA:8 a=HV0a73jl2iU2vqZvWrUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: BuGjMHkGLOrfgFazicl2BsXaJd86icJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200092

On 2/19/26 8:42 PM, Jeff Johnson wrote:
> On 1/13/2026 1:20 AM, Varadarajan Narayanan wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Enable nodes required for q6 remoteproc bring up.
> 
> I just recently became aware of this series, and have some questions...
> 
>> +		q6v5_wcss: remoteproc@cd00000 {
>> +			compatible = "qcom,ipq5018-wcss-sec-pil";
>> +			reg = <0x0cd00000 0x10000>;
>> +			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
> 
> This file does not currently exist in linux-firmware.
> Instead there is q6_fw.mdt with associated .b* files.
> 
> How do we transition from .mdt to .mbn given that distros update their version
> of linux-firmware independently from kernel updates? Will we need to have both
> the .mdt and .mbn files present for some period of time? Are there associated
> changes which no longer attempt to load the .mdt files?

Since there are no in-kernel users for this one (the ipq8074 WCSS driver
requests that but no DT is wired up), I would say we should promptly move to
MBN..

> I ask because I've been told the ath11k/ath12k drivers will also need to
> transition their firmware loading from m3_fw.mdt to m3_fw.mbn, and I'm not
> sure how to make that transition.

I can't see any m3_fw.mdt in the tree or l-f, unless the m3.bin qualifies

Konrad

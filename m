Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31822236FF
	for <linux-remoteproc@vger.kernel.org>; Sat, 26 Apr 2025 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745661261; cv=none; b=OkH5XwQv9P/NAbwLsITzvVm9UWkklgQVhn6KU1GVc2gYauYINCAYOn++6VOlDey68udjZVb97viNRBKf42oZmi65L3MNOdFn7SyrnkcqhF5W2Ly1RqXUMvoml5tZp4Xy1baxSJgF7zrP44iciy6QWTQs2Vn6TiwS625MqV2vW1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745661261; c=relaxed/simple;
	bh=E5IobAi/dA7bePCWkMdHzHuLjZ8cTyeul54B2zGVTwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wy20rPHt4JSi+tWaqBv/sO//cLFj4BFExwCUyfYZT3HGNeBb/ZiWGEE6jr2tPROBfWJBD816ceD09pL9fF9aIv4JLBnlpxpQcOEgpgNvfDwSsEZRCvwqQPswYlLCCf/2k/1FYk8WbufPhQbFIlUujX1ywWbaGJ+ReVbEo1CW7Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqJ1iq1W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqJ1iq1W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4BsWj001010
	for <linux-remoteproc@vger.kernel.org>; Sat, 26 Apr 2025 09:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTVIpIKJMgx7PL6j/16nNJybn4tGFA1d8wmMtkAAWGA=; b=XqJ1iq1WKxa+Yht5
	IwibmeM9cQ90mvdWksMdv6QKoE679f9w65ahFHJiNdrHJH1TpeVyg2Kl2hKmd6f4
	i5RDdkoueXCLulfY9pQnmIGt/0jzKsB5i9DK20jCu6v+GTk4iJ3lJuViFEuuxSNh
	IeD/bNQxSP8du4Yn5Ld05EOjqoLPQaD/W6Vnch2q/Qe8ZW2oHMNX6MUI9Em2Ik8a
	5WiS5Ik8AERwcgfw7c4A4ncPRBqqbzXjHwqvRTxcG5+/eawraU5VxzOTpW352f6v
	/LgDWYW1Gq+H6+i26b3lfQSXqFqWUVNpEWq08+0A3lpgj1CQXdxcHdYkoMK7xMv7
	pfQ0eQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hgq9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 26 Apr 2025 09:54:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-477608e8e4aso3451361cf.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Apr 2025 02:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745661257; x=1746266057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTVIpIKJMgx7PL6j/16nNJybn4tGFA1d8wmMtkAAWGA=;
        b=beDs4je/UQIIg2tEMLSctLziNgpAB7IPMViBCKLyfqkR/qUzvmhGJBS6IotGMnyzR5
         ksXdBEfHD0KXvPz5Y4Aq1mYTSBRjihin3vPJUXggWbx2A16K04zd1P5GmOpjiThdnwcd
         LI3NGb6X5zl32lBEgRhlshI2RlIDlAAxpYH67l3WlcXoMNOyvavCh0JpsbFtrUDY+Wey
         sYbTHF+O8IKBuvbKSRFrdh5N79b5OpekAzMsOAOlx5qH2yx8KVgj2ENmfVEBUXHXGoIb
         SOXPWsjG36NNHvZxeBHyC8fSMCpGfIxQ6OjTc3cJIOHu72cZ9PuTzVefVf9wVHIlYN3M
         7Bng==
X-Forwarded-Encrypted: i=1; AJvYcCUGp7j244wKhl7PKvZkBZRdnyE0SD8CSTzR6sZ4URRYxEUktOYonx498c0n/SA0EgsUSiMWFEdr3Y7/Cwt59pOt@vger.kernel.org
X-Gm-Message-State: AOJu0YxsxVScAsN28PhcrtxIPD8l1jI33zET/Yt3wunbDvU42YzO43Yd
	u0c3iMNcNu2/kOihIJtOxRcH9yTT004HcdJ+d75OxncQD0HcjchIkvR3R9IKw0DC7dw/gMYHuCK
	l46aLbtldMncT5FY4eQLCZeKheRSduO2D2NBGVI4hJdxVOj1uJK8QNhNIDW2dAQ/OOXeT
X-Gm-Gg: ASbGncsLwYZfIWlWPRwoJ36Ai1CfhUwdQQwzCIxezyP2naAG8sKgzM8Lt+Z12keElkw
	drUZMXs0pNPSTh/0lWIvPhZDAwiWeKpVce0ikvcsNEo4xh4C+XR3JJOztdkLMHexU9dngxqU2dI
	GYOD/jBjoRH5ofpFT8D+zDhxRSMSTf4RvyXG84Esdejkgns0lz5iuWb1bffk5FXuqlcADAAQYEK
	trGG+IMLM25c+gUg7lJYSvVprW+gqyr8cjwYRaCl44K1GEa/x31AMLQvIzNSCat4V9boI8U5RWa
	1EHDy4GQVmb/4II37Pq+O+MCs1wMSuAi0L0AdFIvhDWYqX0lzkVQDo13LWU9kyxt5vo=
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr34926941cf.7.1745661257702;
        Sat, 26 Apr 2025 02:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZNvX/ilxEAdVDSLaCIbroQr1WR3nh5RCJRq54/cavOxBSuNVxeIwqJJRqmEBtDmqNHuf1Hg==
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr34926821cf.7.1745661257308;
        Sat, 26 Apr 2025 02:54:17 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e595abfsm264941066b.86.2025.04.26.02.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 02:54:16 -0700 (PDT)
Message-ID: <3510a805-66db-4796-8deb-e798a6d0ce37@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 11:54:14 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-5-a94fe8799f14@quicinc.com>
 <654e4b69-dac2-4e05-bbe7-61a3396da52d@oss.qualcomm.com>
 <774c2476-937b-4d3a-b0dc-d66f12d9f60e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <774c2476-937b-4d3a-b0dc-d66f12d9f60e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yQMFMmFW7ia413CthWkH5tcK43npvgdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2NSBTYWx0ZWRfX1xDMjbVxScCP +y5eJvCfuh6O5AoBAN3OulKFGO0Bt64wx3DSLKcuutPorCUezIdy7ZGkn89EJxvYHNgitseTinQ CppFbTacMW1u72ssFeesoLVGVl448IiMsNXfOfvyle28uNYaju4oWguKoYJRFBepWiJ6XeyTUsQ
 sI9yisM06cYgDr6iUdBlNGRAlLosK73+mZW0gXUgKSdSqtsRxMeh0PR3amYJRKvRCmTxwPpqCwI 7Rdte5U+EsMuUF4fA+qnmFZw+WeyVMmt8wMPYg2iKU5mM3MBPs6Ve8oeorSO9E6EUhvJ4jYLstQ Moko5cjvZoh+2g13LC8zvYOpTUntBFHjhFVyOK8nlRUQ3/Dq0D/sD4LRv4ddboX11yodSUBDJki
 sQyRRzHs08gBqynicZHAHHa79QI+8I3O8iRSeVrbIjF9tZe0H+lO/qkyknMcEN53T5/hiX5i
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680cad4b cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=YhQMvyRDPdZ9LwTnx6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yQMFMmFW7ia413CthWkH5tcK43npvgdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=733 adultscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260065

On 4/24/25 9:56 AM, Lijuan Gao wrote:
> 
> 
> 在 4/23/2025 5:34 PM, Konrad Dybcio 写道:
>> On 4/23/25 11:17 AM, Lijuan Gao wrote:
>>> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
>>> remoteproc functionality.
>>>
>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>> ---

[...]

>>> +        remoteproc_adsp: remoteproc-adsp@62400000 {
>>> +            compatible = "qcom,qcs615-adsp-pas", "qcom,sm8150-adsp-pas";
>>> +            reg = <0x0 0x62400000 0x0 0x100>;
>>
>> The size is 0x100000 (1 MiB)
> 
> Sorry, my mistake. I checked the latest datasheet, and the size should be 0x4040. I will update the register size for both ADSP and CDSP

Yes you're right

Konrad

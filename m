Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA472512F3
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 May 2025 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453200; cv=none; b=CWa4uFmXmk7TMuM4naJ2Fu38K7ELG1KzZbj7jOonVOREy55VtcZZGJcuX9Wb6WRbV/3rPgSR6jajMosYw2EMBwuyTOC90qxrM8llpom/uGcNhQvJVz3n1z4lj4G+CaIYQj2k0IsBljjxyajfINBVR6F2pwXFu/0jrnwrBha3Hhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453200; c=relaxed/simple;
	bh=Dk5TrfYsZTaKAGjfadDJlyV2DgI5O/v2XMSv1VA28qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ke8ZxdGzA4+UFzxDEDc4aNlP9984tQQj1zU8QMYfEPyN9OCS+0YMzyd+nku6R/G9tfjl6wG2AoYoV4nV7oZybZfofjCEJAHRizTqoNJkxm49yrAWsFcy6X13pE27t36YN1jKRJj05h3sldqRApBjAipeuc84bjIW/pxQi+vMDvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7ZGHnb4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7ZGHnb4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BSc3S000547
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 May 2025 13:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O6JjaZi4RfYIn6ZpfLVOkLDl9POHRwHaQxHd14ACq6M=; b=T7ZGHnb4mBwSi/v5
	+VFo069X/W4731ggJ170f1/JF9v2CTXCZywrbSZ/9XaDH8vawwYHVC4xPUCemXUn
	O36k58baDMpI63dwxkqEiYOOlkcFNFW1tWfEzlR82mtnmCqvsSaEZv4iro8C+0fp
	62zzmiNI1OvoMC5Gs73qVfexJOUK3AKgP0of5opMYK6gl6S4nSKgYUv56LRs3d58
	OvruXJMFq0yHelJQlnCQ0l6Q7FMNa8eWHzJLt8smJdR2cq3vZZ/Msb1SJ+1WAZ12
	e698Yfxbdf/4TR88Ylu/qncIZ0oO2dDIOlkFltzaLW3JfLaSz5JzxCZZmzh/4lbs
	cfhZtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9c5qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 13:53:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso60794985a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 06:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746453196; x=1747057996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6JjaZi4RfYIn6ZpfLVOkLDl9POHRwHaQxHd14ACq6M=;
        b=FQoI8hK0M3Frl/twOkK7Sw00CwrL9fzQKP157WcZ8EDj+Wb+ai1tGTpPgwjmwpo8FB
         diAiAXwH7okp2nRf7fd+VFi+EHNgdhaWl9+dCzSdByEVBuSxbNHVff3LokX6UrSBrEUX
         GDW3Z0BtHOXM8F5fQlgXTEWHPJPlpMvwU6lQo3/nNEgzSkxuwQglr+YxnbAHdSqd3uob
         4K7a4DG1hAF3U7IUjYPuGVURsoC9hQWv4rCaKgrcJBh6X3O9q7sOFkjAiSKrbQk3kjds
         HdfkQeZBzYdbINPCJ9OFFh4UyS3Og111VEkjpzHAkzVuIWEUOF0asefNDAlzzdwARnTk
         lSoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlElroNaGcGDrFk/t/7oLr1OyDTW2ATjb+J9HzED4fAGIHs153g7siqD+v2k7t410n5Onj66YX1qhHJbe+fbD/@vger.kernel.org
X-Gm-Message-State: AOJu0YyOaxd7cDGhQ32gj3GxjafcxDD4R5o58QU4eF4eMS46mcVVheWR
	VJJ9eHBvy5ul24Z6s0cGme8rKJmodNlnLM3LA/Fpbyx/3QwoQq+GiPYshAY8yBe4JgBQGBL+DdB
	AGrrb0FS0OMcMRrXGp6/5M6PZ+r8O3/cexD4d8X7XlQXEjur2mjsUiQ46gXngbZxzysqa
X-Gm-Gg: ASbGncu+Kk6qaWNlEkTaT0tAg9RoeS1dYxiDAQGbUuTztMUjfBKh2Cwks6OhFMXGB+m
	0iKV+JwyGUk4uIniOTKNRKuMKupbhWHvghzq0aZxUubvpwOP3PbDCL9cQQB5X3zXJZk3jSY1gkJ
	jwbROwSvK1+F2dp7DclbBIizAYcM5Q9G9KiLRi1KW8+lgsC+wk3oQKclhlxlwkvUVM9EK8b26hb
	+s1145CoPOCYOMBTBwDPjNvEn7fOjch/K0yLTK4ckf7Q2HaVhmJL9f0fl1OpNKFsf54NN/fy/Hh
	3/zPTqCZZO/CbLiJc86xI00YPzvECs7o1VlNrW8HPUUrcWIW3ddGqMFHbDfZRVJYRxU=
X-Received: by 2002:ac8:5815:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-48c32ac855fmr62114151cf.12.1746453196688;
        Mon, 05 May 2025 06:53:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7r4e4FpvQ/V6W1AbvbRMkK18p34iEe3+n9QIq+e7sfrj+oYLch1ohMk37fGgJoMdInSkBEw==
X-Received: by 2002:ac8:5815:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-48c32ac855fmr62114011cf.12.1746453196200;
        Mon, 05 May 2025 06:53:16 -0700 (PDT)
Received: from [192.168.65.169] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c032fsm491532666b.123.2025.05.05.06.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:53:15 -0700 (PDT)
Message-ID: <7f2c2554-2654-4d10-b264-fb59ed54152c@oss.qualcomm.com>
Date: Mon, 5 May 2025 15:53:12 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 5/6] arm64: dts: qcom: ipq5424: add nodes to bring up
 q6
To: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-6-gokul.sriram.p@oss.qualcomm.com>
 <5a17d866-a459-40c8-9e3f-90bb1cdbd846@oss.qualcomm.com>
 <e6d58532-dcd3-4c12-b70e-f765c01ec286@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e6d58532-dcd3-4c12-b70e-f765c01ec286@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNCBTYWx0ZWRfX6fKW++GyA7po
 zV7iZEdQicWTayuXXtVXdYoWmMj3H0opwr8pCZ1oCrzNWIhVddiE2vijrgS5iXZNeqV15we44N7
 4+8ITSlC4H7sSrtrcEkOq0NvEkAg9OkxaAI0bKR8vUEaynOPHTmeeuAmdDp2/rFp7yMZ6Q0gvAB
 jRaaE2piqvayyQsg4Y3fHgGmD6eKIJ+/zsLu6LVh0d/GRTd8Gr+0coXImxfBnY7q6sktFp0XUQk
 r0HCkNHLxBbe8t9xJzm76D0qjv+Awu6MvzdH6eatohGb01rs7kPqtEWmRQt89OB4vQvgZLfnwW+
 41kwLhLXSLHk7eiAJFjihxKuWpyNybWjvf40BVY1nq3EJjBIl1TJ060DB1XqX3avRJeBk5OHz9L
 7k8dKtcwwKUx4gMk5Zy9BJJoZboE5N2Qln4MizTiP+pqlcozSXmU+uP4EjaRGNXrWdD2BpCV
X-Proofpoint-ORIG-GUID: TrkU0Q7JnOergl35Tv7zvt-gjSgQtq7c
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6818c2cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=b9x4X1nyoVVrWMxn6-kA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TrkU0Q7JnOergl35Tv7zvt-gjSgQtq7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=739 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050134

On 5/5/25 3:47 PM, Gokul Sriram P wrote:
> 
> On 4/26/2025 1:57 AM, Konrad Dybcio wrote:
>> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>>> Enable nodes required for q6 remoteproc bring up.
>>>
>>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +		apcs_glb: mailbox@f400004 {
>>> +			compatible = "qcom,ipq5424-apcs-apps-global",
>>> +				     "qcom,ipq6018-apcs-apps-global";
>>> +			reg = <0 0x0f400004 0 0x6000>;
>> So either the offset in the driver is wrong, or the base here
>> is wrong
>>
>> The IPC register is at 0x0f40000c
>>
>> + length is 0x10_000
> 
> with 0x0f400004, In apcs mailbox driver using offset as 8.
> 
> Should I use 0x0f400000 with offset as 12 ?

Looks like, yes

Konrad

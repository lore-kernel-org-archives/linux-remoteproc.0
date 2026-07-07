Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEE33E0256
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2026 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419924; cv=none; b=HXGqFTOdGnzir7GhYDlxF184IU+UI13SM6TTj5iTZdibPbHh+9bwXh0xA8a0im7MnhIJlp4vrsM4Re9KWfm9lIV4yk5xJXlPNbpUz+TNctcmwKlQlZFUOYxbtS1g+w5w7MmCoyWwGg2QppWjTsj8KOmIb9BZNg/p3fM3FAAdkSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419924; c=relaxed/simple;
	bh=9FaByEYQ1+f7toZfhp8ANfaJcWrdVoKguDXFfomYHnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KILMAK0+kIWh0QJTzv8ZMPnOzrL2Vuv7lxahG/UExju8i4YaLQM6MKW+eYrRyDJ7qGad/lY9ODcWXVmJq5XIIxju+fZRbgtDeC9jYlSjglJxLpA3tdbhjEqyeNEh2ttYBT7t7rCU8f0JVUK2r+c8uS0fd/saz0q87WfwMQwzA0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=illqUTys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2txeiaZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="illqUTys";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2txeiaZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dijm3243253
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Jul 2026 10:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XP5y6yGHt3Ajgb88Dol1E8KHAvk0yQ+E6gY+cGfJFsU=; b=illqUTys1FEjtQ2r
	JJiO83qoOAGwu4d2azr51/L4o3C7r8f/xXVuJyNxm+Bdk9qwucmgiqpd8hz7Dzgu
	ozJWczUxVBhw1HlLltKhXOWx2DQEMUCyhO+x7vZ42c5v7nzidw3z4dlgUNCQsYRV
	dLyrz4M5Qdun6buzr/xoMvKPOuzcJQ4HpRXNbOvhRKnxxVV73S+WQtNiy4pUQk9U
	UbbMNHxXorVebnIbf++hcPbluekhyhHQ5E4SH4YQyNtqxpWnQ1XIPbdbCyA1L3yk
	HxwoOo2xVuf+IbRGW+exPm+ZaCm2UVsWFEtwPeT1fbCTbZricKqstwjD4IJ70/gb
	GQrcPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rqd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 10:25:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca3b314193so9576935ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419921; x=1784024721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XP5y6yGHt3Ajgb88Dol1E8KHAvk0yQ+E6gY+cGfJFsU=;
        b=C2txeiaZgravPS2fywlur9+W7Uh66Ui8SaHcp5R1OM80RHbOgcdG5brheiBGGKaqDY
         Y2glyF8HgrOCBS84zHJRldUmkQ/XagXwGBQ8ZiI6McAIrAa7+KRUJkhbnqj8U6Os9IWS
         B/STy/75rTNd3j11u3nw4Jt1GHGP+CqrsROvoS3RwxLG+1e/zDaQfajUindx6WTRFOfe
         nA+PZNi9GV7GoEEPJsMsL1L8ACs4k2OO/s2O9+EVrraNZ80oPauLYKUFRsEnziK4Zx5O
         w9sMYhxFHpb940CaXu13XEaEocNNQ3jzg4MJJx7OBcrqUQK0RZSFZBZ8AZ5AqlfBjdHS
         zMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419921; x=1784024721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XP5y6yGHt3Ajgb88Dol1E8KHAvk0yQ+E6gY+cGfJFsU=;
        b=PbjNv8sy+0qMfyh+gyrIKrdarebpYUCcH3znHRGJ/y3+sfDxehFOR4rQdN8DyPvTqv
         mM96nvGwFOrWc75mdHmswFYNODHGf8Fs5aUazv2pYf61hh5ANDt1MYCc131N1ZGjEYi7
         5NeBYEfkEPuglrpRX6D9q1nC6JudDHDSMYA7jTcL9nzqIUc6QOkK7M9g0oU1CyrLUaHi
         JDoujhsg2+xY/vUPqrLapIDnUIvGpDi3kakg2l9M5v/xJ5D2ESets5xgr4E7uinQjIy9
         EPBQO8omBzqy9f/+dGUt2G/PjU9dZ/JMzwospyTqWSenne/8/nW+dtwOy4k5rWo6Xcac
         2v4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoolMECo52VqUxIQAvszrfqZKyHvGZI0YAgZDQUAZDTaWGn1k2guMICFGgknkbSNB3Wbf2Hom1sudLDHKdACZsA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8PuihyICdsjtgVshisYbFkOu8b86ttTJzWuOCsu+IumUdsJqX
	/IDn+rt1kXc0Vz3slpG9BE0p/WOTbFAlkhpiozdihBCEsAD6+hX1EsS7tF80qUuwQioge9zCAuW
	B1QCJ/bT230iJuykXGG8QDind1FtdTddVhqphHKthGiX0m3Kq9WwSclwDwQ9R/zC3c/a604+R
X-Gm-Gg: AfdE7ckPHvjBejEUIyUlM1gGcIjwboXsepbpQwxpLC6dwLR0fTYDb02abmewIXxKbpy
	9NR1In6Pnja7UycmnDrEIrjcqvY4yl42zmFWFnciQVzWyhJbycIV/viAcF1GXwk1Dq9uQsna6T4
	LEWQSpw33AAhDN9MHWxcxx7dSnQw4DdOITFYE1WzfLY8tGCu25WH/XN6gTVeMCgTcFYhMQ70h6K
	+YJcIPs4jrU/vsANdeLzsERQ4hf+0LPzkj8Y6uHsZqxJzXvp6mZCUjSekucnyqlTw1Ol4jwYWCW
	EmjnHgHMbg5AfOwh3r+xiQyZ75LPc2Ak2nCr07X6d88fmvw5oDdd8bHkAvxs6MMypRFFGCVcuKX
	G7ENkgYGbeO6tRrXZIB3F/k4L2RMCJeAWQcO2x7TLfw==
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr49315095ad.2.1783419921185;
        Tue, 07 Jul 2026 03:25:21 -0700 (PDT)
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr49314885ad.2.1783419920605;
        Tue, 07 Jul 2026 03:25:20 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm9319265ad.4.2026.07.07.03.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:25:20 -0700 (PDT)
Message-ID: <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:55:13 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cd412 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fbyXy8itprBkbsvVMWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: EZB519FKhgisoUDBG8vFUlRtmYYGU7ir
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfXzde3x8dhujBc
 hCWtDE+AxUuhIAkn0VFDseV/vezJ/6d1i+RKR4YG0/uUpsfeLlhm+dyd+tCcWyzDznqpjy500Jq
 fqOaNFHp7uarabafN+T38QDybLY+cY8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfXyMbs/X3By6Wp
 Hs25i96Mys+44Q5l1p5zK0x6AM7+/udCX5z3sr0DtWtwaKGDdyQ/JEcop9Zv3g37cdt4y8WeNaE
 p7rBGSMXRCIt89wU2GX0+Xmdm9gy82A1iG1+rLasz+uQg+lFKcjix7BpLk6Xwg2aLBamz8xBn2W
 uzYN0Edr38qoguaOBt4H0rZa2GapHrmHZrm3MAWMH5G/dv27Un1gd48lheWmnbihlYHfdvBHKO3
 TF+Ed+ZMj4MYPt/j4FxOZOHYZBiZ46JFq4maKnDWAIh9ZAtlJeG3E6smLHayQJBYWrGvOSfHVn/
 /adIU6mb5Nn/AttFe1KRH/Zjp0o8xB3tbJkdORXav+nDWh44k3EBFoJ0NMnETkv04/AuVLIeGan
 iFtYK7XSS9rLL/3LWSj9Q4nr41XYFFM9a3uzwCPTJAyU+MjKVg6LQEUfOYx/E5j+YnalBWC7JZ6
 xUNPYRQ57DgLQ8330ug==
X-Proofpoint-ORIG-GUID: EZB519FKhgisoUDBG8vFUlRtmYYGU7ir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070100



On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
>> On 7/6/26 19:47, Dmitry Baryshkov wrote:
>>> On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
>>>> On 7/3/26 17:42, Dmitry Baryshkov wrote:
>>>>> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>>>>>
>>>>>>
>>>>>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>>>>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>>>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>>>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>>>>>
>>>>>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>>>>>> through QMI. These endpoints can be registered with the thermal
>>>>>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>>>>>
>>>>>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>>>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>>>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>>>>>
>>>>>>>>       <&phandle device_id min_state max_state>
>>>>>>>>
>>>>>>>> Define common TMD device index constants shared across currently
>>>>>>>> supported platforms. If a future target requires a different mapping,
>>>>>>>> additional target-specific constants can be introduced while preserving
>>>>>>>> existing DT ABI.
>>>>>>>>
>>>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>
>> [ ... ]
>>
>>>>> Why are you using only those TMD devices?
>>>>>
>>>>>> More constants can be added as needed.
>>>>>
>>>>> Kodiak is one of the supported platforms.
>>>>
>>>> What would be the benefit of having more than thirteen cooling devices
>>>> declared in the thermal framework and having only a couple of them mapped in
>>>> a thermal zone ?
>>>>
>>>> I agree there are more TMDs but if they are unused for the moment, why do we
>>>> need to add them ? Can we do that incrementally ?
>>>
>>> That's what I am trying to understand: why the implementation uses only
>>> the selected two devices, if the modem on Kodiak supports others. How
>>> can we find out, which TMDs to use on other devices.
>>
>> My understanding is that is an initial thermal setup. Gaurav will add them
>> step by step while setting up all the thermal zones instead of sending a big
>> patchset. And TBH, that will be much easier to review.
> 
> In such a case it should be noted in the commit message and/or cover
> letter.

Thanks for the review/guidance. Not all TMD endpoints are relevant for 
kernel thermal zone binding — some like BCL and cold temperature are 
handled from userspace when needed. The constants here cover only
what is needed for modem and CDSP thermal zones on the currently posted 
targets.

Will add a note in the cover letter clarifying for current tmd's.
Please let me if this is fine.

> 
> 


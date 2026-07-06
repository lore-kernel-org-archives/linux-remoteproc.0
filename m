Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB82414A09
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 18:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361501; cv=none; b=nVCRSlK29orilmn8fKwq3JJjiKxC8T9b/NB6woNXEDFCdvKRKQTCUj18Pf0bA67ZasuGZioxnzWHPiizbhf9Y0Y4KFfSA7aN2UobPY3+brErKNT+rxdtn6e4UYTmnoDWjbnsYTkkBH4K4No4nVZO5KoqWoqlXPCNWoR/ir++GHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361501; c=relaxed/simple;
	bh=U4koz++ZA06ISm8vxFqnVpmFyDBe9iaAT7D7rWX0oR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eO4sDJ3w/lc0JUEyTTN33mbNYA/xLDTSBXAltCDdfXTAbk7pBZpsl99FULKnbH+GupKvWqsnLwoAct836boCRzP6QwWw9oSiqmf4BMlsQm6GhaxKNomNKQIB2IoXeiW3gFme1CGoZ132MYYiTkpvltfPV7Ph+pdcZMzHy5VaYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyAoY2mD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OApJb2F8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyAoY2mD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OApJb2F8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF55Z947310
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 18:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdPbV9YRxG+cQo4afaZFPHUjWAQxmA2bvmATYgT6CTo=; b=oyAoY2mDnXL/VX8Z
	EBod0XnqCv7UgO1YwDq1XxWWC5SMRyo0RZF/U1lU6Igva/NONMIpSecUBdw+9xKC
	ujlK2eyCwPYcM5RE+IBvDP0AbFpbH6LsMftZY+CXk9Opnw9K+npEdRFjnLD2GlzH
	a8eHyq/q3yCaR//x8mS3bEGHi4Tykxv4CkT68rJoCiv6yf6Su9Nx4lGy0kFJimhd
	peP4f+JzySIWAQjy2gXu+DmbElL3DsGAEUO+fGeTfyRhnwQwsDy4fC4C3dgK6Vju
	5dW/qVhBTz40Qr2iPGQvhBnLe70lCcQ5BaaNikIIXQxrTVr85EByRRBhYRKM1Bxy
	WcUULw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h52q14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 18:11:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso10280385a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361498; x=1783966298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdPbV9YRxG+cQo4afaZFPHUjWAQxmA2bvmATYgT6CTo=;
        b=OApJb2F8bKGFA/EkasjNmPflbo5Zu2uz1eaeQX1/Y8XsgeBsnD+KCv7uOJ+eBBv4ZL
         LbRyHxyeVB3TlahzLDpaCpx+Fgm4h0Wp8Wv4SlLA20isbtJnhyPwzIOxbF1RgA+OR2zt
         QVPgvCQXdozjwWaVaLHZEcNsc0J01vK2CzCB2q68OXAIIXlaXM2qyBWEWrXC/368dnD0
         fTK2BcUNFekO1JuWlYAV7ZA5nSFbgsZhPc+3vRvXoQPJxfiwARjA2bmHUB3WAJYbgtyR
         6VgKw9w8GDixskyx71VLYCXHWFozePEscrru7a5BehTJJsJzSr5EldtcT8KcJycy2OzZ
         N/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361498; x=1783966298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdPbV9YRxG+cQo4afaZFPHUjWAQxmA2bvmATYgT6CTo=;
        b=P0HSoE3EbgEA+x7VXvNFmMDvVWT/42yGg57ANNluEB1TaWMU94I/R8HigVBeK20one
         wrZVij9C4x7fct0nOuHSoXh57XG9PdkL3Ui1b/rrTg7OjsxPxhXkoU6epX+HHtOKltC9
         nzUWHGJ5LqGrpgVDMAo8ETKV+SDLJ7JQmAQWSBMjHads9bEngUXV2w52YCtkwSz6JYCk
         eSNmBOXxpOfmllLlai4vaK71y1A6MR9KWrGMAil4oiWKLXeuKDLCHqFeMgyoMPbWqV3e
         8v24I7fS8gBiI2686rqnyW8RrweaZV1fAZ0s9YiCjEuVMWzu+tHZrtC2xQyii27uH0K7
         gtQA==
X-Forwarded-Encrypted: i=1; AHgh+RpwwsMfe5gRrQd7HnB0EYI3WsPhmA/tC2JCRLJ/Ec5EaviNliDZnAbusb4GaZ5E6O25h2gIerQ6G+KihwJyAlxy@vger.kernel.org
X-Gm-Message-State: AOJu0YywDvAfVCyBK6BUfs8LZUmQt6dmrKRR5CdtLZT1VB8WZLm7kdyI
	tUcrTRZ0dvl6E+iZlogBpchPC94szFAKsX2yNHEI/dS5ErsWEzd9TA5K8Bqyi126FMiNbzKAHmP
	iTbsUGaW0dLWR3gKLCYkOwtMgpyxpXy6xJBgPKCVbiFldIe4uN9wNCSHCaGeFRn4T6wEBBGnJ
X-Gm-Gg: AfdE7cmrwI2+opgvw3I1wMVZ/TJCqCrybTqkV7pq3P30+W0Zjj18LaZRDMPAM4HjX6J
	QlNLbI5/KXxVQLn/c12QyDE2yBWMeZN0+BNDnu8Scg4x/a7DwfFgX7ppUYcGLu6c2+GayHz3DEO
	OAXjxlz2umBmKRvXvk/8TeqWV2T+cjSfi4G46sQMQM5Wj+YHhWtQCBtHGZ61jgJvpuceTNgyl4b
	oNw0gptEVJr3M7+Di/y0Dk9HDS36Q6fYg/Bsc8cc7yeaGxm98fGcexyFqHKuZakoeemEOjqt+cz
	QJTQXYFs/s5n5B18eb/0D4dm+q8gWtvewIe6ZDYpcnGVcacG5TeFgc9+pus0BTrPblTHUaqwYjX
	6du2Na5ThTefWB0GUN7pNPiWPXLK8cLVHKKn1pcMzoAX+NsIvKLQjf66Cb1PJVmKLXyOPU2Gfog
	==
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr2107011885a.11.1783361498236;
        Mon, 06 Jul 2026 11:11:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr2107006285a.11.1783361497659;
        Mon, 06 Jul 2026 11:11:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm26585575f8f.3.2026.07.06.11.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 11:11:36 -0700 (PDT)
Message-ID: <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 20:11:35 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tezzlbwk-fE0JN72qEl4NbKhQkfW2DCf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MyBTYWx0ZWRfX8RgPZuPt73EP
 kVR/QOmH5hspWV4NH3y+/F2RUb3GypfCYe5B+TPag6jjwGwLw4P2DcIkrq6CHiGxE3rMdTQ+Lv7
 b1jVqztYBYvYtv2Qp3AQwqC1dzquYsQ=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4befda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Q9Cl1ItI0dfYaDPAyAEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MyBTYWx0ZWRfX3KOigRDWXXZu
 6ZCP7X1H5eJ01W+o8efAQrg/ddEkBf17tcjcDiSVVkeWFsizbJf4Gdzx9yJmX4IPsvmbkK7cvDk
 DvGF70B6qsYxzauFAd5hq7AuAb/q4XtOx2wHt2KduTSd4CopoOo/7TsQsn3HPzWgm1MwGTbYDV5
 2nkGnT/fL7B4kIl/IRG1YZNyppmekVtvyjepOgxiopNVEPyeREYZZK/Dm1pBx9B2ejZ/LEl09Xy
 ZVJp7x1fkXmymAMef3zC63bkvDjEswLZW5n6cSyEp4fL7+Yv2OQvQik95vG8GQjq/qI7+Mb3W39
 lIF2WFowhg249lXYmkxNEyCm1Cvvwht3/rIoOk192gvkOIWQjvtau1OoOf5r4y7vB/vASGoRTmi
 c32fgSX5TtA1YU3f80iJwJbNxWZEpbt/oQYy5gAUuPAu9dRVKIJP6zu8C/VNY1DwM9A18TT5jBE
 FRijfSelO3TflesVJ3Q==
X-Proofpoint-ORIG-GUID: tezzlbwk-fE0JN72qEl4NbKhQkfW2DCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060183

On 7/6/26 19:47, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
>> On 7/3/26 17:42, Dmitry Baryshkov wrote:
>>> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>>>
>>>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>>>> through QMI. These endpoints can be registered with the thermal
>>>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>>>
>>>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>>>
>>>>>>      <&phandle device_id min_state max_state>
>>>>>>
>>>>>> Define common TMD device index constants shared across currently
>>>>>> supported platforms. If a future target requires a different mapping,
>>>>>> additional target-specific constants can be introduced while preserving
>>>>>> existing DT ABI.
>>>>>>
>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

[ ... ]

>>> Why are you using only those TMD devices?
>>>
>>>> More constants can be added as needed.
>>>
>>> Kodiak is one of the supported platforms.
>>
>> What would be the benefit of having more than thirteen cooling devices
>> declared in the thermal framework and having only a couple of them mapped in
>> a thermal zone ?
>>
>> I agree there are more TMDs but if they are unused for the moment, why do we
>> need to add them ? Can we do that incrementally ?
> 
> That's what I am trying to understand: why the implementation uses only
> the selected two devices, if the modem on Kodiak supports others. How
> can we find out, which TMDs to use on other devices.

My understanding is that is an initial thermal setup. Gaurav will add 
them step by step while setting up all the thermal zones instead of 
sending a big patchset. And TBH, that will be much easier to review.

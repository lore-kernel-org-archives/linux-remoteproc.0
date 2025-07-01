Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A064273D7F
	for <linux-remoteproc@vger.kernel.org>; Tue,  1 Jul 2025 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372041; cv=none; b=WGm0mdQze1CYjFZCAee4VpDN5DKPj46PHlUpTHRxz49nlG6cMVU0qwknKyCxZUQges8vvnwo+kkpHZa9nP1c0EX9lWMTH0YSMxIJXyNaIbe0uOdaIgAupYro9gxq1wVE8GQsaSBNpjlUncsSzMVB+9PFNuGbdjIFgGVYMBqsAKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372041; c=relaxed/simple;
	bh=fc+V5d2QW7CN+ykMr7bx8/ln9xdc8qfTLHTkKZZLnLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TI7/lhrXD7d4E1YGx6H/AxgxOLR08pmU/lHGBCijuCKYOExrQ9j4YooRA8X4YWaDD/ZxCnGanLr5QUvUBHiYxuL3vupJH0DD4JSlI0r8estmlDLp6bqXiQle06FF51/yzL4wwcNUoiKc+0pq4Wf7Kj7wB9T5b90h15ELdkggIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adflSpn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adflSpn2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561APnUk024884
	for <linux-remoteproc@vger.kernel.org>; Tue, 1 Jul 2025 12:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVAZKe6MVUqSmIfEve8DecFvZqjhdtqfXn8WNkgPtPk=; b=adflSpn2QBv+mRfF
	T9Kgjq27zZYwTvH/mIPtYnRLk/yvkQTMVRDKF2PY8vdNEyyyX7RTL9IJ7F2cNoRr
	Sk93tMuVJbXBkIMEwt0/P2dUTtf6b+5Al8i/icQeg8lViSVA82M4RglDrKYC+fEl
	CH5YsKnadCLo87N92Rp7repskwDFJwzFZECbR1XZajtCX/mbtxX+VxZIW5wvApBJ
	zrk4YH6V9w31PfHRpN2MTMLYrELYjtxsW+Lk++TbKIkD4zCwSG7cIFP7JOHHBKyG
	uUcrkfUgdTIEXAB2VAAWWeDq2sODEHc8TyGxkdLZVucUfOTqpgVCfP5pXng/EGwD
	aj6qXA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8020qnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 01 Jul 2025 12:13:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd202ecf82so10299556d6.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Jul 2025 05:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751372037; x=1751976837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVAZKe6MVUqSmIfEve8DecFvZqjhdtqfXn8WNkgPtPk=;
        b=BwyooSzCdFAPotE7/i6sb4ifTyNmEy6imK7lEVXuu3MprjV7alWojzNYdTo5FQkymM
         K8PHoGm69Mh0VcW0YR6h6OA4AqWOENzPSIFNfLn4pI7HEg6xEBm1DABpc1mv0jaWgfed
         fSGkK6pl9qypYHsbAVebC8oGAR1p8duftWcf+KSZR299aQSeH5dTPHXX0nL6ylf9e0N5
         Xg9mtS1PIYvBdRyFnqTROZqgm3lDiTGcMFiQPF7bYCF8gbOd71NWL8BHhCuq0ZM7Awd3
         Rh/uKB1TEvdBnWCXC3MU2jeZ95Ftmq0hVuoO9T5wRcR3TPYwWy/eYlz0dQ03iCWZ6M/e
         vDZg==
X-Forwarded-Encrypted: i=1; AJvYcCWMn00XxYs+E/Enwsm6W33NmmHVtQpgaEDNuyA5G6aTBUVmDpZOMCPCTh83b8gn6HqzitNrbpXdAaZXd/VgDLl4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn1HUaflu65uRkVvebxbUAlu4WOWRJudGj0fvU1qsDH59dp5hT
	Keqeb4QQbWZ47oQBV72HrLDrElZk6RYoKoLmWjq4qdE7yzQWFSovRYOeAcIzA2BLHa5hZlOZj9n
	4QlNrlfAuDgkKqklwdMmdP8LNEeuyhsGrGCmyjBthtfPx4HlBXyx/XuO441/nAIblshpCoQjD
X-Gm-Gg: ASbGnctWOuWIfMxnXXYfZMMm4m2jPzXk/9pLlvs2FVoYmENOQ5xJ8hphrKur8mE+c+g
	Oniy4vG4iFOU2AXU5X4vPLR0HaQO09/Pex3OYPp4aEm2kujjLnICrWKRIQSg7Rny/a7h492KWYz
	556kI3YNWIeFJp0rLWTNv4iU2/rqGHjxKQVZOlQ4WcISDAKPlBTpFhsia0HNa+TIdS2ZH19ALEF
	IgCv4tdqZBr6/sTIH8hYCZHZqOxabDdTktPc+NlwjOX71k/P8rIf3eJBeGv38++PNJ7g7gKxjV3
	3QXJ6JhmmfsJ8ip0mQ/sEbynoydZZY8QH2JYQEkccP+Hs1q5YTNrnpprrFB65C8/lB6FR33fdeg
	HxRQx0zQi
X-Received: by 2002:a05:620a:43a1:b0:7d3:cad2:ea27 with SMTP id af79cd13be357-7d468a93f78mr96973785a.13.1751372037069;
        Tue, 01 Jul 2025 05:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDi3p+4z356QnL9luRZ4ca2//1Ovbgx/iA7XNkUbzWU0a4/W2qizB5Q3TbSGueW9e6IvS/8g==
X-Received: by 2002:a05:620a:43a1:b0:7d3:cad2:ea27 with SMTP id af79cd13be357-7d468a93f78mr96971185a.13.1751372036558;
        Tue, 01 Jul 2025 05:13:56 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6b407sm859796766b.117.2025.07.01.05.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:13:56 -0700 (PDT)
Message-ID: <bc805145-b63a-4528-9c59-973fbe4961d9@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:13:53 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc
 support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
 <20250627-sm7635-remoteprocs-v2-3-0fa518f8bf6d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-sm7635-remoteprocs-v2-3-0fa518f8bf6d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ydeq0EAhEl84uvRX3Cv1TrUI7EceSd-6
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6863d106 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=S-B96e1FEKnLoGXqiSkA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Ydeq0EAhEl84uvRX3Cv1TrUI7EceSd-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NiBTYWx0ZWRfX2Dkv9G6cUkr5
 rgYt2kGt4mzF6SzMmcp6T0wgy+jAP9q/0eqQlO8K0B6wHP2Bv3xGqTh2gp+VyPkwUIFNxFrpUS3
 7OLslcydX8U2xOk0YAmfTiCERYL52xBjSh9rSZ0WYWbt2djOBO2LBhLVZVWhrFbTPROPsdu3/Ka
 TVjbYDikgNuW5QKUdKhBPwnBxG+butSR2zRSxDo9Qqh6qNQrI9HHFJCjOs1jEiwk2Dh4j9ScPXn
 V7XojkdGqVY4CUkTZO0WE7lUajh9Q5ZdCarL5RkGu13O04gXB/rRYQxY6uzYequKdee3ODOFYRG
 GgCEfaxIwODv+NIoL4La5Tpo4lrr68hHGYIG5r8+SX7Z1RN4kXban8mDy6dSaV467S2y/1Ru/I6
 Co63Lb1WINIPYG7GX7izk2BychEJyekVUU0irLwjsZSiXooWlB543zNZiMjhvBSj17LYwk56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=884 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010076



On 27-Jun-25 08:55, Luca Weiss wrote:
> Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> WPSS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

With the agreed rename:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

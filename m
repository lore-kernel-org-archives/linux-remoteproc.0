Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E78BA49
	for <linux-remoteproc@vger.kernel.org>; Fri,  4 Apr 2025 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743750533; cv=none; b=EjzNkgLdalXaca8hPLJE3cwpCZaKsthHwj+2mrgH06feKtLbvbXwa6OP9DKq4xDLYUO9TQQTQYcrXaNgmngfybDIV5EAvKLl1X3JyOVar/HwuStKMqjb+hd/eqoP+H9Ay2N27fS2X+ZjMritDvNasKaVHHSnrv1mS/5b2lSN16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743750533; c=relaxed/simple;
	bh=PePG2N+THqHow9g9biCMn9mgwJJzMWeCgQMZbgxnnmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFadzQOy+FFifiTJHpWyeHt4a/3zjWi/SeZCob1xwjf1kdtnZgPpGDJp7fGk/e0eFv0B7DqonIfSu6u7s26eR9yMMN/TmpbvU+vSEWuZKOyc5ov+mFb2IsCqd7+iqtQOWv2i0HzXE0gKJ2jVPu24WikwwCEZQb3HTakTmUueouE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrR6F1QD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrR6F1QD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53433sQw005317
	for <linux-remoteproc@vger.kernel.org>; Fri, 4 Apr 2025 07:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgs/lfGfcLivEcV2CJ7Z6AU+vdLRxoSg/Db/YnRdOYQ=; b=BrR6F1QD7cdcqmfi
	Hj4n+bMko26opAOFz/kwf78erJCP2hpCqpVh9m64VJ3xbLq2IzttE351osR5w26b
	drBvhjWXbEq+21UBVPDp67UT5IphEsDO6ZHK+CIS8b85TTvCEYUGJhv+359sEe6T
	OF9+IvqtijBk8CSwIvh3xpbjJYXqAvryxhl3cpnf6rKbaFTud8kUNWtgGc4LPpym
	AP11ZfA5Ya8BP2L6jXlIGa0xJI3geEjUFwWAGPcBQE/fBlIrBCiXREViF9Dh/86/
	H+V8TTPD5erRq5PcwSmp4BNQC7jdqubXqSVptnyE5awt+hABvfUzJKYqZ1Ds1Uaa
	HqXotw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d90y89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 04 Apr 2025 07:08:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2254bdd4982so26136045ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Apr 2025 00:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743750529; x=1744355329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgs/lfGfcLivEcV2CJ7Z6AU+vdLRxoSg/Db/YnRdOYQ=;
        b=TLsFtosK5c+K9IGzGHJXWsP2a/ri6B8Yi15CnmHTOzR2h0p/ueh9+EB1FFVhI0c9Hc
         B34rFMqd0uR/4ZPNojqFO5AlAKtCu3S0klya2G+GMoKpqNZ1QVJCqRSAE4rhOJHew965
         UXGxy4P82VRaeldRCbuPS/drNsp5OsNmJthIuMH+giaKJGhvE99R5p8WmZ2hV1XFraOJ
         fZEjc+nkNqeYhj+pMgyG4HyJN6CLDKbI+EhuCBZ5mZkeQAX42bN7eM8Ma4aUOF4YHt5h
         5ccVAWU9KjPEHTsDFrb+YgJzNYflXS0Dq2liPFdjKNe0d48ir8RSWfAsscH1Dli1ZdY9
         OB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbSRKbLB3gQfBV3UGon+sEn/dhtj7TjTB4l4HSdr92Y+NxXdrrrHTfuZ/lfA7ykrOgqKgxCbffGeLXK7xC6+xJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1CEYNjeqJg6gutix0cVkEa9C/loSA7IblqRbSuVhDNlUD3s8i
	NQMK11LwknOOxGfk0m2shiiH2OxCsp0Ktp9PkVYUw4iuWuMfP5aUveZb6kuzcsEIh/CMiF0BQp0
	m7hWjnkxEwigE7drOj+mQLv6+78SYu2vi/JML0E1XbrkKzeydIZxzg25pValU5wG3toj0
X-Gm-Gg: ASbGncsqieNsyl1bWQUhw44U9g/2eJatoIokheknF1iWT7BFa9Ispay20Q7p1wLKS5p
	CSrb0WdIPBXPxF41ipkDkNPca3OuAQcoRHFEMg3vxvYmPpEhKxkFvZFMGAE3PzKGKzTfEHxa2bs
	C2v7Cz9ncNeotVXhFsL3ukes7jGbA7RNWVJ8Kg0ZNuhdaWA7HF+Im/cZmScPihk5aMFUEaB3QZ3
	kzvOL1vr3tUP6yo8qtFQ1pqtFQ8jcd9B0Q8nx5I+Rk/A/v6WLnJLnOnBbkP3OpCARHnGasMOqbQ
	4PO69pKl0JwjeR318DQcoiNplXlGOuEQpsweEmh9EhY=
X-Received: by 2002:a17:902:d04a:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22a8a057a8dmr19970675ad.17.1743750529380;
        Fri, 04 Apr 2025 00:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ7owP26+DvwVCdb+EbklmFXlyFaqlxqwxGuGwC9OFUJ/AaSiMvztJdLJAg14Kj3eQ8arZNA==
X-Received: by 2002:a17:902:d04a:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22a8a057a8dmr19970515ad.17.1743750528951;
        Fri, 04 Apr 2025 00:08:48 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bffd4sm25615205ad.57.2025.04.04.00.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 00:08:48 -0700 (PDT)
Message-ID: <91bba481-5871-48dc-a7d6-86f3bcb60d0d@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 12:38:43 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
 <20250403120304.2345677-3-gokul.sriram.p@oss.qualcomm.com>
 <6b33d7ea-4ad5-454f-bd26-0ef961cf7ae3@kernel.org>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <6b33d7ea-4ad5-454f-bd26-0ef961cf7ae3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aSjhcBTIhOv-sxOdtpzeSDdZ08wpgtnX
X-Proofpoint-GUID: aSjhcBTIhOv-sxOdtpzeSDdZ08wpgtnX
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=67ef8582 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Wqv6gbwBmZbUZL-V1fsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxlogscore=738 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040046


On 4/3/2025 7:51 PM, Krzysztof Kozlowski wrote:
> On 03/04/2025 14:02, Gokul Sriram Palanisamy wrote:
>> +    minItems: 1
>> +    items:
>> +      - description: Q6 reserved region
>> +      - description: Q6 dtb reserved region
>> +
>> +  qcom,q6-dtb-info:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> NAK, you added new properties which invalidates review. You must drop
> review after making such significant changes (3 new properties? Several
> other changed).
> See submitting patches.
>
> Anyway, NAK for the property, you don't get DTB info from DTB.
Sorry for the confusion. My bad, this Q6 DTB loading from rproc is a new
topic.
The HW/FW has not changed, will revert.
I will repost V5 with just the comments from V3 addressed and introduce
the changes
required for Q6 DTB in a separate series. Is that fine ?

Regards,
   Gokul


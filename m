Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E632923717F
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Aug 2025 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754565042; cv=none; b=u8hX9TqhxFcYJRUIGU9d7dnyaa6D6d3E2jwlwTABjrhUuZucBybamHJw93Jnqx9Uz8VXGejKN5yMu1nLuFd8xzhl/rdvFVpXpA1a1fdq31uyBLIVb3E4PguiFaRHOKZ2z/sle8XI9fTa7TZf1CFdC5Ti86sc/i1hRunagolRTAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754565042; c=relaxed/simple;
	bh=m5jWNEvGkMzDuErMr4s4xW21ahh0JKQb4e3hPiNzJGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIeruJ9gLo5Qv/lwIcFvTxR1EzDW/rxN7NPNX8t+B5PwaVDV5ln1erxb5DUZLP0Hcif4fqLyrnoUvG3qz0EYb3momeh98o36Qd79HYqb28s/kpbwplJWLGrPoASgW9GH/XQ8dSUUMdj0G9IBu9lyt/pt3JMWozHeet1dyKW0fDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fw4D04Ep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fw4D04Ep"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DD0t008013
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 Aug 2025 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6QbTd5oBtfokcdGnfaL3ss1dZtp3HHu7abxC5K6Xgs=; b=Fw4D04EpYVpdxFyC
	bM2AUmSmJA8+WxuGhswRdnZ39HAZ6qQuifSBmNHcr00zA5bo/oUZY5N4kG6fpODd
	Lzov9pK6fQyujbnQzGgZVhLgecEVgWV0cK/U182my6Yy1h83r1RDH6I4e4MP4rrD
	oPiGYhHpT4Ox4ql1MahzP/pUDZPM1oQaaVB2ja2+vB++Oyj/CRnQVMkLEbmypAaE
	erWiCb2JOYsjxt5Pzk9izkG87OqaHRvNDRm3lSGV9Epa0m25eVC2Z54n/lJvRGOD
	V4XXNixo1gVRuLBmZfXARCGIUcbcya6LRtBHZK+pAXvp23IWqMccuUgP69/PwBDX
	40yaZg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6x2qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 11:10:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7092ca7dae0so2618766d6.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 04:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565039; x=1755169839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6QbTd5oBtfokcdGnfaL3ss1dZtp3HHu7abxC5K6Xgs=;
        b=fjpWCU/X6qbeAxgCkyzHix9JcfZ2UJkS2BdxcDYBejvhrnSm+WmKItkTZ+fYtCaSBS
         slrb1H/PpnpXUFsIufD9jrmp6TJ1P8CYLvATC/Ld5fyYT4vlgqPe486Uj1ePxNI0o0wz
         EYWNgl65d1lBW+RkKI1jFHmhNu9aFLfR+xDEMmo0KeNhVFg6gb93WVz3LVyeSoXepcA0
         UluaE1VGXStwiUEKqQHQhvdGl8o4EFWPpzjEs637o7EWSReuium7+xprOgXT/QdVb7SP
         64nEEbVNk6GCLOSnEWJgKvpDkq2ocf4/sZGJbv5qpKAqE9YmskfqdqYK6bCfMoaaBWx8
         t6cg==
X-Forwarded-Encrypted: i=1; AJvYcCWgNtaqYHBojLvtKn+lBBP8/Ltu26lZtrAMv5HxvHfx1sFHVJuwUtnJHZ3Lk+tgBUHUsGnDiaLsdaJ07WGJmt3h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvftl8w0NqmSrveJMpOi5p7erdnR0NE8VC0dW4fMtQ4IDwtl2P
	S8pinZ/KoVgnNrGmEpTtDP8eWkeoucGu5YIb/EZVDui+rHXFOhjm0Jfoh55779s9kmpmgWkjZRt
	VKc9+MjzxonurH4phtm/1Yl5hxZv1BBXRzyj3wEMh/GQJHVpuobtPMW71/IMhdj0QdB+A29Pj
X-Gm-Gg: ASbGncvpcPgLJsk4f5wJRwzkJKWJkvBtsA0tq7LotgW7aC33GBZ8Gi7znlQBIK1Q0vN
	XHtmRvf2y+kzIomV0CgwXEqdtKtMFofEjh3JvxMLXKErVouUxCOHXefH/jmuPMfSyOPOvan7CPP
	15L5nbShOqyQjiv5YtGsW+QKJEDZCHvNeINllNEm09Xd16N3s4CDmsHas+ygPV9L5fAdoxxVQGb
	DqaYtLxDRcBMrliXl46s8WgworQ41JdT5GcoiYHqgCsB2o4prP6H7prwrhaBGXhlvtbNC4sfGZt
	l1peAPYrNjlnierHm/SnJSlMDKdV7H1gR40kxgp1hNXe+IFrVgE9b4obLcJhvS7R7HhhvcoxjYl
	lBo3t4f8CTaY/kvYGAA==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr45527171cf.6.1754565038615;
        Thu, 07 Aug 2025 04:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0EgQGvuGZuwaUug6DIZAl5YiLhPSTetS5nLC8plJAjvhb/juDcAiunqpwFSjSp5lL0p+Glw==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr45526901cf.6.1754565037949;
        Thu, 07 Aug 2025 04:10:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c099sm1288976466b.108.2025.08.07.04.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:10:37 -0700 (PDT)
Message-ID: <f6432247-7455-417e-9bf4-068b564461ba@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 13:10:35 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZWru0a9Ljfkh70YMei3xNYmYh-f2TQKr
X-Proofpoint-GUID: ZWru0a9Ljfkh70YMei3xNYmYh-f2TQKr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX3RQ6FBCQMPCq
 yPEVnPue4NuBQkTYnov61OICjUhxvJwXpvSjUFdleBkYNvpJsxdju99SqTb38jT5Z0P1P19P0vw
 3U9rUtZJB3g48QNhyWJYDTquDywYeu15Ycdg/PDejeW1EtUO/edslUQ/a15a6lBcVz7QRBo9jaN
 pz3+vv0V99phGWt6E6L0t8yWKcshXaeD4c9s1Kd3Dq+RDNnTRFls9owk+BO2fJYjp6Lv5eqbDcB
 DZvTsy+WLATlDskr5fS0WAAb78C/UByIxg7WnOwgKTUMXq7tBgPD3uk2ezhUyXujXySb/DKO7Gs
 XE7o9/eqe7OJfHv/NTQDviWkVjrr0XYlDLVkdySuO7ozYPUtTdJd79hf++2vfMTixJaZ2wHlfFe
 2D0mDjsF
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=689489b0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NyTICe1PHtTOfF-B13wA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/25 9:43 AM, Mukesh Ojha wrote:
> fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
> used in the past for logging it but due to code refactor this parameter
> is unused now.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

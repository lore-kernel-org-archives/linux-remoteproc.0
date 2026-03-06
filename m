Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFB3346FAB
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812153; cv=none; b=ML+n0gAIqly6Lw04pvwTGFmcPUq6pScSFrDIonDPFEjxy6Pi5XqF+FekOhA4NWt/Ck/pMWSabPVIHHKORtFng/4/+/XolnTfbDrEAGHkdr3jnhLcsbMhqjIG0H3PXwSRSXcTFiVhBSOGAI6ewMB1oW81fvzOuJMmlk05LYlRSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812153; c=relaxed/simple;
	bh=HltvsgB/V32MMRgrH+wmQKGVLrI+i/tqgjQTY4Hm9Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLaFKMT1AOMqmzvFR0I250451KO4auf10ePqcQPb0cP0JeF8fJOJs9Jt5UVcI6YH38dp5Z/BHVw7mgk3ozg2P2v9sPhRDM56V8tqFZkZTbTDYn82wRWBxK0IUsuRFQotx3HuqX4kPRYa+/jA8404IaOFicTCGdmG8vdI/ZKUZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEnu/OnA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSKvvwhe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEnu/OnA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSKvvwhe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FTE1v3748529
	for <linux-remoteproc@vger.kernel.org>; Fri, 6 Mar 2026 15:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=; b=cEnu/OnAC1cBRLNl
	4oQ9YSwsZrvBAX9vdKjIs9IzdOxhYHFFQ0EAkTpagLjsb1DfxR5yMosUQ3mz5pDo
	S0lStsQEKOV0jFVu6gcYfnTboyaow+s2cJOaGYaQfpvaYF+RmDLZPh/Ec3Q4HHzL
	Z4ms2RHS4O9mHg1ZDJsSdiKGKAVEjPMiGp0rVjpjmHAvTmzI7XmKLHrZcEGy0R4O
	1Pn0H6H086qujpi/XmdmZdKzDTWEaQZJn0ctv0+8fOqWxpWuTHXaPT4sSIpbZi5c
	jEt096fLWsPp3uPV3vFuKCWSlMp0pyiUXcI3mQVepsO1b163WXom9joVA8/cXTl/
	cA1vHw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09upcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 15:49:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1275c6fc58aso17579829c88.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812151; x=1773416951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=;
        b=kSKvvwheaYCL5qs3+i5/BvfecewIjzCRavjPYMdGGQmXchcsbabCeuCIug4SFzfhPb
         Aud6seKfQKmfhB9N4mNo6/1aq3P+hcCJVOhXi9TROOZ1IWGxBL3c+bqzJwSajPlakodt
         qV5sQ1377h7TDQx8cAQrYQBLXnDPTM5D9Q5ObtQWH/XDgEmwz3xi7jjs+Q3p3pgf6xEF
         pQXAtlCgRc1fdac43qr1VFguXWsisLs7sw/XwowqDeXu3/i0O9ZQwgFNmCl8jEeqCdOr
         IETAKnCN19M6ZypPuQvOS9BI6laD1a52vU+VTcL2QPgZqd5yl8/vC5b1VMdPwe8Ev59/
         bU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812151; x=1773416951;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=;
        b=Rxuqe5ihqT3ER6S3QCDU8hnb1VV8s6tlY2RB/jQi9cFy831MJJcvGv+G4yo18cx5AV
         yupvRnEnqdv5uH3vEski5FTYd9eGHZRBXuTYbH5BkzljWgPn48GFxFiosLaaHTT5xtqU
         NjLteqfAf7c1Zg5/WVn5wFTawBsC17zF7kU87wflkf/jWOfNJK1V+dpNYJXH9wT0szwF
         B4o/lNTRxTv3dxXkjOx/f28f+tcgj3K9Ni6mNo/66gqFDvlxHXOBl97mvDDqtszI228q
         S2r+ZEcr0wdq3HKJyN65pAQ4hzDmqXk4f/fML8FTY1PQSUZi9vv4yfOloxSMwWKS/10X
         QQhw==
X-Forwarded-Encrypted: i=1; AJvYcCWVTsO8/qTHdI4SOhc14n55H2pwOhclApzD1v9yhUkbr47ayZK7o7Brpu1zE6kGs/jWOreZSEmDO1QNQ2FEBRMh@vger.kernel.org
X-Gm-Message-State: AOJu0YyiOrJog6N1p6Cbhza7sAcWAWuI8UW8S1nuSjf5w1330sUDKfhT
	44yjNbA8eXB1mXSTP0mY7NhbSsqok5lDPFEjvxdM6ZPZ/yfPgxMm1l5MY2/0K+bsH9zyPkWBafl
	s8FtITcBNzfi/Op37JkpM4loQrZZREIMnuagV5/IbGpFCMcGldgKe9/FNgzLWFSxh4Vd8vhnx
X-Gm-Gg: ATEYQzy0VsnHScl6YlHU67ySS10agooUXN9bkviozPHeHp60DUQCJHN2Ev+n1wfVySc
	dYMcDw6w2ry7NFm85dDfUWaPZuQ9kyyAiwcej1MFfacwQiMP4ixd0cSxn07CJI2G2MNRmemG8Tc
	VVO1n43Gsd+ks7swfFsRlnbgzQR63hFtox77hND0R0tDIsR23L09XSWS6l5nqPrmYyRCxm4jMAY
	+OhIa0UmxQeUDgH/xsqaGee2v0BCi8h9tHH8mzalUcIzc7n379zr8PVzfihEZWwkOGvDENmY0p0
	1BU24V0PCHWsoki7dGOmg2UJZqRxIPclIEZ2fQXLJtDV3INdB1zPUNWt2PNNIujWSgT9Rjs9dRw
	/Cc6Qtr/epTJvj68Vx//3tijQ6gvm2e8x0310R07mBpvdLqkU+mwDRphT88LnlQS0UJHMFJBHpp
	LclQbIQom1RYT22w==
X-Received: by 2002:a05:7022:6898:b0:11b:e21e:5653 with SMTP id a92af1059eb24-128c2e0c967mr1056284c88.19.1772812150843;
        Fri, 06 Mar 2026 07:49:10 -0800 (PST)
X-Received: by 2002:a05:7022:6898:b0:11b:e21e:5653 with SMTP id a92af1059eb24-128c2e0c967mr1056220c88.19.1772812150163;
        Fri, 06 Mar 2026 07:49:10 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f58d24sm1497977c88.12.2026.03.06.07.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:49:09 -0800 (PST)
Message-ID: <00a7e65d-aad3-4029-af51-ff0870e65595@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 07:49:07 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260306105027.290375-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c4jEheGmipXgocRw4lD_kxDigLWtTR-i
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aaf777 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=PJDN-9afRshu8rMoDvAA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: c4jEheGmipXgocRw4lD_kxDigLWtTR-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX/JEH1YE/KFAr
 LRS7797wiQW73aZg6xJjaOYql3Kzg+kO2yGmSFmRsqj+qhbD7eHaHKtslYwOSGEiiBn95Sq5MpO
 YmCDfR9HL+84CqctAPrcUYS0lKHPmMHCix2DxJ0mjDeCt0x1tweB/DYIBCvyqJF2ZsmVxQaBECt
 EFLfytGYWZkpslCSRyC2AH/rVw49Dzll6Sh/n01KsbCs44/7IENrYcqhl7XuMxQP1pwrzObEP5j
 COJxQwfP+fFi1PwH1hyphCLGHkmulV5/TiKp2DJ2ON0RBQnG6qrzEgg9Zx78fYkMgqnuVj0+JyI
 sZrKktatkBJ8PHt9pJdBhM4GocW8BmJsjnBGrgv3R1a+Qed45IYHk7DIxa2Vgfp/qOIZLspUL5L
 MGILno7jwjwGij93NxR/fY6Ze7JpqZCkYq8rApea0x0O/JYFtpgft6nTOZvKqgIfLZvhmEjQrr6
 zlGYYkcTBwTkfs0ZwkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146

On 3/6/2026 2:50 AM, Sumit Garg wrote:

I missed one k-doc warning...

> +/**
> + * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware

s/scm_//

Warning: drivers/firmware/qcom/qcom_pas.c:173 expecting prototype for
qcom_scm_pas_auth_and_reset(). Prototype was for qcom_pas_auth_and_reset() instead

> + *				   and reset the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return 0 on success.
> + */
> +int qcom_pas_auth_and_reset(u32 pas_id)
> +{
> +	if (ops_ptr)
> +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> +
> +	return -ENODEV;
> +}

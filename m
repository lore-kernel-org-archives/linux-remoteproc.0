Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0022F3C31
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Nov 2025 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333863; cv=none; b=ujxN9aviEZ4Uu9ziIwfetlznI9xH79y7x5u4/qSXf9+Ajf2QPNDVfUPze4W+3ndx4y5k7IcrBnVsZeURTDKxkl9Aafqg1Id0G1dgdPk0ZxgEScyawp4kqx3jRrJ7arVMGTuIgC0/3Vp7LewgH01kZk4RFIvLcOD89AvLP2mn+TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333863; c=relaxed/simple;
	bh=ymF0tfM4u2SvWoGHJc2mLhZccjE8NKDBOsISnM4qyPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riKCAZX/8Jr2ORMvhsTzsdY9klNj0KkTUuzwxsbfbnnpV0fDlw+kFSGun0tjja8aLrnNcQ20CQRXbLWkoCUqhAKbTbm186hcE2+146088PpEj5jIw3HmZieF3KNGHiQU6DGBsoVHMP7T/pfiJJ8FbxVrcDGQk7OLVUINxtGnX20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoIAx0a/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVh6vPIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoIAx0a/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVh6vPIl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58Rq353114769
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Nov 2025 09:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCW9tJ4BvEY/1LMn8PhBqu0RVJSBHYZUAH3w68oicgY=; b=AoIAx0a/jq4igDaN
	z/BGuapi5xx78jG2BJVo8GsesdYQEzIJ/xYdtDkTTvR0ieKeCOeq2ZSuFieJXj/d
	egtAlWy3JcKvtpbDMV9U+lI0vZy+7JYeToZI0FAxgF79SuWXcWvDymSUMY2hyT+O
	NRzCOvn4ryeX2pagNXdtt2+om3SgwIBVmoKqMj9XrG4RW+SGlSbBUbeIv+QjyIDZ
	U5CKTPuhE6CbCctVWYtTZoTcxkYdNj0HbjbVJVZLPi+Kx/Plg558+AXi4Res+nEo
	Bz/UN2CuUPMcaLrpJcrh69OjHP3KOz9unifQnqrBx/8B5+oDDuo9mFmtMCrfWqqi
	pZZOHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7sfdspx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 09:11:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1be0fdfe1so49492185a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 01:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762333860; x=1762938660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCW9tJ4BvEY/1LMn8PhBqu0RVJSBHYZUAH3w68oicgY=;
        b=LVh6vPIl9mV0Vy5/LPMVtwrfCkacCCbuxzyGsbPiRcf4s6ha7ihKA3iqB6D+dY+nQN
         ZflbmF9nC3Ip4FQjQNMesUVb8Uabu7wTXuqcO8JMzRCCqzAw9gvl6mt5tuFpDqcou0Jh
         SnZgpEaRK6wTF5EtR9uUzC7/pcZlnGWW+3TxYRu3P5S5CMsIp4fB8uTGPEdjOrWoXYLk
         rk6owpaI/38kfKjb47CPYhj3yL205dGwcTtPVf/9oOrsDAwXbELiY3O0HR/p9RH+4PV6
         iZB/TWpVeR0cfX98fALw1iZNoq91stTf/Xs38TGXrR6YZbQKO2Ob/saqCKnTPYP9pZv8
         vedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762333860; x=1762938660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCW9tJ4BvEY/1LMn8PhBqu0RVJSBHYZUAH3w68oicgY=;
        b=PvK8h26jNAtD/L8JfeG8diZy/3GicbOtNmkSYw+IkMOJnle9eArvyRpkd+RSORuHgn
         N5sXbtsYZvMinZ9+fNQddXOuViiQGWrcSYThsAXEFsdKiPNWgHinri6r11CBW+C3ZpuR
         2r3/KomxGQ0Wxal4r2gxycEVF/RtWLclkjWOrpLhn9XG0323mNRxomSH5k5EJRnyGUyz
         yszaC/X2od36J6MYO169vPz5SFxCOT0FfWUB8DnuQJv9Ug22v6XoEhteMQTWluciWvvU
         9J8vxc6gJJMDgAr96g2Pvv38Efm7KIcb8F4ERvC+7hyTyQc+AGaIUcjoUPTk4xwtTqgV
         TkJg==
X-Forwarded-Encrypted: i=1; AJvYcCWcWlIzSASeKIk7r4tR88hnX/6AhHNjjU80wOPgp26OcCnPCYs7N94QtiU6OeEHH1Ms3UjGGB6XDDEeBJ+0dDlH@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3P7T+dapzlZiKhGTJwrdDzT2zmxw4yhPWWTLvNqm+mGI+rDW
	2Ugh+yap8v7qRBNCWi/ISwt4QpyzPhLIwNVn2i+zDLxYbyZLWwFI1AZb81a0x061rkwDWxz7+Sm
	eeX1bageiaB5w5/2Oka+PagqK4vq5G3UwWP8eA4qTa05UbSAMELOyn9J0vWx3utu8G6+ws7Ns
X-Gm-Gg: ASbGncuI2+HVGyvyJSIOgi4BKMxnQxcMyrGZBl0ikmj+Y5yLFcFbNHWZhNZvn3sHyLl
	75fsvDN5PyB/iJg+MEBc9o9ie8qAJFr4+qQFJc8wGkvdGIaiSYgHmXi7ePR5bUBOp2145KYj2hz
	fSGdr47H/1CT6uVqLAthr6v2wpcAGkgodfFRoWdz4WplJFq9J4L4kPiA21Viz3cJdH+ANLmPzTR
	9EHwxv/CPYlFIt7KwbHijR+ImA4kfv7QdWvyRnK7qfSerpyv5MH3EzYkMSMyESFIK47Ty8eT1fT
	0Q0XeYsjYUsWRgaHGYr4j5gTrdv06v916gxlYDwIrpFEVYeQvXzzype/gCTfNZkwFrNpCyPtfiu
	PNUktnrffTxVNGUwk6NcP4LAAjS/Fjs0buVDoN5hT7bYM/Uppl7xjPSnk
X-Received: by 2002:ac8:584f:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed7212be7cmr24340091cf.2.1762333860112;
        Wed, 05 Nov 2025 01:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWnlIzLWzdXzrCXM2fscuvqw2ZiRnNJleeX0g9kOp0j8ErvOz8HDHza8o5lI+lsGnLS5XxaA==
X-Received: by 2002:ac8:584f:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed7212be7cmr24339861cf.2.1762333859590;
        Wed, 05 Nov 2025 01:10:59 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm438025266b.54.2025.11.05.01.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:10:58 -0800 (PST)
Message-ID: <2c9c3a85-3702-45a0-81bc-f6464f8f02b5@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:10:56 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-1-7017b0adc24e@oss.qualcomm.com>
 <0608ca9b-083c-4929-a4e5-7d76b2590637@kernel.org>
 <20251105083402.dvm2w7ezp7spgtz6@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105083402.dvm2w7ezp7spgtz6@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ARz_7hv36kXgBXfI5r6H0VK0gFP6jZgP
X-Authority-Analysis: v=2.4 cv=MMFtWcZl c=1 sm=1 tr=0 ts=690b14a5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Vp2ZucIk61sbSZnEYCoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ARz_7hv36kXgBXfI5r6H0VK0gFP6jZgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2NyBTYWx0ZWRfX38rR+g/mg/tV
 e/Aw+Qcb6256WKX19nTDdYMiCfJQ1beVexVt3Om2rXA5XtNakmv+NXqGZlFMgy0gRjlJoYbT0ms
 LG0v/d9Mappwd93fHewJZtM+wDxfl9wO1o3fLyJMi9D76odAvXT46D9GiY+TP3D5eup20RGwDNq
 opUeUle/+JQ+cf7VJ8qcGq/EMQ7hEgTApTHi67exg8aLnjGkxkU3CIK+GOEe/ZCCX5+L0hdotnN
 3XonkrT53t/x9akE+SCXp8uMQgGE+xvBSUqiB1qLX0PT+7DuCNaKtbJ3p27sNTJWywHx1ylOl/I
 39yc9JODpw00tL3el1Bbob6Iv0kugfsoiZgXBXhGRvv2te+4XmLOvbejSJ9MmRMADG0AU4vwerg
 vhFdnearmg8tcLKAfQkfY3NE81XVqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050067

On 11/5/25 9:34 AM, Mukesh Ojha wrote:
> On Wed, Nov 05, 2025 at 08:17:14AM +0100, Krzysztof Kozlowski wrote:
>> On 04/11/2025 08:35, Mukesh Ojha wrote:
>>> Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
>>
>> I don't think that's true. Washn't Gunyah something new? Like since
>> SM8550? Look how many Qualcomm platforms we have in the arm/qcom.yaml
>> bindings - for sure most of them are not post SM8550.
> 
> 
> I should have rephrased it, thanks 
> 
> "Qualcomm platform which feature QHEE based hypervisor or a module in Gunyah
>  ... "
> 
>>
>>> configuration for remote processor and when it is not present, the
>>> operating system must perform these configurations instead and for that
>>> firmware stream should be presented to the operating system. Hence, add
>>> iommus property as optional property for PAS supported devices.
>>
>> So which platforms actually need to do this?
> 
> As I said above, almost every platform which features QHEE or Gunyah
> hypervisor that support PAS based remoteproc subsystem should have this.

For added context, QHEE (pre-Gunyah hyp) has been with us almost forever

Konrad

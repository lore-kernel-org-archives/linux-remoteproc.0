Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26043153800
	for <linux-remoteproc@vger.kernel.org>; Sat,  3 May 2025 05:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746251542; cv=none; b=pHqbsC3xWmeQNXbz34A3ca4kMKbXvqrpugC5WgIS9PYQDRjEN1PRg85upzEqPdQZ652HpIlNlnq89xeVyHVnKOQsmEn9BYigExyq2vcARnMZLr4RRPd3xsdXU129XvwaOWsXWMSQmIMa9PSbIwlL/YdY9YjHrWvZnJhfCIUOe1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746251542; c=relaxed/simple;
	bh=kTzbdef9BeFuRG62UXkxiHxI+do/LrEhk/zWjqxWnbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IQ+hwtgNrWoWeIoN4Q6hH0w+SNTLbukOAZF3IPzhT2kGRoZ+Wi2Xf9wS5hprWXCwwA2HQ+7dCiyCFtSEczax9vAm3zr4ywaabywEwlIoUBAlkrgn0RS7Y3vOOE2UZmkP3Ap/2xzZX00EE3yEEmqCdQvDIO8VOTsSPPZnnZQtGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF0QnWQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF0QnWQo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434vuQk032500
	for <linux-remoteproc@vger.kernel.org>; Sat, 3 May 2025 05:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGIyRq2ecXxR1vaSsBOnW52paZ1NEgH9yMTjrR4DNNI=; b=ZF0QnWQo708kR+zX
	3vFxiNYgM8YFncFOYwT6JJWPcR9+VCNsBCHTqcDj2br4hw0teK09bl37z0z1FOWU
	vQsMtjhw7Rs3H9H8REsc5N6rsJo+vc843M43kwtD4sTNd3NkMjjtA74prIaoLVn/
	TY2Bx3w3hXNww21Zyt76zfnz3Zl0KPwKZ6/aQ6jeCwdkkaf2+guOG4+UTt91Si5O
	+MrlfD5RFaHdbYar7+gkVj0mZZ6jdteKFZrNezXj+8apvl/mDvHVq0XqgmL130W5
	rO1ZXp4vPOGHAwgEd0+huO+ywZNZeI0ytNkDddeRrHRxYtPDXG/n3pixZvmHVIb0
	OHmwEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55r7hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 03 May 2025 05:52:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-48cc1907229so22880641cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 May 2025 22:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746251538; x=1746856338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGIyRq2ecXxR1vaSsBOnW52paZ1NEgH9yMTjrR4DNNI=;
        b=C8TyOnGSyN++WFz25FrefWizqZeo58elLl1M6MOXmgehTICJ4JZTB0apaoboYy6yVi
         hrjxKSxcwfyvXLkElCtTZb7QLAS6dPYUA2a2cxKe6DAaPBKKUuy49V1BwtBjNAN3zf1C
         xPVLLZpw3bl66e0uZfCm4su7AmLwyvP8UwXgpZCPC504ImX3/XMdI9wNf4T1agybtgK4
         RbX+fXmU9kr08PTnWuJeBB3VhBP83IFLYeIOs456Ky/qq17qOxEAGio6Xa8DhWjQL74E
         YW7JfxwU1aLZ2wemxIwTKBmGaq84pl+19UoORhJ6CcnQD3wlwlVPRXlRbIwAr4ofgmE9
         4Pcg==
X-Forwarded-Encrypted: i=1; AJvYcCX3SVNVGd8Cs9QL1+nrHPm1eV6lQgutpogbP9J47bfr7sUP2pW/JnWGIdXnVdgYVMdOXJTnLOeRJahGyGUfeQnu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0tWmdxbLwXfoDh2izcTdfXGFu4fCzRpu+8XBZcaRDRkfVgCAk
	XO6+9rCE3TufigpPOJ7fj/onQRkjEX+mFlJJRKAyT07TFegw3b94sSGetRlR6AVY3ADoVu+l1Xs
	4Zd6AyrSDMkCdk6nfm8DEL/p9HYN6kukbBQu5SKVajGYP7ZOwfBWmAp1/cgf7uTbOG/aY
X-Gm-Gg: ASbGnctd3sleyLtoX8SUZy3EbX+sD0F7zlSkuA6+RwU0CTt2qFWaRBBVxLWkNow0a3S
	6wbcibJ7Q1HmQdGfrJO/tJaoLMa7oMDAhY1/QmfmmMhLvFfJWMLcqzUsCj3Il2fooPsH63bxvc9
	d0A44nscPn8gBoPb1Fu/zY7wuJHBoXsJzTb4vUt4zGp14boBPsS1+LTnonfA3btGkQ0KaDJqwZa
	lk1dF/IhrkvmEul7XlaY+vZg5w1ohKUEeXkUYKDO+3YUF+IumPYPN892aZ2N3Emfk7DWbRgUm2U
	Syryp/V3ZmRHfyyfjrzfkzCaWZLnKZmtmWqkO2qONlyi3o03k+YT9UHgyBj0zMgS14i9U6LQhZT
	UgkhSiEFVZP40Dw==
X-Received: by 2002:a05:622a:2c46:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48c31738b33mr67033121cf.21.1746251537983;
        Fri, 02 May 2025 22:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbq0yURxq1b6IBudPe8v/H/lRmlWawgrLJgdxW2ynKpNHdFhZe54xgLMAowVkzIsAb+lDNkQ==
X-Received: by 2002:a05:622a:2c46:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48c31738b33mr67032891cf.21.1746251537659;
        Fri, 02 May 2025 22:52:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b382c2sm6404611fa.2.2025.05.02.22.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 22:52:15 -0700 (PDT)
Message-ID: <9b67b7f9-b85d-4432-8a1a-3ed3021b68cd@oss.qualcomm.com>
Date: Sat, 3 May 2025 08:52:13 +0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
 <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
 <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NyBTYWx0ZWRfX0LGJri45OWd3
 OmFYHAMDJKvTBmZtxh8e5kzeMF6DETeFUVLE4e88254yuj33T2cXHG2Py7xxZ5j0gDuXzAYZ3US
 1+pRKkoJ/yUBsjzYSikxUbdiaqm6sUtkECAlSozhekabAJ80z+mMgw8FRxw1rjvM+exRIUR9G9o
 sMnyEsToNu7afniPj/SOapPB9KvLIbtnG+eqn3xPVlBrw5Ly6JKg32PMhiBOtkoPF5D6KZw1SUD
 Kgrth7BknlF06RDYX64yLo2HvvIoSP7XvAqLxlRA1gINESWC/jE7J70Dsu4wZKqNeI2TxetrcNN
 prKn927N1Mzx7168puEiBh+n2dNswztbvcZayWaosgTUi2x0Dl93yQDk8GvcGw0++7SuG78YFtN
 3NGGezE9X4wm/WVclZ9a/w1pvkjH/5a5+Jd7JuYcITWzkkl1FYl/z15TQ2eEegBuhKf3y+z5
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6815af12 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XEXn59ipE5wXcr2suqoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: XwFTgqcxq9l-tYziIu-aqqVhLSA2y3L7
X-Proofpoint-ORIG-GUID: XwFTgqcxq9l-tYziIu-aqqVhLSA2y3L7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=861 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030047

On 03/05/2025 01:57, Konrad Dybcio wrote:
> On 5/3/25 12:55 AM, Dmitry Baryshkov wrote:
>> On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Have your tried enabling it for X13s? Windows drivers provide
>> qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.
> 
> Forgot to mention, it powers up and exposes the expected qrtr
> service on the CRD

BTW: maybe you can include relevant DT parts for the CRD so that it 
doesn't stay unused?


-- 
With best wishes
Dmitry

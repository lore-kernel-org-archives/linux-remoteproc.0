Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67463115A1
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Feb 2026 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114488; cv=none; b=Qtrnmi3yVt1qiQnn8vdwpyvdPdALsOGpEjf0RrJyb6wDtZqphuOJEiLXONHNqfcvRJLj9GzDd01rF0CbBeXwLL95dAnlohd9AzTK19rIkUZjyVR5PRSZWW7AzovDz4ZLYBECCSP8Wii6cpNWFKToI78qiHUoyjeC9VUF9CovJJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114488; c=relaxed/simple;
	bh=IZmc3SEU+JXFNOUEdmhc7G7Tab94NNzU+1IrKz4cTcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQAD7IOHiB63IuOK8ixvajAfs+VqsTVIIOHdSuOMGOniiIW4KKU9WyMSgFvSPs3ennBLnS7xfwpWDpGzZsuQlANgCw0p6ytuW8EKYiiJO+QLaa4jwbmNqZB7lsX7aChs/LLBNnX+xtnLLdxvfsb51kEwCZYN6o75IR7sHDkroGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f11luKFi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aG0gFpig; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f11luKFi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aG0gFpig"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137PHRL1319475
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Feb 2026 10:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8nfkg4EZOOFimmPNr6PidntjFMUeXDh3zAKFWUrfS+k=; b=f11luKFiYIsllRpG
	Y9gLiJfJ1j11qHcITK188CYdNxAQDH+C+CML4RLeFBWGpql//BZyF4xyPKv3M9L8
	2EtnzWaua21kpmWx6v2juIzTRaZ8Zpe4fxhGNbnspYwsBZrYypmofLjBqjGmRa57
	+mNQ+39AtQ+oWwsg+KYAJiljdJS5Bmt/N7iL64Os83ONCsJKRV9d8FdxPAR0Ve1c
	vIXNNskm5YlkAnd+F5whA3QdvKqxDtwoZtxb9ik7/RVZ+rzy+OQLcwsibmQYT08s
	S84gIuLWoGizmUQTXonO9e0d2/+fJIV3oWTa9Zmib1Vy0DCPwfzjQ5Si+d78yQOP
	ime1Yg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3cm70jy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 10:28:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89496f5086dso17620856d6.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 02:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770114485; x=1770719285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nfkg4EZOOFimmPNr6PidntjFMUeXDh3zAKFWUrfS+k=;
        b=aG0gFpig/4HPWNcxGsIHPkVkd5V9CmQTaR9wzIthjgZ8zyk15Ac0aemkXOq0gUPtrL
         /tm3dGQPOJNciqCaM5TGyumnbZPJLXluoZ9t8/0FXQ6Np7hrj8boPXlsdCYmcXda/Gtu
         dOB9pgEh2In9HBH8O+4RqW2KGxBZlPpkRxmS/v4IrYxeyLxig6JHOyRbhhdsLwM68ZaP
         iI/szMg3FC04mvcJyAc5vp9LYLcFmxbq3alCIZOovVZqgHWEV7hKbkcKO9RaPW6E9Baz
         mGc22KRp4m8GKZCGB9Eh8QF5fsdOuNkTa0c0xB0e+WyJBKKUjIGVvGoVD0rhVgGp/pLz
         jZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114485; x=1770719285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nfkg4EZOOFimmPNr6PidntjFMUeXDh3zAKFWUrfS+k=;
        b=ed+xw+fXMoXvl/o4V0w0BOKGSnPe56Ce7u8Bcig49WXAZxjeozqRDqM4t8ukansiOy
         GFnA9rAlZ2Jk0zrE3j5S5kwVfQVsFlrPT1kx3F2hp1Ld6zvsvAYQvKTPS7HdircBTlse
         yG5SN2fMHe98PkZoK5E5vvTB22kRxndmsTbtxS9TIynGoplki9d0ZxN/zM/WJNgkM9tt
         1BrNy+SnE2FeM1fwCQgy7Nm7t4e3UNhlj6DJrO2bE2vNnbKETsbxGGoZ/2a6bknr8O9P
         W3nXhItvfaYFs/RByeTOuLz3YU9yHg6iUvQwLMyHcpIoOBcLlsK7JMwsnjIsant+F4L3
         O9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcWFTLFKZMjPMDtAQyRlYN3FhoJ5X4Gmb1xNTMAt0o2NQwy8F3C3XIzyn9XgylvJ/MM5eEejeLdzF0GyuQmuE3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7zKsGjofebN3jpvmx0LRR/84lKzJiLvYz+B9j0fpulMromcQS
	CPxEmxp8HNBQ0TIHzv8q1Lrmb7zl27mPR/3R1xIqvAwjNXrVshgpLHBll9EG4yHJ+Xq5TbrKJdJ
	eRwtZw0xy/wHpKHKIeVQv8wT1tW7WLhknzHFP1034oqyULDjEPflZDu4s7JkA0zzKkwBS/geP
X-Gm-Gg: AZuq6aJLniyDazKsP/2Un+JgMn6FdvIprFrptlkYhzuVAk8qioTzKr7WYJA/tLlEqU2
	4fCa+PwuwjunVE60RJDqvIXrz7V+1nNboM+G/DsOnCwrWo/oeYTHELvp1ZsTXGWoxLDFIWOsxtR
	gn/pDJfQbu8h4XlNSJ10ICIbYiop3Rx6CMoHZ38PL0ESl5HazoTa+6kQHGmXCTs6QRlPjTVUQhi
	e2vBE6SOw793DGoheh/bnC+s9I9mVBh/f8P4m+/lho+tuK0vfw8OqS9U+6Q/BNrGnmviylrjqYi
	AW2kBpY3iPNKMGRw9RbIXgouDzSQlJDUIfo+M4n8A72+LkK3sY0v+oPrKkfiJ8C5hN5h4xwFPvW
	v91q0w3zwxwQ6qdnrQ+MY7SIvxDV1hfmdZsGCytrPFPpBnZV/WMi3B7adqHlVqBvSDKo=
X-Received: by 2002:a05:620a:1a18:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c9eb29d0b9mr1488473385a.5.1770114485440;
        Tue, 03 Feb 2026 02:28:05 -0800 (PST)
X-Received: by 2002:a05:620a:1a18:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c9eb29d0b9mr1488471885a.5.1770114484980;
        Tue, 03 Feb 2026 02:28:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de289bdf4sm875193666b.44.2026.02.03.02.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:28:04 -0800 (PST)
Message-ID: <7b5bb3cd-df26-48db-83c5-93718c5af165@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:28:02 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] remoteproc: qcom_q6v5_mss: Add MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
 <20260107-mss-v4-7-9f4780345b6f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-mss-v4-7-9f4780345b6f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MyBTYWx0ZWRfX1KcVOY66t6eV
 e2QRS0s8dkVzSKIWxt1NsDKyAvqx7j9LGZUf1wBwcRJor2ZaqQ6thZ2gBNwaz9vprExyn65O44l
 4P62u/tN4WvapzgtM5gkpuOMPLgxhq4sQVK5b2wd5SSxQFCsQCBSUDRpNE/7dH3FJpYJDFTywf2
 iwll21cQ14HRfzfkp+8QFSswu8kaXkEV8gTNjn5FTQeRuTJIgywHaofGv7gcn29z5FRcMPIfCGz
 iO6RfVT4HRaxUDSkapLsvBW9nanJZJbUHnjMFSbttNWDMPGN/M1Np8JM7DZy8xyKtCYk5X0x162
 HFWC0mNO3ZFXgyX5R2P+u+PU3WRdLias/9/BQP0xCiML7RpI/fo06elT27PUJNPgTNRt5K0KbKK
 1+LC0SZvPClxGc72EIwBg2/K8DH71dEKELU3jp0ARGkFspSnvjnBblKrp6YEhkZIpLa2nBnY+Em
 eT8qGHBP4Lc0+YN3nAA==
X-Proofpoint-ORIG-GUID: qFFCr5WG5ZaxItZsmrUQ-VSaW2-VYvNZ
X-Authority-Analysis: v=2.4 cv=L4sQguT8 c=1 sm=1 tr=0 ts=6981cdb6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=hKB9LmFJ7bMJg5HKuG0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: qFFCr5WG5ZaxItZsmrUQ-VSaW2-VYvNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030083

On 1/7/26 12:34 PM, Barnabás Czémán wrote:
> Add support for MSM8937 MSS it is similar to MSM8917 MSS.
> It differs primarily in that TZ needs to be informed of
> the modem start address and pas_id.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

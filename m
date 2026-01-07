Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5E2FB0B4
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jan 2026 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787151; cv=none; b=XaPEi1QWxAv2R5+Ir3GtVgdkscApZI2tJYdK4qMeJorh62BLhWYUPJotEnyjORt5tqQ8bkwkDzotrQb6KJ5QKe3LOLSbWm6OSCisnMp/NFO0rvg+GdWx90ZG6kjopR0jayUU12YvNk3wLE1Ixa7WaZg9acZw3ZemdxYjUbR+k60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787151; c=relaxed/simple;
	bh=Nzs0R0N3Q0AlY+Z2yi9DOpE1oVO3qF+LrnyUx0GTy7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBKdL+j+T6EeERkIcvewhRIjxw36b7Var9pB6Su6AchhG/NTXyNvJHA3jHLcuvmNiX5EIFbl40KjdVyqmeTkQN0hTDEu9MrfTwh8ykVV3VM3Z3z+d+sfiXCix0DaTy2ZcJAVtisGA35TEESXsKsdIt9Dp18DjZc+ltHbxhg+yAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWPro210; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCgpehOk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWPro210";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCgpehOk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BkYSA1642747
	for <linux-remoteproc@vger.kernel.org>; Wed, 7 Jan 2026 11:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gV3Wnt2gzwOfc5IZFMnIJAz0I1ACnvsy2v/6kWVIIYk=; b=MWPro210H0zTHdS9
	ojeTL4de0WvTwRmRL75VOl9f2M/KMo46VozoEcIuoNWlAkxKartJ6nlfRd6LK9he
	pA832jFm1VIRi1NMKOfyrWW/DnoSm7RzCt26SEAg6fut27c8VzgdXgDU+YesuHzJ
	GNTislyaCRGrfaHSrGdVDC4EPGuQJ5wOOTrACwmGK+F3OYyRmXe7wp30dmdMLxgT
	LZx4cXRMsiY3/ce9nl4NAAJGOYeov1LsBDWPzXRDiOQescolO7b3IPf8uC5E3pmC
	Yvo/MSWvxhGP2UuJQPx8tGapAFYMviOfyY90oXJY/gjaykul4bMO4UDAO1leeNis
	Hkqa7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfha0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jan 2026 11:59:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f34c24e2cbso4209031cf.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jan 2026 03:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767787147; x=1768391947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gV3Wnt2gzwOfc5IZFMnIJAz0I1ACnvsy2v/6kWVIIYk=;
        b=XCgpehOkyAJkwSVY1R5EY+NKFixtmqSUVp+RM9FtGeOmQbP89IT7ZRebTMcCKSxK8i
         7HhJ/1GASXpT87/SBIr4tuACQIIEtw76FXmPt6NLeQdruDZn1KWNOFDpdMpl+AQTJcOH
         dZPdFLA6BYI+SKgDGsn5lom0NVZTMyyqtNH3wfePnWh93kSKl7jGVojn+B/cwsUzCYhk
         4jGcFnGN4OVe6tFwYt+7kGpE4ehoO8jee5f0eoI+OEDVsDWkQ5lT20UgfjQfVFDPCmXP
         zFKjF0AvMoJWjubwQOK9AQz+leyeceTIXPzav1gOAJsGRHdTm33jp2/CXh1YNvT9LazL
         SxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787147; x=1768391947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gV3Wnt2gzwOfc5IZFMnIJAz0I1ACnvsy2v/6kWVIIYk=;
        b=CN5RjSAdtGt43Y2trUq5cxqn9ekc4YOAifnVMfLHCzli8t7I1os/NRUxuIbleZqqMF
         mtDrnHj5Nr0GmB0aPrTzuu8gmApAvyPQnpcpjq7kIwOihdGWH3mGeyHVFL49jIC7J4p7
         4U5LpCU+KxhN6irc0IQ4w2UadQFmrdDfvLIPHTY85eQeEAJBDfGsLsIF2zfHKU621h3/
         dJAL9UpZrc4r9GsJ3HNXZWJqLFZGBFIZ+p/kQCancJkHLpvaMLQG/odGJzkJ46rvOaRh
         Zdc0qxMP2B1k2MdYFjxoJ2DP4wpQu5xi+kjExArsc5X9nm7XYQysoJOWguWFkKOD2qNl
         uRCw==
X-Forwarded-Encrypted: i=1; AJvYcCWtH+bAcCw0itA4POcd3oJM7DmPjHWqZfDfPTtuU3wHAcU/7fWqyQnd3v8I1mROP3SKHpjSQrg+FklzfEfTXGTs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2hiFa/2ZGy5jXWVxKYaSG8CRkNsPVHGNuvuDMj7A5lDqAz3Un
	mBMQUhyAR14TNdWq+GwuJyvTrbyz0Myrgmj+SxnVFqft3OHOpqy8a4l1/8pQULPoK/RhGtG8KZB
	WofxHm2bYOaNTht4HpnTzc9C3Yu3XmUQ2DRwITYtRDkhQdRju5+qRiDx+M1O0Gu12L0nREFgh
X-Gm-Gg: AY/fxX6Z0VFE0fAFlTJU5B0/0Fv+r5lzpDMyzG79cpNuqVxo514Rgi2yEY6BzxfU0L9
	eQACwNDHmEvxDqNipsHpKxzki9bd9prBMODt/UdU/t3/kkUM6IenEtFCL5je0E3C2hXS4+eLSf1
	fx2YjSIyVes75kbDWqRDoRO6Niyqvg3V8j+pQ9cRm/iZ4t0haZeBJtJoMiTk6VNeaJ/7wMJUVMY
	THVz9k5HN+RuLuzpyYqx+J6BEEhdggOXvoa00ie33VOBE9fEFWYp422A1hHypozDPGwEzz+zePC
	i5EKptzYar7Bs3xWSbse+3ojWHyP+oBRAoaIcpyE32myJcTanQXpLimHNnuq9G38VwgSZmh0AN7
	mqSozDZqlRburc8gJ0W+uuq6dVPDFdOOiLl2wAOCmX83JlgHxcpba3olwR66qIMZLeeM=
X-Received: by 2002:a05:622a:143:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4ffb49a0042mr20984751cf.6.1767787146834;
        Wed, 07 Jan 2026 03:59:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKZZG7Sdrw059SX366UVI3GxTlOEgOt8NOkhZpSPzMzFqHGxHgW8IRzMlzz7ojZRZeKVjBSQ==
X-Received: by 2002:a05:622a:143:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4ffb49a0042mr20984581cf.6.1767787146408;
        Wed, 07 Jan 2026 03:59:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a233fdfsm496814666b.7.2026.01.07.03.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:59:06 -0800 (PST)
Message-ID: <b5864ad4-e963-4427-8b3a-a1a9df40583f@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 12:59:03 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] remoteproc: qcom_q6v5_mss: Introduce
 need_pas_mem_setup
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bod@kernel.org>
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
 <20260107-mss-v4-1-9f4780345b6f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-mss-v4-1-9f4780345b6f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MyBTYWx0ZWRfX8E1ZwQ5+KTq1
 7ARGqTiTJau4WH5pM3xZfy0vhTQUF1FDfDHdL4aoaRx3knQgywH9siUbFB8EN47YpOHRqCtsdp+
 xrxiznyAOlrBPslu3xppnlEsgPWxfBxoDh+vyKU6Cd/+HicKsvSUD9YG+oAxph41Ow7tbRlqvFw
 0k9tq0GS4Y8ReQqiZa4kaCBVULHlyhT3q/lynXJ4PMHKk+ptnHiKO9nA1DO9X7URKuFtVrEOp8L
 TUyEo8oh/IEDGaM0+UvBQPDGRhvXuSVyuS8yjgK/oC7mWutOPiAlWmARWgGzB0D90khAstP9K18
 YpOQphjaUHrJZwycx9cddap1t27fUfaHlPKm9FLGZ6ziodgMoxuhsJWKimwg6H8w93OJjGNoQGj
 t5Fn6/ZCTLE4xeSIv3/WiZUNnF5Re/fa98qMwWy3AQBSDboqToDSyKG+EUMmyZ7+TvjXQIEGmRP
 vifX6O6H6gw0bDPNyJg==
X-Proofpoint-GUID: _Ekfif7VogViUGzcGyVx6U28yFsn9qtf
X-Proofpoint-ORIG-GUID: _Ekfif7VogViUGzcGyVx6U28yFsn9qtf
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e4a8b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=-qD3kaNgZwzAn_lfbCoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070093

On 1/7/26 12:34 PM, Barnabás Czémán wrote:
> Some platforms like MSM8953 and MSM8937 TZ needs to be
> informed of the modem start address and pas_id.
> Lets introduce need_pas_mem_setup flag for handle this case.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


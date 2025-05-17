Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD6205AB2
	for <linux-remoteproc@vger.kernel.org>; Sat, 17 May 2025 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747501165; cv=none; b=MfwXVyKZrJZsG1jjns83cInCiXRC24NPkK+cPBhFOXooVF0dAK0AOYWOtCnm8JDwFTDNPTwY9tlT4LS/t15aIOeEToI/tefAgfIoyvtoUFUmEZ8+tmGfgy6Mzr5RTJ22P2tymUT3YZehS/LOTzNMc4aGqFSd5C1MNjm8Egg52ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747501165; c=relaxed/simple;
	bh=Y+98pIFoWWHfZVf0d45cDKgsJGJTFlxxmrg3hMKxyZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uClkT76z7+mv3z3BI3RZVfBVqpYC/VgvHS9B4O3/DN2uySlVsXN/vFtpAWxPE3XRkgO7C96cqRm3waw6rae8H8qaiF+MxQ3RVhlY3hYNzPLq5Ngr0IaH8fyPWTJNX4SunPvZ2/okxOEqDGWhAAbOuBoCwgJK4e1jJMNDdGQjZQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfJR1aAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfJR1aAV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HFLgcd005354
	for <linux-remoteproc@vger.kernel.org>; Sat, 17 May 2025 16:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VduflDMyjCo/QhGhOWqCOg92D4iNKsmXtMKiBxwuk+4=; b=lfJR1aAV1p1ip7Cb
	3TV0zaa2OkhlifkTqk1SlY1KOpl9KwREiBO88OfXhy/cmjdabuEzbV1+BDcVGK0e
	VrlRdE//2rnj2G9f917h5EKGNJ4jhNHNqXhDV1vbRDnweeCLHXEueCxzi9OIzZbb
	x4QLPVbY+JAasWAbfydKetxNzHdjZGGuroEnDj8aZ6kRIn9bWjD/B6w9OxD7tN2i
	JTJ8sd7J6jUKPJYLmekIPemQy8WkKNJBfzmb9ayHIhMOqw8p+fZnV50tM9iSP7cr
	lW99ED/1odFosIx9KJDfA7qgg/XpTKNW3e/S8r/8bqIbKTeEUXPLCQN63IECA1+B
	JilCIg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnygwen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 17 May 2025 16:59:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8b297c78aso5299686d6.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 May 2025 09:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747501162; x=1748105962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VduflDMyjCo/QhGhOWqCOg92D4iNKsmXtMKiBxwuk+4=;
        b=tzV4AdQUtfJHsFcZsWhF5TAsEkHxSGjWCzoseN/UKT32U7UzAh15mLtQ2WR5rn7aYw
         hc/oE8+6gvOuB/0p0vZl4SwK0QAviCT7J0Te3aiSZ3lrF0SnKd3kjq09k3hRYNkD/4zR
         uJWBWMD4+TygTb6pgcZm/Kyjaw97pUIVzVwzxyosDt1dzglemiU6KaSk4G45DdpCWtG4
         NABdS/foTokjOfWOym/zz839TQDEBNkVwIsmfmaBld+bHQyg3rl+mN/GFuBegjyjqMiC
         +Qng+TgIJwo8o0EmvgZ7kcd2jPEajOUHEwMbe9CDwuXDJHgW6e0oIkMHEIk/+g5g5mI2
         NRrw==
X-Forwarded-Encrypted: i=1; AJvYcCUrBOZb+jjLZHesOtluBbI5iqtupoYzEGAO1C4ftF7cgJvMAENklHECDUGd3ZsLBLL3vHNpyomF/3wnpTz45YUL@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNw9zcu09L5bbuWwmN9nYct2sXCJn5O8Fg5E5r+xrptSP3vcm
	uiiRVzcCOJRo+leCYRobsxNeoVezrsPS4oiZnN2Iby7XvKyeupjuv7yi7dgF17GR0zt3wRmjw9W
	aQDHVkr5+qFMmequ/ytka5NPG68NaGA663M08IUTGa2QTV6ZePJOtzADQbYGgQs1Gv+JdXGKk
X-Gm-Gg: ASbGncvLNB0LZ6YulL+vT3D3Wd1UfM6SEWBab8aAuEQGiEAbUv2lzZL0cVttVT2FQnD
	BrpxMMhKEfwLQ10/6DwxLDYvYslj7au0GgD4EnUzI5RA25P6e32AvOvbhZJ+AAibSw0sGGQfhlX
	lIBpqr2Otnt6ZkyghCr/ktQ2U8g9h5y20QHyQj/cm414M2JU/Fb1o1P6OYRfQtaUxPMfLlJGAiT
	6jpPDas/sLmf3yTiASPGPhudrseIoMnzAaT213CpgfAO3yHER4TwhRxLazZ8ko4Xm6M9NLFv6Ps
	u6STR8M4/BYteBTlah5qSZc/wlXpICn9kpatcevJFtz85ex18kMNd/NjaZ0AcYFkKQ==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr24099761cf.12.1747501161658;
        Sat, 17 May 2025 09:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcjyJ4llDUii39E2slq+4BGvQ/rSC1M/Cdxte2Ejxnl9qc2kSJxoEbQNaWLKhx22SyiFqVfg==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr24099611cf.12.1747501161253;
        Sat, 17 May 2025 09:59:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm321997666b.69.2025.05.17.09.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 09:59:20 -0700 (PDT)
Message-ID: <73a689a1-e8a3-4417-b0e6-374ec9b091d5@oss.qualcomm.com>
Date: Sat, 17 May 2025 18:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
 <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE2NiBTYWx0ZWRfX/oD53Hah+pj7
 KJi9X8ar1B/m/e6xqjYkioNmywZ6ZukMSgWcd/uko87pQN7ssO+TUax7Jje9rvxwpa4TeFkfZOP
 T0PwISoduSGot3Mm+Hz3GV6INmGxeceKjp5YYR5WHch5mOsPVhyJgJs5/MctASPa4CeHOIZBfYT
 0gNuDOs6UgUHNyUrWvphwzOf2V+cHJrC1mv2Zsh48decmAICi4CzJ1KN3GWQc38eQz7RFhi7ISa
 CZ5VuJSWN6Eho02f0JRQASDFNNEGrryz+B3MI5kXT7ZFahQZd9QkFPs7jvyp4xev4BUBTgTtvKx
 6MOcA1ms9FCV+V6whfpvYUUnJdspZ5PvATYQ/raputyVJAcsqd37c/jXoxyuKhu/GipdaoJJk4r
 soMJnafi2C32nGeU5VxYNWEkQt/IEnTk6fsRJtXnihUmhJmMdTaGILGojGdb0ivQi14Dnl08
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6828c06a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ikgdCv_TlNYNit3QsnwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jg51ooLZ1qgdazThwmZ0Es5EZabn8AwF
X-Proofpoint-ORIG-GUID: jg51ooLZ1qgdazThwmZ0Es5EZabn8AwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=753 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170166

On 5/17/25 12:11 AM, Dmitry Baryshkov wrote:
> On Fri, May 16, 2025 at 11:27:06AM +0800, Lijuan Gao wrote:
>> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
>> remoteproc functionality.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 86 insertions(+)
> 
> Is the MPSS not present on the QCS615? It was a part of the SM6150
> design.

Hmm.. good point..

It's surely not there on QC*S*

it is there on SM6150 though, quite obviously

downstream ref:

https://github.com/ianmacd/gts6lwifi/blob/master/arch/arm64/boot/dts/qcom/sm6150.dtsi

Konrad

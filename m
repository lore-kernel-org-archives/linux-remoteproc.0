Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60ED3C9EE4
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781149; cv=none; b=rU2KseK/nSvMGcGlb1RTSBZBL/J3pQqS0hQrs+SSebQvockuK46ISKEulejQ8Gr5UG1g6R2kzgMumNG6eEjZ0AJKVwA+hb1rkiTzsSfUfocXuFhHdNgH6vkjc/EULaHQ4do2jf0LBim9wMCJo2DdXOmnDaPxUaNpTR4DFD2eGQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781149; c=relaxed/simple;
	bh=jYUeaFDseK5Fp/dghgWSFxLEk0CVbLZJPTFDMbNLqd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzoKyMtw//YBUlsL6gH3nBWJ/r1D9ADQWa3tzOnrpvV/MajGk448d3JqZ0ti9ZD+fdVv61k/AjQ5g3kckKMbtUoDonbCHa7n1ZjPhFj/0ABRsxol6B2IbZLswRQkIj8vN7/NBqxrrzyGyRzRCSRxyfh+EeZnl/aE9x/gCFadSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cx++b8XC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eL1Wo5KG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cx++b8XC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eL1Wo5KG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q1XGEo3603952
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 07:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCbmsmXWy3W9IyGvQLLiDoQQ9qJebEIMsm1jE0eJTlI=; b=cx++b8XCklPhciSK
	vr7SPUArL25TyFtMsFY688yzED1l6e9vNXiiRuGZnfUCIFiJOOffJnzWEYCehc7n
	y7LyM9HHHCK+dSNnRq4aiDdZybFLKn1mPJ/O4qpbbwFbJwniJ5Q1ToNdbmhLZqH8
	WMCq4FzqpfcXxCigDNmwfCZYxZ7rPxvAA8saV+QVS5vfh/echtNWsa8F0uzPDL9W
	bUKF2rPANg+dcmDWY0Hi6fjHSKQE3EAQpu7fOTh8xj4hWKRKbMhu2a59MVoFCMjb
	BZVortQPraM1qcd96N3g3YjS4I1CK8vVaVKofuiBY4YjNYXv3qFFMIuaxi58qLtY
	wz/uAg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqjv8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 07:39:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36865d109dcso9517817a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781146; x=1780385946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCbmsmXWy3W9IyGvQLLiDoQQ9qJebEIMsm1jE0eJTlI=;
        b=eL1Wo5KGgud6YWinsHdOLLIvmKYW8OQoJDV8RbtI+3DzCXRdYvkxdXSK7uzFc1xyBq
         sQrlV4syDSNoaqGBj37bqlvS/kpvVmsIwMqstT8/xbd3Hw4Zf2hfqngq8Y4cYzMxcJHP
         sEbAb+O8M0ibVVhOpZp458FzJe8mtPfObukUQE/sTosGXkkt3djbfAGF8jSSCNSu4vUu
         pNHTSUteqji69GJdw4UWiWGWAXMnZ81g+n7eZ2WokyX6QGSDW6mYxrddHd9dB47U0DMw
         rbgGqE/Rn+8+bWtcA5wceM07PmtsKACbHIF7sEJu05iAuF+LkgVimWp+NlDHm6/ytfEq
         jWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781146; x=1780385946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCbmsmXWy3W9IyGvQLLiDoQQ9qJebEIMsm1jE0eJTlI=;
        b=sFJZQI0dEGg1vYGSOvromYMD8dEsVOxbclKFP9nUyAGdqWTTGlP4JH8pp02PbMyQBU
         QhJoZtsPjaDBpHbIGyx/CcSoU55Xlz737OTV5y2/NVO0yd5QmVPuIhXUrGf+CirmG1VE
         DTOYkLATFVBv6sTFUmuLiJ7IpHsJobbcuDYMWTNIBx5Xz7l4TVW8XDKOH8v98pdooXRn
         py2x3yz6kz3x96cT+TjHNsyy0R31LKZHFg3srqkflKfA/EIXf1Qo/cZbhn6RDsw/Ie3W
         EmyCVQAHewSKr1ryw2dg4cEbi3ex+vhNt0z6WnDbw2JhHJOrpFdNUzzNTXtr16hyqszo
         Zxvw==
X-Forwarded-Encrypted: i=1; AFNElJ/ETshFt5CmAv2gbpPpk3Kd92J2/ZuVMAwcBw1Ircgs7Nmtj4VQlu3D98piLZS/y87G8rFdljRJWmfMzb3ib7Dn@vger.kernel.org
X-Gm-Message-State: AOJu0YzqyD7VktxELRmFzE52UcRzGh6XskGYblGKP6HoZDMicbqGE32z
	T6Dp1kz4sOnkC8j237MAI7ET2DTatoi9ie/bbFknTMMnANgpCrJumN83SE5+skcsyRF6odbcn3m
	M56O9EdqUH623D1Z6kQMKEGSQFmqhd0K9rst9Zf4DgAWM0mvA1jyKKKJadsSIDV5lglGsdVhB
X-Gm-Gg: Acq92OFIMeOUwXhYF9IhPdo+6/VQNvGEh1SdoozCRJ36f+H+3crOaZUjLKgEWMqiv2N
	fchSrnd6YwGYCarUTs65qRCacU/gP3ubz0Y4dnUx7lhZpKtJaAMYSGhq2Ftygb5eBJPFrR4XBD3
	eTR/98GmWSux30Y33mqhG3v/F9LA+9p0d9fqkPxKQdTbJX858fO7sJOnMXufb5R/FXuuUMIaJuX
	Ds3aTbtTRTGwLCjH6Ts4vlmLj7MFSLASwi5KSf5S2kTep9/zDBLo8+na6qqpJTQJUg3IzlzeSwy
	XtlTdlYYiEF9iudXs3F15gsc8o5eMFnw6nffDJQBrWR2o+X4huhGhEvliqqK0dkKyS6Y6hxlb1V
	9mqdhF2pnC+qQZ3xxMeA2FWe7pKQAYMMR2+u049KA4anqg0mVk9lPLwDTGUhXrcbmW8XiJg==
X-Received: by 2002:a17:90b:5188:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36a678479d6mr16527204a91.21.1779781146309;
        Tue, 26 May 2026 00:39:06 -0700 (PDT)
X-Received: by 2002:a17:90b:5188:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36a678479d6mr16527167a91.21.1779781145837;
        Tue, 26 May 2026 00:39:05 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b91c6sm9474650a12.14.2026.05.26.00.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:39:05 -0700 (PDT)
Message-ID: <dfe1ab42-ca78-4a2d-9ff9-899c5274a01e@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:09:00 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Document IPQ9650 Compute DSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
 <f214d60d-a0a5-4f5b-bb65-8ea9d0bc858c@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <f214d60d-a0a5-4f5b-bb65-8ea9d0bc858c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a154e1b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=LDztB-CtngGDq4veg7wA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: NDWnlCphs0H7XLu3E8KpRXeXnM8M0kP-
X-Proofpoint-ORIG-GUID: NDWnlCphs0H7XLu3E8KpRXeXnM8M0kP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfXwnMEJkfLGD8S
 zrRh7wwDcDWkStX6FkuYmmM6FzMHYy0uaPq8Vp31CAEmW8tJ+woWwCCbLwL9S1NBhh9Ei2aXNWI
 SF8fKAk+MwM9fIh3RewHnsmiACa0ql84C6UeALIevcedmlRll3xh5E1I9nbh83c6ZEvdKJ8NClE
 eC5djqqtiqXdmdbKIkQMQiQ5fSEyCMbXO+TcqcZBNvy6GZBv2+KOhowyNX3a+FGkUV/qzooFQ5O
 7l6JRFi+RpFJ5I8AgH0aO6dlkEwYfNxI/cB+4w3rykqB6sj44Ce5rkqKLkN7kEQWJTKZUlcU0lz
 ikXQ2P9LnK46U5ZzmmnSv/D5r+MV2LBr4LJ9GOwtDCSV6K+wi9L3AGWCXMY4XGmZfUWZ+hAxa0m
 a8wLv0PbQd4vbriJCh5KP8BUlcjaKJi49LcO35gJjxneIk3gSVskdUh2h5sUf1dPJeefTmUxEC6
 aOm81P4AOl5NOftRLHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260064



On 5/20/2026 3:36 PM, Konrad Dybcio wrote:
> On 5/19/26 9:26 PM, Vignesh Viswanathan wrote:
>> Add device tree binding documentation for the Qualcomm IPQ9650 CDSP
>> Peripheral Authentication Service (PAS). Unlike existing PAS
>> implementations, the IPQ9650 CDSP does not require power domains or an XO
>> clock, requiring a separate binding.
> 
> Your other patchset made me believe there should be a pair of required
> supplies instead

Yes, this requires a pair of supplies (cx/mx) but does not use the
"power-domains" property like other PAS implementations.

I'll rephrase this in a better way in next patchset.

Thanks,
Vignesh
> 
> Konrad


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947063D1CAD
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867036; cv=none; b=M+uKAiW+VO6Ix+A3eZ3CXrOODawZa7t24xZBloXc5+OYfFCu0lzRQhCSJxpK23ncFfI3w+i5MIiU06HfZtez0tDhRRFc0MPnsmzM/Rgv+Ej5w0wN+XSGNaMATftQS6Pg7VQ8s1WZir7OHl0S6PkwOSIgtD7qo6Hhlm7n6PL8YMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867036; c=relaxed/simple;
	bh=RpYjaPec1znN8luZVx9P1DlZtHJSoiNUyzaWHmQtS1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuL9L55mVSwL7CPb17vGDFodEZwqbBXBs0b46jCLdZPJoOwe7Rb+no8dKzeYNHxgrl9l7I5kPczhlkJV3xk70JAs/ml/Gam6yuG3thWm4A7Mqv9/l0aJQ+9rKsUJNu1Cuu1BE3yVk9he2iy3eIHyjNv2ElyaFwBOKn8KR16+Ih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUqzcDcP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDDEny6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUqzcDcP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDDEny6M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAEaPp2000621
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 14:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MQApk2TA4Kgh7BCHVEEKmfYFj4yHwg7EvzAss2naHg=; b=NUqzcDcPw8jga9gZ
	4tU+rB22SfcObJEAoSjEJS5RMxhI1sjE6EFy++ZVvQQcTVHkpk6VUS0wZ8MflJt+
	iWDR5o02Js5yadAzOHP0+1DlS7keQ9UG/ZqGLDu+g+4akJIn8WfxPUvQIld5ppNe
	8L3vAvsJzJ1BURQPm+r/n8qsfx6ACZk3KOIKm3SqfpioQHavkbzZ2hK255ErYvSH
	V9ssuqmozlW/qF9ff+N+SJm2yCWNWJV9XQVpySlpDwK8eLLQQsaF03ygJbzzZ1nO
	YKElWdS7zDngAeLxuNgthnJot+7EDL1GOh9KKXb5MvBgNPEjlbXOeBAHxZh3gn9x
	DjF51A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfbsjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 14:10:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0ba59a830so8497162eec.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776867034; x=1777471834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MQApk2TA4Kgh7BCHVEEKmfYFj4yHwg7EvzAss2naHg=;
        b=KDDEny6Myvj1SAgsZim85hx2Jv2vabFYaTeKyTV7UuhBfvS/omelMuWDvz2f/yHJI6
         CDUp3PFoULmeNxOXCDpoJ7dUVR87HclZ9qsOfd8gIFHx2+TVT9FceLaABrrhstW/k6LJ
         hAtl51M9e3t/BYl3HnBtajECougB/tCor6oTLYSmnygBiUrYn3HXlOya9VpqOTEm/vw8
         wq6Om4YhYne06rtQm7WjkbIzZ6YgP58ygmozjNa4JjI9X9Q/I076Lwu3EjCDw3zY6Eq/
         0Om4qz0M1obdH0OUXDcauLunqTfiQ4x/F0S9nHiNffMuVsoR0ATogw24q6vQ0ytk/jd5
         KxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867034; x=1777471834;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MQApk2TA4Kgh7BCHVEEKmfYFj4yHwg7EvzAss2naHg=;
        b=AEDPGtBEfcbMjUQebA4nLevrAgrIWo4xi1B021/HICjJ4PCXU9giAmIGFhxGnd7Ctc
         52xreZbliclHZ6UhbkmBBsN+xDe+LOyG5wJLYzr+XyaZtSiG+f+BANLK9Nf6sv9TOQiX
         wMi6WJaro6mPf8rAj7QM7DdqPVVee2GoPGXO9po1L03nDPaQ+SX8PSc9EMqu+2/IJSwH
         zXDD/G1SOQu0XvD4co0vRoXfBTrZ/Rs51WZ4WoBZcmLbVs3B3hoGgn6lrEVGq2mgYuZY
         9tZa1Lps/tZ/ZKT0PYeHgzK0bXryQg0iQWYNiQGwYgHN47aeVZOo4/VNsB1YN5CjJD7t
         KHxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JaaHfvS6TlQSNtmaCXEokH0jjyY+FJ3S00YouIkEBqx4uHjcif9UyoSkuMUm6sSoEcvRxFUYXPYD5fr5vYvQe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw179KmDd2NE6wgmKeOmTnpPXI90FhapE7SbVHaFvr9DUi/ewdn
	MFhRwPCqKdyeXv1oTW+aDMnDesavVms6jeHM9cGFGVsdw6pnzBZSnuvdjlEEAH5/78ILkNq7enq
	yEG3uupvY0HHM8HwmqVREMz1mQxoT2hSRVwtu6y4g1BG0Qu5OlKuBU3rT6YM1WwP7YLrO7OsH
X-Gm-Gg: AeBDiesVOzW0onqn0p3V+W3NJg2OT7KlYU90LaRcf1GvdeNInnR4ShLOoNQXgq6FtES
	8xBlbxBdaeDadKJPgJBauXxSdahl59IFraEGbGMdja4zmXBF5MK7daTPhQj8CFcO2Lqb2TTAxwq
	Ziln2+5qlA6R7fHD2A823jl4vSrMO/8XzechXUDEgBtetpSrGylqMWJv02mnU6KZKECmDx0rH5J
	trXVE2Bc9Azj8m2XCbiq7QCHAAfeUeCIxoShXrO4b6tnnxxGh9RUUK2ezOM3P04E/gK7/tUaidN
	l3E2/4rPfrEMh2oCJKX/Hb+ig12iUoNmFv4Wru+Kt3W6aIRBuAjSdWQg5l9QE3eCCxIKjDJJUVi
	uBxPu3jlnkFMo1706eONH7mvPuBde6iygwBvd4PYPr5cbsPVgKjAJL6fKpJxBFM6veLjfeGgluo
	AraoSdCoQui1CUgHeX
X-Received: by 2002:a05:7301:f90:b0:2ea:7901:8d72 with SMTP id 5a478bee46e88-2ea79019c06mr2915516eec.17.1776867034125;
        Wed, 22 Apr 2026 07:10:34 -0700 (PDT)
X-Received: by 2002:a05:7301:f90:b0:2ea:7901:8d72 with SMTP id 5a478bee46e88-2ea79019c06mr2915485eec.17.1776867033456;
        Wed, 22 Apr 2026 07:10:33 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm22601241eec.2.2026.04.22.07.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 07:10:32 -0700 (PDT)
Message-ID: <58edec29-831d-44d1-b574-4dec8985ac2b@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 07:10:31 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ok1HmiBBVWGfWPJpo0mm-zyi7ARuLzgs
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8d6da cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=K7Ul_5t053zlMiIs22UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzNyBTYWx0ZWRfX4UPWJDMiPw6W
 Y7e7aNzCMhNPJ6m1qwo8KlgaUrluQdgllnwvqPUbRFNmK0BX0+mN0q6zOW8r6YV0qc2513YhhuW
 y74ntXLLsmPECyu0HUIf6UTI7LiBrG9zX2Lpd7k5GkyTAuNat/WVIhTmzhPCQVxUvmQajFSEVnk
 FQsnP2vsjlKzxhEfoMTaXAWUgXt/+FkyO8eLGf/eLHxPzqs9zTK6XQsEJ+eElMgfA0VLrRsU5C6
 8gFX1gaLljMsf6gWWI/Gff0LKMVc72t+Km6/si2Ukr/0vz40/tyWQHCI/CyrCNZiZw0VCLZSVeF
 6Pv4Ir+33TXOuesqwqWj5Z3I3uwkZYRbPfcoLxxs1RYxe2oXDozH9CJgIcYapH/ee1S+5U5RqGQ
 3lNjltLuJj6K4jfRxjbUqisIh57NOPDIza60tOipig5yOO9BV6ufr/FGdQQOG7X6cml/fRP0OY1
 JT3niS0UFvdCpcDWZ6A==
X-Proofpoint-GUID: ok1HmiBBVWGfWPJpo0mm-zyi7ARuLzgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220137

On 3/25/2026 9:33 PM, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
...
> +maintainers:
> +  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

given that quic_*@quicinc.com mailboxes are being decommissioned, should this
be changed to either an oss.qualcomm.com or qti.qualcomm.com address?

/jeff


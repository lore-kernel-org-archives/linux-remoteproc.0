Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB79202F87
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385688; cv=none; b=LpGpT3Xrsry+lCTvLxx+Z0bPpPmXbMEG/HT2/6L4qZ9l7q+PLl0J2FfrqgBZ4SRvDF8YUomV2iYwz/mKwMpnZU3d5kqY+eg10DexrZjH5JfolLd2/vMFqEOndS1A8Luxr5mSblalto+G1O8q9v2xIdQjGFPyJ1wDDm8QqQrSTDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385688; c=relaxed/simple;
	bh=v5W5Hv6EG33b3s8rj6s91pV8btXw4ms2yGlBx2oMrjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnRpuqJdr07+2IT6hEt8xv9FxVCUl6uHO3H/kNFH5UsUNP882FPF0Ac9eqEYolMT6HzmmlHsg7jqk54aBGONj2IjwS13OS/opUDN+jx9B6TDBhD7WVfA5X1aBoZPKtIoN3PaoWNMyS/4QkNx4ajM/V6gHFAJ3kmFHzxmKelxjw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khpKJ/lq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khpKJ/lq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4N1ib014202
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 08:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvrbpxQRygpuRSgHwmLJ2nLox+2T/uM2FR0o6x/entI=; b=khpKJ/lqxQRfvuOt
	ctGZbLkrQ6rPTzNfIdKM00mNtvRAi+i4u5ceeOMbg6JPU8HjoVmvWbT9J77oX13W
	SB4Dcv5ZPw6Lx09pNeQaO57soGBic+c39h1KF897vvEcbqQrklpuFhXRaZhj6xC0
	Rd3AAP3SZXYW73AGhGybR8JgwHbbttc7VSxt4lZzGinH2NApeVeb2PrXsU+gRgYE
	BsssfF9JtNm1NO0Rv0zVDxUUONYUrQZbu8UeVf5iSMSjpzfU9Ra8DwxsH0389Si1
	I7XhCUYAhfJ8flxRzx4q4IfOtEY2urCTwvY2tRR3pdKh1pBR/bZFsK8ExaK85LOu
	p6Q+5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9jrsyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 08:54:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476695e930bso3817421cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 01:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747385681; x=1747990481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvrbpxQRygpuRSgHwmLJ2nLox+2T/uM2FR0o6x/entI=;
        b=O8r7AI8zmj8scxSzv1VJLzsp/p9yg8Ptbka3DzrM9OgAH535T9lIpFPalYX2lzM1bK
         rfSvqNwZPybpa6qa4TGOZVnhv144PimScQuO6uZsk5oQzm+NUWfFawRhkHPmz2RqadZG
         T2VAHQS/46UmpzDwDXEwsliBOPKE/xUFFAU4tRW+3Qrihg0D4J6WUIWQ+eH6afRXg3QP
         DaV2glX6496wnslcrTO1z9+SqPYpCqOeXf7fKnbqzQWg488TzlX6Wfa+5/RNlDvNtbLz
         OJWl6Mssf8AT11ZgFGGJ+8AFoW4AMaHBgsNvDAScmSk1dUpyyRrGP1B25K36kHtY66se
         TISw==
X-Forwarded-Encrypted: i=1; AJvYcCXM0MgmV3Gzbz97NQeUnt7ZX8fTOXZzbQqNRxJ3gJi48W2VkBm5vTpjgzwFWRWW+7LiyzUIFdNtDmyKXyuZJcx0@vger.kernel.org
X-Gm-Message-State: AOJu0YzYy3+Bg+cwu9ztTbz1SSKZiYeHhw1ohtrDW2yIuq2p0mQtAEXu
	Njg83ZZM23uuKJOZgU69g1c/5d2XynqSuACQ803oaUD5y7kw25SGvR/E8d79MfnAaQsSqfrsYZH
	P7C/qy/gdEjYYbpWzN0OkQiaELs2fYZxf3JIZh/lRu4E3AK69VPBAaX9Nj+LdR6IXI8p885jv
X-Gm-Gg: ASbGncsmcbZFH1bAo9e3YJk6bS7pZ5y+9pQf/758KQvH8OvJkneMCTrebgChW6dIAUR
	awf2rXBdvYo3k2hR/V84S0JBVMsHvF9SkmPaq8MF12zpadjC6+27GrnTiMuQdgPLlu7HBN5enDD
	ZL+dMtB7iT4eeJBKuAuO4FecnvRna2OtQfbhDLVsb4SobgSdF6ItM0WHshJddeQdpEIXXOxf+yz
	hwlTgRplBvXAwn+YQXyqbckpVyYvLQqDFz+Q/BVzXVeEw7voAWqUnUHjovNSHgODny6R1uvY9mL
	1qdGBQjmgvQ+e6HjbkP0dVsH4rN6Z9ZbD1UaGLZV84Ewb6tc100eSXr/w3JkulMQjw==
X-Received: by 2002:ac8:7656:0:b0:473:88e7:e434 with SMTP id d75a77b69052e-494ae421a73mr10063241cf.14.1747385681509;
        Fri, 16 May 2025 01:54:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN6TMEprtqTIgIm9y8KSJgwK28VEXNDOCDzXjdEPd9k8rvmTwL9YSHZZ+WWoKFUrPTxZDFcg==
X-Received: by 2002:ac8:7656:0:b0:473:88e7:e434 with SMTP id d75a77b69052e-494ae421a73mr10063151cf.14.1747385681005;
        Fri, 16 May 2025 01:54:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e3ca0sm1091649a12.42.2025.05.16.01.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 01:54:40 -0700 (PDT)
Message-ID: <b74a28d1-2dc2-46b7-848c-a62cdde27779@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:54:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: qcs615: Add mproc node for
 SEMP2P
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-3-ad12ceeafdd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-3-ad12ceeafdd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cdWbZfQ7VDaZFBV-_3UrONOSPtH8-Uer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA4MyBTYWx0ZWRfX89nrCUDkAfFm
 fk3QRJqd30HOC09u5CSeYWE7hzo0GQ/wZb9JJWHgOF/fIqb2UtUzm8E5Af3zxTVuz8gjXeXZfKp
 Hm8VHMvIjdfLU+Ste7l/ZWKh5gLtKqcVxuG4IP9TumQFfzchqsllrEEFH8ypP+eKFDzw7T5z1HI
 ucV6KUUJ2YeKmH3RBMRyBKpx6uIAJbjuI2F6v5lRAasaSucoAg/SztqGl/aqUdTHBWFnTHqTA/C
 ofKei+pqQRf+vFSUF4J2/WvqUKUSN5gTjF8rly1JVqGv1pwhSRDUKntL9LZ8twnMlkVf8Q/8kQK
 UGrd+7mzBC+AmNXPd14PgsXnDPNXPN7E4oPghqwr8MZC+LYxTiaBIqX7c3JBjK/JKdx0b7xEZFh
 J2Aoqt9yMtmI4FXJohViqgM6X2rrznywoaTvu8OQisVgTth9bbIjkttws6PChtwtdwSpViaH
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=6826fd55 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fxdFZpXxXALc2YyWw2UA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cdWbZfQ7VDaZFBV-_3UrONOSPtH8-Uer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=749 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160083

On 5/16/25 5:27 AM, Lijuan Gao wrote:
> From: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> The Shared Memory Point to Point (SMP2P) protocol facilitates
> communication of a single 32-bit value between two processors.
> Add these two nodes for remoteproc enablement on QCS615 SoC.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4697019E998
	for <linux-remoteproc@vger.kernel.org>; Fri,  4 Apr 2025 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743806494; cv=none; b=qO/AMp2gbpafuKJJ1ACJpuGp1FOyQHSHuCpYTPWiOnBvbucvtOPnh3g6PrJZFOEJIONOtYA3nMHtfzz12HmvwZMmpggSVg28+ZgyV2NEFOlIb0LEIx3sN3Ms1+d2L0DNrKLzfrJCIZH5asLqpt3jTp3FPzDj/XPnV81DunRm1JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743806494; c=relaxed/simple;
	bh=C1jJcqO0VzfBIweuTkp50Zzvbn4YAQo/jb+JxGVx7zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdqEyDCpO4VH4TcmL3ga+J4eM4QxSQkQX6u7PULqWEGM2tGXaQyI2r9Dr8BaJj3Iy/P1f8CGViH5i7D4tNYOVDMzAjw/YOUva8l+rnZwrTzvYJKjcCRAP+MRpUiy41Kai+RQbSWeVGL+LKfq3KBCndxCXTe7IlXAdJiTnECSHVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mByJMVpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mByJMVpH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JF2WS015009
	for <linux-remoteproc@vger.kernel.org>; Fri, 4 Apr 2025 22:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piQgtNf2rTZiw67RNzh+cHjlQOmWMuGvTuyfOlzzNn8=; b=mByJMVpHm1AziRcO
	mJjDzyEpL4rgvpKHAt6vBP25QrvH6bsmu8rECBDdkNJxGDyVdrC5rf71LSpY+kke
	35UDQVwgrUxZRKiIaaM/79WuugDJU7EsgU0Fo/EDldOAcWbyXj2pnF+7dXX5uxY5
	RxHGI7TebMkr9ltNF0wqpqJpZhR87uoF5VBWKe1Ncv73w1k1PaFFpUAJjcBKd8c7
	S+JXjv127wdDa6G5LdIecP7Cxgw6vEkQ/hgzE1iWO88ZxXGWW7mkP8j36Y+0ivL5
	UUcgqFNf01RXUo3mF7XvqApTZdqK2tm+TcfafP/zEY83mlP9jWHMAI6MmXFFeg1S
	rIUhyw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2dau3k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 04 Apr 2025 22:41:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476a4a83106so1229841cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Apr 2025 15:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806491; x=1744411291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piQgtNf2rTZiw67RNzh+cHjlQOmWMuGvTuyfOlzzNn8=;
        b=cWPoKVOpcLNTMn5QE4Stm+hy8EDeXBdbtzcQjYJT/+gH6pKWmj4NOuPxFQDVOCQ529
         8ogsLu1qv355BFxJGNBkcxP0fJg0K3lOs82EaK/x5kDpEFK7fbWTX3qhi+QiYFrcqUo2
         tBRoQU//mzYWUcK3r6/6cdkWjC+kgh0GLCl2Qvsu7P/lYh6nA9oXHNFp97Dw/i0BEBcf
         +hVxquZ6b3eMKi3nxdE4wGvvkTTnhdmtyOQdrKqFzXNine3hYCR2HIKzlcd18WiJmXwQ
         Q7D4kMB/OiyuCQ0HtGU5k4kYOrblQOG+cN0lDieV6Pksiqnp6tW+jzuri1FLmayzhQQB
         4GPw==
X-Forwarded-Encrypted: i=1; AJvYcCWyKluCpNrT+DRaTqLo3Xg2y1UoD0ZzbOllJCDqM/A0Q4XPjsQbCHu16SvLel6ibjdjMpv07mUAB1jB0F3r7t1G@vger.kernel.org
X-Gm-Message-State: AOJu0YxISdU8zkFZPokgfUtr2AoF4/0pnKstwrVav5R7eDjHGt1pGB9R
	TYJl1HfJ001uYRn1tNNFP2/sTnSnblWyIkAu8b7jLNhv8JyXWcPlN1B5se5vj9Rz4jUXhDwDoce
	Awm79r9Vp3xCKO2HB+CZmcKhg0w63zHQC6TNll7EVQd7HJvJ+kaqeDz3dyohN7vwbSzrl
X-Gm-Gg: ASbGncuVDt7ytsvhr5Trq8YPQF+CzJITnbR3XCuaI6w3CFO95LqHp0SNw/heu8lScZn
	nP5fvy4m4V0ZPDyKBb3iue6SD+E6X5mlQkY+zs+uJWDqhkC8UzBkX5CxC3aJR8Ou3Ll74c9XA+b
	pFkuhrIU3TrSPBqqi5XLtUL9jm3R0ZtjdblvduDwrtfCfjj5+dWtEmkcMA4j198/GTRrI3D6K3O
	BSo2PTddnbw7zQF8w9rztRVPRdMEgcU4mxKa0pEIp4SKEarbJcn7xyNSJLD/qES00W+KAE8LVH7
	oVB49aEhGWkrjlbwp00XBDwpsMvlOESCL8ZIm8xUIPsk4nJn60mM93/0yujcmjc/ESIIqw==
X-Received: by 2002:ac8:5ad4:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-479247dad29mr29115501cf.0.1743806491048;
        Fri, 04 Apr 2025 15:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHI5XiIGSHW5UhGuECaX+GXBYuJp9Q5bhUJpvXtV4Ud9etqNLuJk0EDiqT/rOOweKfNIUqDQ==
X-Received: by 2002:ac8:5ad4:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-479247dad29mr29115391cf.0.1743806490645;
        Fri, 04 Apr 2025 15:41:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084eecsm2868990a12.57.2025.04.04.15.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:41:30 -0700 (PDT)
Message-ID: <84a41f23-21d2-42af-abc5-72147e964cb9@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 00:41:27 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/8] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
 <20250403120304.2345677-2-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403120304.2345677-2-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fSiE_Cn6FOrnF4JuRsFM_4N1KaeU9VPH
X-Authority-Analysis: v=2.4 cv=MqFS63ae c=1 sm=1 tr=0 ts=67f0601b cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EDSBdl3HVflM_WRIKtEA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fSiE_Cn6FOrnF4JuRsFM_4N1KaeU9VPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=734 clxscore=1015 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040156

On 4/3/25 2:02 PM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> IPQ5332 security software running under trustzone requires metadata size.
> With new command support added in TrustZone that includes a size parameter,
> pass metadata size as well.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

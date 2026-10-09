Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1624349B4
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Oct 2026 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532350; cv=none; b=JltfkgjsgJgXvMRvrxT1Ty9h0eF0+zpQ6V3N3snN+YvQhB/I3IT3rY69m4ISgR6s4L1fFVhTWW3uKSkHDC1JvY/G91Mh2/LOPLrgFYTLWdt0cBEmcBW8G7dAAnuJ9Yr/jaNNF5lzpgBmR+AkThAwOBkBgfns01rEm1GTsKFmf1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532350; c=relaxed/simple;
	bh=kFdS6UjgyZ+sc5RdW9BqWyrb0+OVvxoQt9fazGBVrPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJekd4JMJwWTGHhWtiT5Zglg4bQdfTc/myC7j7h8tZiyfg4FT9td3qATbo+AD9ul98n8LUsx9y8NVfxTcN8L2H4R3mcx5ZIxcomZMeNpgIFnsLSKN1AT/66hZxa7Rip/1wVvC1h48FX9CoQ+10HdYgdMxmrm6BGwGCwjK8xibEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UY6O6pkf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dk5JHpas; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UY6O6pkf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk5JHpas"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HBs51598075
	for <linux-remoteproc@vger.kernel.org>; Fri, 9 Oct 2026 07:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VBvSfEAeglow5QvR1GvNQDQm
	2rjRQlHlmGnHZrTDfZQ=; b=UY6O6pkfp6oOYJPmunQih2TlVC8L6CiIP42BNa6i
	puhIvcuD5xX+pv+5QaIGSoV/gzMloKAvfcLdHuQc0Pdk2+5epDBnxTBDDrk4e8WS
	0iE+7qZphXf9+KlSWjgVY8YgVV3StbhXo0rHkShZjyh2FusofBGa1KLoMSVmnbEP
	jYXc+Lq+O8lnomumWzzgagbG2vnz/WLJpSnvoxundV5pL1J+tOl6MJGDWbZFtXFq
	cctfsBpQ3krFKJHlfriwh0WTvVHMMdmmDFD/AdBmdD70Hrobi4v6FfD01UrleVzl
	gEjbsIzohQhRM1nMA7avPHhM/lBM2k6ILAQixD91L/KKNg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufsbaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 07:52:26 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so21580895c88.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 00:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791532346; x=1792137146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VBvSfEAeglow5QvR1GvNQDQm2rjRQlHlmGnHZrTDfZQ=;
        b=dk5JHpasVKEBbX78sOGo9qipXagmz3FhcMls/TTMQy6cwxDVh/4mLPxfGLu2lMUQon
         zQpgCMfZ9abuPgkPtyPxrJ7CiBUb9Ojr0fdn1EKHvlbuemVnDyjxyWEVtN/AffmO7SCq
         ymld72n5LKTjzYO7dJrgEf+d+QRDIK5cktx463TswdaFvjNtYPf9RlRFSZYAE+hx/2Dq
         lJeMphVU2d073f+4EGXTIJYlxD2vTFSY6CyJyiYgPZ7azinawGAPiPzeRjhGL7X2KqLL
         ZvQFrXBxlYlaVc3YnAztaip7uzBYP267Ceaayn5rkESTlrDkEie5ilOzIlZbw/qr9UCB
         jOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791532346; x=1792137146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBvSfEAeglow5QvR1GvNQDQm2rjRQlHlmGnHZrTDfZQ=;
        b=HknD/XPb2IrPhi1j19VChhawcQE6f3klsq14ShWCf3Hy22JzPMFgCgJQ0Tz28VIOXS
         mf/Y8hAZtyhbr0NFxpVtvE/ybDOKFlABxNaOxxGWKYOR9GoAunE5gLjLlM6VCBOioqOA
         13rlsaa1u5cvprbL6q9/cf8iIWIdddMeKCL7qhet/meQzfxqp9o8y5NZHxlIiMevWw5V
         V1th2ImBnCbXm6xUPmolxmJnI5hLedceT9URj/Zympi/UFNJ91Ze8gjIoevuvrGT32lH
         wBMhAPEpfOmJKtKcG4i6nYxwJwCYEXKTgUckUmY28aVnYhBpJBDulOyyEWfupBhaQuuA
         xgZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzIFb8bY5dxcmixa8lNrjkfGjqKOSEZ2Vzvo3nge+/o30fqK4cGAGTreRWyv2zflvkn8ba3Wtt1+C9s5got0Rc@vger.kernel.org
X-Gm-Message-State: AFuF++nx2NYmOp8RRvC8vn+/+hfHxbqOZda8pL4fnfd6fMr5uXMdTT6Y
	VkSg/KJChsY1dPmfys9E8QVEOVLKc5Uy+pVf+mKHpYV5hQi4qDuw6GwlMUUCloYJGu1fHLNYv8x
	qDO0ZslfEgNTinl0anLpy/f2NMhgQVvYcJnVGyAUizfA3Lx+huCLj8O5vtnuG03I/u3CFRRDT
X-Gm-Gg: AYBFou0ah0PFbJSyKnYA6USHukdneq9akB9Ablm4HIOgLD/ftd1CSOmejIMXNwNiBmx
	1KNLImwb4Fl/w1Etk+Bfe3SlUmTFS6rucSMwBVthLFU0lkny0wkyTyYGX9dkLuQqE6D4HVQ5u5o
	nnESZwJ/YGTHk4z8v/wqqwgdI2x+ixcpqcAmRk5or05+fkblPR3pTQOqbQR5GLoza9WarvcKX+9
	YYBCjKRY+TWD55alVs3WfY6snJdIf2uqxvL5JcgRvgPAN2EoO7AGeHZfMp372GXX3eU1KQ8S/EO
	T2LtDBVpAfB2sqfjnZtqBgkrnv//7vfF0EwAuFsSOBRsCgRO4HU+MVESPMcHE5LWM3EUV0aZN4g
	ThhpZSBIKZ9z3RV9+g6x5yeVktTYMy4PSDABAxuYcQA==
X-Received: by 2002:a05:7022:ea46:10b0:152:3812:496a with SMTP id a92af1059eb24-16a65b0f48fmr1379312c88.43.1791532345640;
        Fri, 09 Oct 2026 00:52:25 -0700 (PDT)
X-Received: by 2002:a05:7022:ea46:10b0:152:3812:496a with SMTP id a92af1059eb24-16a65b0f48fmr1379169c88.43.1791532342879;
        Fri, 09 Oct 2026 00:52:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm4230189c88.4.2026.10.09.00.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:52:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:52:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Add Nord SoCCP
Message-ID: <asidMCpsXHY62FFT@QCOM-aGQu4IUr3Y>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac89d3a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HvrnEgK54qzgPO-vPg0A:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX3eREsAvj8xtb
 5vQtoS7oH8qc+PYuqsi0+gYaVzzBHzDLHtzcVUZh6iGestqBzYkfpKNFiQYeM8VCnLd3VsPXT03
 /h9/imf6ckKttZdXvlRheKaniKYNZIk=
X-Proofpoint-GUID: eJoSFUc69Nn-4CBMsiLmHe0P5xYc69Q_
X-Proofpoint-ORIG-GUID: eJoSFUc69Nn-4CBMsiLmHe0P5xYc69Q_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX12nhMUU/TaMp
 3JHYJcTmOyl5eKpbhejRt1L3ueKbSJ9Ejp7OvshxHSZObdPsswlEclUQ5wnYBZxnqNJ7YT/iw8f
 KAgfYuR98e058B4HWDC/zh99GlXUO2S+wVRfGIvAWvWvOBB7z99J6RlVP+cwtvrdfEy/7LuwAtQ
 Vk6MsaiF6+Fwz+je1aLFdE12nAV/TxNbBs3ppveG04rIqjEkt17sf9PVieNxgQR5l98QF6tCBKq
 pTy5dRHndQHohuT1fHVSEt/2pRITbbh40hzQREy1YaznfPv8E1TfEpoba24DtWYvRqXv/G/eXmp
 yempaGHICB+FZDZCVBoRy3S9rau7et/wLw5hi+GdrKOoxICEhRj/cUlQ20b5u8jwAsKSvuSNpGU
 7NEBIWnj8vgyGiFycrxmf/eFvFMd2Reh55VT9hxlInjAc4RBXPl5q5BxBBk45two+v6BfiKFnSS
 oS/niPa7iwAK6YXwAmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090031

On Fri, Oct 09, 2026 at 01:05:39PM +0530, Anurag Pateriya wrote:
> The SoCCP (SoC Control Processor) on Nord handles hardware fencing for
> display and other use cases. It shares interrupts, SMP2P states, power
> domains, and clock with Kaanapali SoCCP, except that it ships firmware
> without a separate devicetree image, so it cannot use the Kaanapali
> compatible as fallback.
> 
> Add qcom,nord-soccp-pas as a standalone compatible with a single
> firmware-name/memory-region pair, while existing SoCs keep requiring two.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

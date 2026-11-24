Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515139;
	b=oaacCqeakrZZl8es+Ok271rLSm7HiYa81GiUJMj25YsIncZJ8MHvtii2weJL9mf3SfO9
	 83ZsW0ssqX1di8xNCQjwsQX+o6/g2Gpl7vR/xaqtmDXget4RnwRd5+r2STh1em5ackqkY
	 sO0l/EWtI9OObA1RaglxULS6FXcd2tCdhvBt8XL4B8sRW4bICG36OB372lGtM5PCOQpfS
	 KZRgHQqMnn5h55kQwEu0pj5mqa4j9SIiR8WSIg5u3Bn8z62Zoc018+a/s0EY43k2SQJW8
	 IaKk20ngKAzcNj3m//GaJghBO9qxHzSzMDJo3IkaWDuNb5RTfBysB+DZ+Ht3CgPpSvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
	b=1v5/83kisnDOGJnWpzVBcyKE39JoHX7koaQw3aMS9TwTNel9sm9pl+5hXeydJg66zXCZ
	 3pvrYvgne+uu+Qgdz4KD7yZwkmLMbq8VRyBrkqmf7ML5tTYN9G8KKdbq9JxFnpy0Da85Z
	 +PnuHC8C3BbZ5jxU9c/PVmJg5cvgpTox6+2HvrJCmq4cHXqDGumfJ0so4yZJkmtPA/3gU
	 ZUlluXvc3lcN10L+eR+gqHz99F7H9Nvsd4sDJ9AlL8dZ5hL9qSJQ+RW/kBBR2V+OW7n1I
	 C/IzpO2G0/lQE3eNuGM2ZQ8KlUf+wJG2reG/yLfRWaCobF+aRRlBK9w8AfaD5NSZN0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDrQH1Cf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxbjnF6L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82D606A322
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E82D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDrQH1Cf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxbjnF6L
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8cm9O017001
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6430HUVLr4bJNErHixuqanXn
	4vXMjYSsZt2lpy71S+E=; b=mDrQH1Cf6c5ArPYtVFC33gvCPjdAql19E0mcdVR/
	9eqGgLp1GL3Vki8Vmur8tiKY8Tn+bT42atKTgCAIYukJpTr445Zd7CxjjLMXMioz
	VcFvRC4AWT777uNSpCPXx/rj2vHaQW92z6D+IUy7XRTIKqAgBak1a118zSetM6vd
	qY950+G8ey+vTkpD9n420XWMzELeA06V0qkqT5wCjOxDk9qgp907MGRE8cvWRxJW
	WMmIrFOLrfJVT9XfgQvZcoTfUck6eJ0ynjpHtccprex+0hvGPA1gvjFBHC1Ufu+a
	kCslzGU3S5botnVMrvR7NKdFc99pgUfswLvi4XwbSUqykw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nu8v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:12:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386b8624cf7so3793794eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 02:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515137; x=1796119937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
        b=NxbjnF6LwQeuu7VkXngzE9TKNcxpj3cN00Rgxs1BVSnT2oQg9ZamRLfNIxX7tGrDNl
         XVORXmmg81izAhNMDKzPlmTShbWDgw9Ghf/c7sFHr/jwuSeeKqKVihzurUotH4PclA0R
         +ASQKFamgg4h43T1y1M3mxCCWhqkgm2DHe96FtExyr2RhHOQao6FvmSBTOBNqtSS5K3Z
         I3uSNubetg3mZN5OXJQWTUSYvQ4Noauq2JSku4qnq0a2lK4fce9xXodzG/fboAIiCU7F
         ySeWKwUt/MX29jiWrZMFvFPetFa413fbLYsRVLjoGxluUVQZd18zaLt4c+nlOuiVp8Ow
         VE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515137; x=1796119937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
        b=B39lgX+g8c/g+7hMTSEPHYWIO18mMxNwgNvYPmY6xixLOmzWMBzIH0WqNeecrLVrCJ
         EQb+5R1lRsE5mv+YS0Oc9gbbs0R0IP7GpghL+9EePJAlu6HvB/q70/jnrDFvxD7IlKZG
         //Xeh95SF7R2dTsq0TOXxi5kFL/m4Mlq9+RubKjVvtlxBYuuG5EpN8D8Pu8xdeXQMixG
         Pm2s4nkbTr0SQu3rJ8XI96/4WrDMVAbMajsQu2a3iIan4wi6dsOWGjP0vO1hbUtD+Z2E
         dhuKSyxA09f1FuVDFIPYitPiR9jhbYeMEHHio/MBNkFr9qSvAxme2PLH+vThjt/TNEIs
         l3Iw==
X-Forwarded-Encrypted: i=1; AL+hErGruvWzNygLW2lWWqvSxgoo9F22uHsWuFSk0AGuGCDLsalnBUXXEHDi7Rn9xbHjzkGMsWY5xPSAeViADgDriRvf@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kqu6azehb8xjrAoBbyYVxbaYfIPjiKOwdxsj9TjMrZt63xcs2
	RRUT/RTU3N3OFqgf5+WUHJsP+YEQg+wQvYzqIW4A/yMwf/78PtB1Y9nbhQSSbqYdv0ojxZ2mLnu
	wM09A0VDtQuWMEYnRLdnp/oWDpoV01QOqytcX3iddKCHU50HUw5FFYDimPCbFUeL2e2I3+Q/A
X-Gm-Gg: AZFdTZd7U8brGze6req7ucpFzpU7O3If6wJyftlwC09re1G8QruxI97r8uPV2+s7Jdm
	nnZjEcu6ieLJauKwtePwYfuqzY40axtNzsiAgF3/lB95hEBHzI2507ohO+dQSvxHlAaWmKgkig+
	P1EKOH/DencxG+Duux5Q9mMFxB91mf8hpFVC1OeXqau/ihhcWD1BWGi6B1sl+D0CT0wEi8IL/aJ
	uidtpeyqFXwIIGx1EpxpaEVwL5J2yRQ/0KjrAYIRNQJSFkDv22Uc6cb5GnZbYv7+rGf8oRCHlMi
	2AqS3NjRPFK26DA+Y8zhk0tY9+vovgYW4Hz6bfTkbeZa64wIE4jDynrhyAn3sGbqSFPTYofZbIv
	MZD4vB3gW35CgGSrXr9W6oOC2KdEM2rF+app0CmI98/ZypZAllJn+4feTIxLPmANa8DHbn56WsO
	Mz
X-Received: by 2002:a05:7300:f68e:b0:369:21a:dcca with SMTP id 5a478bee46e88-3856e9472e8mr14256333eec.10.1795515137031;
        Tue, 24 Nov 2026 02:12:17 -0800 (PST)
X-Received: by 2002:a05:7300:f68e:b0:369:21a:dcca with SMTP id 5a478bee46e88-3856e9472e8mr14256287eec.10.1795515136350;
        Tue, 24 Nov 2026 02:12:16 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm10543902eec.9.2026.11.24.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:12:15 -0800 (PST)
Date: Tue, 24 Nov 2026 15:42:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261124101207.24nzbmb7udaq4ik6@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfXxvMeklavp7MU
 dV1P8UpSj7QpLXNT2P/Q3aS9s41W2KLurDaLxU/B4QaQybVvi8oQyU2LhYx4LvKLZmYCMZ6vDNl
 /yyb4SLrsfS+HOdGEW5lRwepn+MPMZ+QJt/OFLAy0koHouxmhTJqrV3DJaK/Se/y6RgICuuzgdA
 bY6QjclKcC+kZoC4UMiXPqCOjHnLuCea90FyxdViaMRJiu4Owl2bMPz+mnR5kMM8PbdTnEXiugU
 o5v6bdau59XoRxlzDNuDYRbHt59h00EYt7XhVL2J64t5f4fCSpp7dhQFfxzddxUby04YqhPNwbE
 94EDGLwHgkjL+08qYTlLkuUgnBsBDURpGWLqCjX5IiFMtLua67/Vey70bdiQvGiebPzQS3NjDBo
 2uqlq/5Qaz1D/1f1OmF3X2MnnQMoHBRGR5dbR2mF1l1Ci1ruEhZzBVg4Fv/KMOZ4wAFAxhPvh8M
 XcQ9SUihLwI4EfGtIrw==
X-Proofpoint-GUID: P8jhATxItC3F8LcILe6-ASNtxWBM7t74
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b056302 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_043IPGYQ-q8YCy9JWsA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: P8jhATxItC3F8LcILe6-ASNtxWBM7t74
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX7ilkCRIy6uW4
 IiK/SGMv68DLfwMZLtSJFz/MJtTz5vMoyaNWVXfO3irMfAVqfzWbua3kKNMR5FECzRbo8GjXyQX
 Tbgk0RsxefjL1mEb7wubx16TNw2oVBg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:49PM +0530, Komal Bajaj wrote:
> qcom,pas-common.yaml limits iommus to a single entry for every PAS
> remoteproc binding referencing it. This is too restrictive for SoCs
> whose firmware uses multiple IOMMU streams, and a schema referencing
> the common one cannot relax the inherited limit.
> 
> Drop iommus from qcom,pas-common.yaml. As this removes the property
> from every binding referencing it, define it in the top-level
> properties of each of them, with a description and the same
> maxItems: 1 limit, so that SoCs needing a different limit can override
> it in their own binding.
> 
> No functional change intended.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Thanks for taking care the suggestion..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


-- 
-Mukesh Ojha

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462412;
	b=ERP3k6EFA/ReNU6V+kmPTe7nfUz37G1Wfk+EF6pfE4gXGVN1YKqVWTHdxFvaGdIEAoVF
	 r1SFdp2zldnYZSDgzxAhLDo3rbO3oZkYM3scZt7ufEOFVYbsZlFOHoHzhz8AR7xPRraxf
	 G/fHArQ06BXtt9oaF76bzxPaQ9ptMnjApFQkhv6ALZ3C3hkiztTysBLzCmxwph0+j9Ur4
	 GmCEGqbBFu/h1BsgyoLEs/h1n8DZNPhyO9nwBYucW8qBclRHvBk4+TqMD3qLPOm7BqPm7
	 m0uPDo7/kxvIiWA0X9G39QMJmhIJFBAzGwgXS8lODRwJ4X0ZHgvyhc5P4eLpsdDUvsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
	b=hEcENO3hS+DP9AueAy+f2Yc9ujRDY0SsaT6zDGVgaidbmRhEqIyERR8U4CiQ9Xug20/9
	 yCj/ZcCYpfjJuxUpNKC7fDYYJ/bHEHb0xYVcDWOlzwqPPTmPAH1morCVCIUwqL6h71k3e
	 5tP6EPstUwKLDZXFfCCm2tPxYZxEzg57kE0vXn3V1IQqJCw3jZzDBKvZhCW++yl1P+gV5
	 EK1hluLru6k3n0D5K+o+6vzLsgfbZ2i+DzwsTMmVtYNfo05UFGrVjt5XEc8fXEck+i1fl
	 qpLcIHBiq7g8NFpAScC3Ix8G4QDPVBi/RIm56QtEzQ+nV3JY2/BT4fW2hF7GnQcx5Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lbad/JWJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3UJkNfv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BF5606A321
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 19:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lbad/JWJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3UJkNfv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlic3730134
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 19:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JHSEjavsqM39bkuCvnDFdHwV
	3w2gEjGXKFceSnNzYy8=; b=lbad/JWJZ23cBq/OixXbP4rSo6w/e0xsnm36Ki/+
	/HM51Zy3lNuoHUVZ3PkJybcQulJI04EEcxSgw9tGFNWpx+foTSe9TFxMc/zUqm1W
	92LK1CCCln2ZrcP6QuF9GZiZGAua/iJllR56i/Fq0JV7q1xqP7Fpp84YAPzUdRT8
	Owx0HqCj4jMgqvMmsrgYct3nE46PmYB4mz9uker/P0p9aUBYNa2RGAfqvPsugBmt
	BSyJ3lUjKHNWxz3Npz5vswwEC9OcGPu8p9nAZcGLWmhNgd49ex93dx9Ejo3qvGcR
	QGY1a4eugZUay8SX4qcbJNMm4wHxCtFVsuASfKj2bO1g2g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd35ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 19:33:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9213659143bso8670906d6.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 11:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462409; x=1796067209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
        b=V3UJkNfvkYFEiT3bOJjoBztZaUrSNwinbxmtvpvrnOgcBK1JdpnWw3JCAvOixfqNfV
         emxRSp8KGVOoRRnvJANtA+FLzM9AA22v9hIHjw/xQvjC7295xWlTUYm9spXSXexvSNcS
         Og5ZrzoBLMPGTfpprr7WeqV6Vdh0kFfXcJblAONM35qpqNUPzmaf8OqE1BcRTXMRibnj
         xYoYNG39bkvp87ZoMiL1MOT75xwd2m0yqzaXBgPzFs7rYSRKFZD9AZE8fT7goEK8FToY
         oTk5O01rHcfND/Q2sG9+/AK8VmtQwu0TK0HpL1UDRcpIrbxhBhtIV/+Di7M9iziPHo//
         a79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462409; x=1796067209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
        b=PkRKCglVGbeIiney1JJ6uI6u9x4eoKZmkAJqa15AHS0tpedrTexDf2WI9aa6xR8gP+
         jnOqyfjGPOMQqnhp/6poBYW0JiSlb5f7R7bpM2x8aU3/sajElnJkZAepAT+9AF1it+QW
         mnm/dbed4NnaKmYYp8EnhEGdFZ6BqN8zNIALQzQLqK8eSbSzbJUmqn/zLqYXlA62DgV5
         gvLpa99AxMLmdYFcmd2oKIZcRhKAIRE6015297HIM2N9XAW0asIJ3BwMUaNwtRgpy0l6
         2YlPLdKL07f/I+hJKJ4789FJzH+0rn2s2yb6ZHUBHbZfISm1uDfbQ1yGHBpPte6auvG6
         chhA==
X-Forwarded-Encrypted: i=1; AL+hErFy+9fXrhpn9JZTgBN6kk6eRoF5bJawdqtl1gRgyy5NzoPgBKAacjvAHeqjRsRaLdxW0SzL88b8BEMaqbmNMF34@vger.kernel.org
X-Gm-Message-State: APuU4Z87THyGNwH4B7LD5nMSroINFcuQA3y807A16NUbatpU0zqVxP+3
	luiKdNTzHDmx0fx9fZhdTn5SdIH/tCv4Wt0mGjOLL8t/M5WIumuUWp6WHYDSHsXoSLDuXq7n0OZ
	Rs3TP6t4NFvTLKjQFM7Lds59X3T8JqbsY0TbQdEv2tFCxUtMF5wa7WhRr5AxYcgH/kllQb+nV
X-Gm-Gg: AZFdTZevKGUW/LyQEfM/qImIGQdEadyjLdj0Db2dKRr/MIxeWhev8qn8PbxPYPQ9Vux
	F+6YzyU0wSE3JrndtQr2GVNu5bbqK+A3q04vfpuDno5mz8+ordJOZbdYgAUqnR3dC72hH+ESITD
	tnLd7Zp0BW6wgg2HTTYHdHTfXtDedbXCRfj4AJBpOtWTD4WMHPmeAK+uobLx1v2mKcxiajCQk2r
	DytvD5qRKwzEFxBQo4qkKfynG4eao/nS8aiJCgvU3bDeZo1bqh/XxCPG5nynQ4Lb7TMfdcGt1KI
	ZTHy32QE6+AklbJny5YZ7pbN2pb/AqLDKNJhJTeDzCO0rbi3hOtvC/PdmPxyOucFlSoUjLuRiij
	fpJN0uitTk6YXehNvoK73upoAcO6WY3zyvKUj7+qv+ViQPNhOLgSNUPhWxqbc9tJv
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1962699485a.0.1795462409222;
        Mon, 23 Nov 2026 11:33:29 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1962694285a.0.1795462408555;
        Mon, 23 Nov 2026 11:33:28 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm153451815e9.4.2026.11.23.11.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:33:27 -0800 (PST)
Date: Mon, 23 Nov 2026 21:33:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
Message-ID: <hlj4ucudy2shejlwc73qtviz7yasoyfbcrkp4dnkan54tgzru7@tfdtsgz2zhck>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GnraLvdtxHZVWbzU9Q91CwsD1KZb0K52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX7g+KSk++CW5/
 Btz8Eqw1XN97B3ofbgCBiRoH+3jCliOM4dJhaXwFntW7qHRBOGri2DDE/RJ3nwZ7A9KrOXzBara
 4yxdYpDkBA9Hn5zLrDcyI8ca1u94MoA6KiGUcJCMyibJUVQJElLrddcvgDwTHCW4D+imkffgmwj
 RDqXJDxqqr7rVUTgMbJew8SuhU841s0t7q0IRzRc4k7/BtuUmmgq52+JoqKc/4DFIUDGLLyTf30
 8OVilprZW30R26ufYc7NT/R1Na7DnmqipM2AiSMj8WbBjXSucQp4PexxGw23fqwp0v93S1YCf2/
 ZO+Gj6K4YC5LDyH4PwCJeLk6BdqoV49OBURS/uWKX+MPikydte5uaXbMOEruyttAg23903ugNxm
 ze/WfRQIf8U3UoLagcwhTeWbU27copHfB2a5OfHn0X6qeiTH1nyAj7K7U+VJeD5wivpv3dF/PYI
 JK8VgsrpiPgBYQx3YdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXwrPskzEUwPzx
 7SsksC5M89GgOhPVTrRaTdJDiuUkbrRCu0IgVcAsXcVxGEgjuufmDFyts1C1b0kSh7Vo0mGrwZl
 tm1Qr3SmDxNlV7+YwrqI2J++zTvscJ0=
X-Proofpoint-GUID: GnraLvdtxHZVWbzU9Q91CwsD1KZb0K52
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04950a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RR6Oj5ZeI5PBhayghEMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-20 18:50:53, Komal Bajaj wrote:
> SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
> running at EL1. Linux can also be booted directly at EL2 on these
> devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote processor
> firmware in the DeviceTree consumed by Linux. Also disable GPU zap
> shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
> produce sm8750-mtp-el2.dtb alongside the standard DTB.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

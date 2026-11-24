Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516152;
	b=SnUb6ryxe0GoFRREaM3L2hQ7KOJkBIcMnvRo/aj/rC0IjcjNb4Nw/LnMlv6v996Tm3Gz
	 gjg7oXLoqGkDLqkepazduxOjWE3K9rdXZeVJ/F9N5yqExXQDkoAU41J2Cb7guJl3oYVI6
	 ECvtzPAhccVVtQ5nGPAujowwrS6RxhokRKA+Dg47XVAnPXnqGQftbTuDsLm8DqwoDPrkU
	 BJr3Q3eZdsnl2rdlLan1lhFTMQF79uHL+Xw13bV278WwFXCoF8GfQqi3rzyUuT2wKxzp7
	 Y7q66ZaQjd/KXMKJZGmW++fVnri22xzbL6v2w6IgHxZCa95LgE7dMnXka5GA3KT82Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
	b=W8UwOmnsvru01Am7xWKiKO6P6AnYwPUcTU7prJhKEjLibwVJUuyS8xyHGWfID8J0Jm4n
	 ZJU9xZ8CpFRjPMf4bCo8lFaAOZ9QXs7aWb0O0s74gTEbyhu92hFIMu01MMxk1+oyHO2zF
	 OTOPMv5Nb36fIYeNyhbcH9KKecume4KFQ3wRS/YelmzCSu18uv0PthHdzFmAZk4kcqIvJ
	 uCrSBKO89bwDraEVVGKlSJPzuGp1f4Pvn2273Jrg/gpgwBEXfmghBOH0acMFeyk4l1hy8
	 46d47YGZ8eQeLNQbIbxGLwTJJ3msXjXcNaHesI078fAJzjX+4SEh3g1gRHQs1kMlUKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N8ZdrZYR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNjrsOkr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548F606A32D
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9548F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N8ZdrZYR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNjrsOkr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8YoUM646331
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=isq1BtOcwaV6k1B+5U1NnLpl
	dAIjmTJ+TO6ciHLOLmM=; b=N8ZdrZYRTl7zB7gP1LKPgniw4ZznMWPBcr9GFT0b
	Fe7H8LGIZ2nxbS2jaRVVul26B1IIWYrp1UDJnoMDfToiE8DB6f7Ru0XuZdlDvUfI
	qmyIoHdn1WpjbECp4HFRlQTpu6qPZzQvZjUspEg55oIbpQE6bCjagm+1/STBLkjL
	MwDHhiS552nWzqet2sREks0dEbIHSqN96XgBjLfoSQfLsuta94wTN5rXAE6Zyz9d
	YloTWHdLEz5J0KSBPpFxtjs95IM09Snf95YNf9grOlz0Qheo5v399rIP/qQXFXpa
	gCSILi3XOSXEmgV/uhNLO8rBshCJc6mr2HBxa1hKRN0k3Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd27ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 10:29:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869865a304so3452490eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516149; x=1796120949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
        b=hNjrsOkrhyg8w6IsDeNIS4R2yEAEn0IfJDnenSIHrM4MxqZ/y8mRnvqpMx7Co2bMr+
         rjm57sGk0W2Nd3FDGHM5fMnLMi12PtZx6iWww7R3OEj+uV0QcVhTCKmTr+9YT6DBzvEg
         /AzEpEU6M2fSp8I7wx5HKnIbYDJQ2n2flN7pvM47+8mVvVYQQoG7muxxaauW3KEF+uKV
         ca7X43dQN972Aa81jinX//IQnhbKT/VltLv6If4QP5DpUnDVxaEeVNV3RHKDMXhSfI2n
         M+7MsKI5yEj+xcHX6Q2oZtHUpp/wOoaPjndFTkCU4xabPU4XAgAw5eY0cTGbOvjkbQRj
         wxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516149; x=1796120949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
        b=nnQe8/RcvMlf4nOmVeBv149/EvTmXBhcxSJRj7TWmUNMwNx90apzlpTitRzp1g/5/A
         iJtbAeu2yBB32XayDP0jAlsLbA5UrdrBe7bSTAGJE0jmUGLb+wEBIHwHuDf4S6d9JN/J
         HaA8uvB+Cvk3F6q/gqe9qlgiCme03vw8zZWIiT/jjFSwxOPsYcFWpZJf1YjyAyP2jvWs
         BhDDnBdYreJB9wqhEb9ETuXCTJJ/NujBQ/6VLdE+aGEFRM1DDdGLWAFTtwjJKT4oJj82
         FT66m1+2sOePL+XyLWEjeFKPdIdBT6q3RB8s5bll9VnY+2dQ7wZbFAKlxtP1E1t9sRmi
         MSrw==
X-Forwarded-Encrypted: i=1; AL+hErF7sN2iG7NsBcoWjBg/sn8uptY1vuNYBwrK4uZ8PiBKjgrFm2lgzFfCb4lDLWiGikdel18o+VpM8W7NgDKf6hLR@vger.kernel.org
X-Gm-Message-State: APuU4Z/7+wnz5dTbk0ON3U93girBZiHRv41cOBbImQwHDoRPtQQZB0ye
	tafwvWBEWQ/k2s09UdbAkbLoH0wO+FRjWcZGBzOwHmPeYm//m1DYffkp4V/ztz/i9eSxTL1CKXN
	abRBMSuU2q6QBtgXVJhMCVlqVmuRo2J5Vj5+sxPAdZnTXmRLU540nju8ATFA5IfFkLj4LbfV9
X-Gm-Gg: AZFdTZfu5KbkxoBV/hh7nGRScaAkWGG5FZ2FXztJoMxLZygsrwK0IcbPa/huIATSs9M
	YJ67FdDs7I0PcT+KL40KG5UMhPCohlJEOMpm1iM9o8hCk17Rw5rEjKMWWL9e5zQ7VEHvWr0qObZ
	Wq44foahdB+mKvU3/g6by9zS7/vXo2H4DrYExtTilD+yAxgNBBTbilxgpxdnTiKrk6ie3q3CPxJ
	SsJ51761Cr4zzhDx3WBirfBeaKVoP87BNVIO8938TEQmK4nxJjkwC7ZIZbKlS7QPpDxGb8d4hWz
	cVE9sQFyxNUo3jLCmU5gQpz6Wl7fPhSRHw1JAJsis47XeLpIC8uzW9LxLFe9CaCXbZlGVvsvdUv
	aevcJM4leNKTG0f0Jnw3QJsLVq1KybjPrbunMA3g+zyu2r3zVoXFDA7LZY/C3tnkeChYp7fECdU
	Dp
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr11227795eec.20.1795516149074;
        Tue, 24 Nov 2026 02:29:09 -0800 (PST)
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr11227771eec.20.1795516148444;
        Tue, 24 Nov 2026 02:29:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm46045074eec.6.2026.11.24.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:29:07 -0800 (PST)
Date: Tue, 24 Nov 2026 15:58:59 +0530
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
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Message-ID: <20261124102859.s6wr5l2ta3sne7ci@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b0566f6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wRyLKtKWvOkyam-9G8YA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX1HLZ0j1iftZi
 KRQndwAGRMoIL2w8Pm5JWhT2eomMmOdg0laAR+LMChNEUHfXnCD4qMgLhPlNBzYZ5K1s1pPLEbw
 2HUl9yNBQskY8+twR9kBCn1Xrwv6Z5Oao9QR+1u9iQOXdyu9jBtyqgoLFwmNHVWy1/eF2WIL54p
 4cbLYTHypQC4l/JBcUJ5V5ZjYhPVSduF6P7t043RYvL5RU4wEFcBn0xyKaqvf5/HQi7EEi9YSE5
 FC0bwD3g33sYeHx5iQ3gcCjnd857mUje/UKB0CZ9o7pyeLQcqH+GsMZivRXZDVVr5EhPJXAQdtZ
 kBHVCcqQ/88aLsJJUo/ZDHmSooXas1H3jTI3mzZY32Y1bxCRxDE5QdPdQEvbGkaUguwVSYs4ANw
 JKbBKFbijH3NLZ7CCytIFFVSvqjxy+J/zLV4eEdA1mfvDPuVIHouazOYEFY0T6p7HZp+6CtKi96
 3LbXRU0jkvI46lNRPrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX1sQfKBYVnKrL
 ujz/0aeICfty4PJHoQ1YLssLRZ1Gc0olP1QKrWTio344g5pSrr4fd0dFYc6RPZwyays93hQwvtl
 w9PmHMPfZL1GwTXZpWx5aYb3Z5Cc5dM=
X-Proofpoint-ORIG-GUID: otE88b6QrgnoM8GnmEuyneNStYdI9hoc
X-Proofpoint-GUID: otE88b6QrgnoM8GnmEuyneNStYdI9hoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Fri, Nov 20, 2026 at 06:50:52PM +0530, Komal Bajaj wrote:
> All existing Shikra board variants boot Linux under the Gunyah
> hypervisor, with Linux running at EL1. Linux can also be booted
> directly at EL2 on these devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote
> processor firmware in the DeviceTree consumed by Linux. Also
> disable GPU zap shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the Shikra CQM, CQS and
> IQS EVK variants to produce -el2.dtb artifacts alongside the standard
> DTBs.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

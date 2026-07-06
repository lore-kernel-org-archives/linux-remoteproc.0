Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43124534AD
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 06:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320749; cv=none; b=WnkpEtYgteoSWmEGIaq3bIOtHjiJw8WJHcatjwKZsOzHxWIOH1WIyclqxJNxENfKDEEulDYTxfjppa6tY7UG9LwopQp34FDRtsqXM5Mr/R9oZ2bzqXwhaTCkrNgN6u59WUVJigcJPJnraOP15EmauSNyLjA/LOd4fZ5P1eeSdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320749; c=relaxed/simple;
	bh=qqmxe3ntthYAlQ7k/vISA8CLGMvMEMLypBSimLw/F3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8YhRmL6i1sGNp8SrqdNFfWL7MxVKbt/CKInAmic500hHokp4/pfEtnuSL3CbaBZmBm8Ap3GCmvhRO3X1UsmM00fEWArNw/3KT5WHjDpf7f/1vqPuaefQIl3lNNAdK5fAiZo6gg0rouuiahEJWnff2WEl0K4fmO24wFOyd87Jxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZlZDOFDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UU3OKxH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZlZDOFDV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UU3OKxH7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641cN83615546
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 06:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yduyzXVW89HhFsw9dnAqLvcq
	vsISzOjplnij5DJTHWc=; b=ZlZDOFDVmf0HznMEY9kgq3erv0DgPIjglO7YLCYX
	Iye2x6pZ3d9RdjlXdccH7dSB5kySTiElJZVEdJYBganaFk9G40gmL5bVkr7BY4ij
	uVFiwWEErMx4nTe2/ulipIR/iZkzPe5MKizrlxnxzMcXuRraZbOVF1dyCjpbjGcy
	7W8UrrSx/asaQb2a/OtvpTNgSa3niGxIO9VjZmqd35gLeDq3ZY5n+JNfwRDwZPbk
	d77E7IBXfp005EGSfLa9eQC/09LhNHl+pvThEo57DQ0gMrdoCNl1/aUcaouMesBC
	fV7kMXDjLrJt7AZP1LGpG/GqSpdyzr98CuxZ4B67feK2HA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3cvr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 06:52:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380b630c505so3300914a91.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 23:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320740; x=1783925540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yduyzXVW89HhFsw9dnAqLvcqvsISzOjplnij5DJTHWc=;
        b=UU3OKxH7ccPpsB+EnYzQbUGc1ZxqwIrDSmd5y4kd2+PVuvgW48WRNEeleYqp7/QPSj
         XWC0H1WyLoPcgAK0aMaH7yXHSSfFZXOir9DPJFOTHUp1ooN2zjTv572HQE1jxppNLlcQ
         wyV5v4GOsnB6ZM4gcwRYtQzlidZmjJROoSjRV4uwvDpeChUSn1MflKQrytk94w6fEzwg
         +TMFAKI/msHnQha4LNs0jl+MxSjJLh+N90WdWMtvsLIIs+EhTKdD4FbHCihXyDNcibWZ
         DfHFVc+zM/5BoEFvtZMPAUUcE6K9sKNpZX/gkj0bvMJnTX2gMTg56uCwVZMjDttl4swC
         U+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320740; x=1783925540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yduyzXVW89HhFsw9dnAqLvcqvsISzOjplnij5DJTHWc=;
        b=Uw43Ofe5eKfGJxhbl9C0UyKukqkKWlLqcHgiWW0cqXUebe+GJY7kv0RR9dE9LLXS6h
         kpU73KQzkJ/GO4DFZxxuUXr2SmQCh1xlb6WVmN3hyH8TPwbdzlar53dZvVwpW/pRvXRi
         +z0LUuargOaV21zbHghA+r1xMmxu3JYAnuo7N8B5ydiie2H78LloVtJnbDuTH7y0uCXp
         L/tMK+6cFcRv2TEqlvuf6EL7/ud62keuUR3G7xdu8uQb7WYU3SWa2jsYWq+V+nb4oJvh
         zJs87tC95a0hPK1XKXucmDXdYhl0n7PLcAG/xsOPeigRb65+InsN7YNOYAvl9Z7OW9BM
         amnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWlSlUyscMOMiL09n/aEb4EN8N/RY41uMpxygZNns+rzv17IC4RY4jf/AQJ6gbZfB8yP2tCN9TEOLOGRW3NHcr@vger.kernel.org
X-Gm-Message-State: AOJu0YzuusX2ujUFQSSJlRvw6ICBTUrYNQzPT4ddpEp0SuNIip4Q+mLj
	ORhZUB88yX/y+UbqTMng0YxhZMkqXWIinHt489LzfvW7f0eU9OiyYdsSvWIyi+9eJooAsk9AG1R
	k1a1H5c2vZX7eADXak64q6Z7UR3fdOpd9QA0aIO2MavnFx3R6VtReaXjYRSqeQiApZSpcqlAPfD
	E7ZCu8
X-Gm-Gg: AfdE7ckyK7I7cqvSVa8CawYpkcRBPehcI9Dx0Oik/2upvl8jCHjGfVTWVvIcxbUyXTn
	d01l4E361g4v9itueqqCujAiWYwjgK0nATIBgt016Zj9zJUvvi3GWzrJvMrq+G65BQL7iHJyURo
	2P7CYxS9OU/dK0VymFUsiADSYO5C77IRPgUZzy0pWgpoYWrEdkkuqpUMCM/8rOC41ChfbwnN+5x
	jDI4TDuIdph8pbiu7MJ5YEBUiDNDckQN3jn9JufkW8KZefmyD4ubWZWkt9Q4+7Ut9yt90GDM5Oc
	5dYiuw3sOxefQq0hHBOPv5m+vapYoQHjYkXEacrnyGg92BCN7M8or4atLRpECcIvD8bJOjHaIXQ
	Hy1TbHMaftIvOZ0b5wKkyGk3uGHjmpcX4m8CjVNmTtZChOiGdpTWzHbkMKbP6
X-Received: by 2002:a17:90b:2687:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-3829f4f060cmr8881295a91.27.1783320740085;
        Sun, 05 Jul 2026 23:52:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-3829f4f060cmr8881270a91.27.1783320739649;
        Sun, 05 Jul 2026 23:52:19 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f4453996csm25684997eec.17.2026.07.05.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:52:19 -0700 (PDT)
Date: Sun, 5 Jul 2026 23:52:17 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <aktQoeo_0IGRU9ti@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
 <akra6zR_Z5_D0xi8@baldur>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akra6zR_Z5_D0xi8@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX074LiL8I+5ex
 w3VEyV19N9KAy/b0EQ0qA8HrfOCgElOgmBh9Bw8LtAvhYZkSNgmiEv20Yw6S/q+qOo+R3MZO69k
 BTlRxwUw1wBHx5eBa2c2thc57796puU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX4RmV1cUpXKEi
 Z8xoao9Uf+NjhTUiW0SC1ik5jXoEW6ufEhzSXDplf31T/IxTKFEEciC1lNAuCDwnqZAjYwd2fo/
 FMfL3+1yPQFANJKweyo0SPqYF0n7HiOwN9cL3vHmVEVKjpJuBuCn+gQMmAkV2MIt4kJe3kmYX9G
 0pogsuGWuXXq+5whq125DjuO3NxKc+e7KjAo8sOZLDyUlxA48qx22x8PC3iZhzYJsclZAZK+DBI
 gjnrUMe6BcfVmdlx1teXrdWsCOCAbkDClSDjCfG7Y4iWFA76nk+3tHqyw53KnZLdeixGCiew/6u
 GxRMxPYZr3KUa0dbxChJzmgRuzFu8e/mVDmPrjYmlCSiZqX3xv1fAGBj2z+nhrG69BOnB5+4p4+
 qDl7kWNd09znydWI8pc9cT+VWlBuqDUWy9Uw5xhbJn9A6qa/bD6zjtkIz/BKtU5DPozl2MAs6RT
 bK0H/nqQqx41dTC4KMA==
X-Proofpoint-GUID: 4YG-uMu4sV4lxclfMemNUagkdYjMw-XP
X-Proofpoint-ORIG-GUID: 4YG-uMu4sV4lxclfMemNUagkdYjMw-XP
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b50a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=e9sLxXvMBOhUzl4J0l0A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060066

On Sun, Jul 05, 2026 at 05:41:18PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 03, 2026 at 05:31:13AM -0700, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> > The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> > USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> This sounds like a good description of the SoCCP, excellent start of the
> commit message.
> 
> > It provides a solution for control-plane processing, reducing per-subsystem
> > microcontroller reinvention.
> 
> But, not only did the first sentence come to a full stop, this sentence
> is also trying to describe the purpose of the SoCCP - but the scope
> doesn't seem to overlap, so this seems to hint that there's more to it
> than what was first established...
> 
> Please fix.
> 
> > Add PAS loader for SoCCP on Glymur DT.
> 
> And once you have established the problem description across multiple
> sentences, break the paragraph to give the reader some
> breathing/thinking room, before documenting the "user-visible change" of
> the patch.
> 
> Regards,
> Bjorn

ACK, will improve this commit message as well.

Best,
Ananthu

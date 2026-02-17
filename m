Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3793358C9
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Feb 2026 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329807; cv=none; b=QCmeB4MsSwP3KASacsbX3Qsf9JX1JoLG1hCqV8VAoMrTsexbKoZjHCL8y5mQmW4f+fKTNEMFfhUZippsdN3r3lP7OiwdY9x/ItOhL2QmivGKJxHUazF2lJ5wp7CPslWZH4Nzl2w3YvzEfhEkLVAvREa8/oFoTd9o5iDMTMwOtCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329807; c=relaxed/simple;
	bh=V3NSsjRzcska2Hz3eFdT6Nk/+5O//C+pPnEu8vffZ8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFgutobXSvEiiajZgCKTQdFR8cknABBgEGPZxKMBkbDv901pUqksMLa7jRTNg76hRMTDACiQsNVVCcm1oY1Aew6dNloGlu+rkFv+RB/xU2k/MRmZJA+zZe8Ps6+jC54oHVrT3cijyvdmw3muYg/OxhVQ+oLzZTDhxDWLJM6Wtjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvbWnXo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hp8Ey7u6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvbWnXo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hp8Ey7u6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB3chx1942831
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Feb 2026 12:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1UH/chMZ48M9K3k9g62/VMEN
	kbu6JZ9ebl5YxGNzHvc=; b=SvbWnXo8bVE01HdxoVB5dHi5gBvJ9U7fXumHtkL9
	1/oG4zpREtQ0vkQZfhKVmviqD42HYskFk7WTyNcCfF8pyuNGrMh1puRifu3T2vVM
	Xirm1G0KQsS83oebSmproKhjz4faBSoN1Mv2Z92V6OAOTmh0vuUkHixyK8uMus1d
	ZiqkIOz0i1FnRSYZ09bpqYJBCLzfM4rgN1Cj17zYs5hp6meMeKZEEihISBcD82uE
	6Y7taVlfcGOQnTAoBjrkAkHaiujdgI6TGlB3r07eqFBda/NYQoEW0YdgREDW/s0a
	bLQygjbeJnS5caEz+4td3v5j8leySwazNzfKzzeBaMuoiA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g0668-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Feb 2026 12:03:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954adc2173so689736536d6.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Feb 2026 04:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329805; x=1771934605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1UH/chMZ48M9K3k9g62/VMENkbu6JZ9ebl5YxGNzHvc=;
        b=hp8Ey7u6ai2bb7IV3PsmCA+7o2va65EXVceo9C9+/zLWNGMpnNezdLOei4ZqRIoMT1
         gy6m8+8tcnkM4YhG6Rg2u8xy9/Tdc5zlzEbPSWFyvUCUcwoqgMNg9Rn8CvShpHur/6p1
         cIWSuOaKyOtV9I6whY83b1vEhw99WA76Jq8z8Pi2KUc1JwuTpdvGYY+sOXqrU4Z9yxvG
         ncUABLYHa4BC5bjvbch8mzhqH7DhIBua/1AMyhuQuPOtrLjWUQkKfMXq0PjzWy5oo6/z
         pomqiLCincRytZ3p8b2yZtlyz1vMIBXnK995CY3WCOXR1yqnA5AMPfNl3gMPOVCyN7H7
         7E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329805; x=1771934605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UH/chMZ48M9K3k9g62/VMENkbu6JZ9ebl5YxGNzHvc=;
        b=WEPasO609ywuzcbbJOnEKTA02LamwpWVWJCzNpDpQpcc5eiyq1EOXRU7pXpXkaSFI/
         CaobGpWhYVmS7Oxl1TWGdKhM9yaIo81hRgCwx7K5VV4kGkUmO1CZE1VvQVSKGEJIfdQR
         IbZtQwmeJwUpuv4x5ExyzJLm0HZUNk1b17EaHHrNo7SB/gSS/vLH7k3zBhG+HR121bAA
         CzdmAdR48tjQlNaKAaTJmuZ/NbfiJKfziRmmcFUkgvdWlx+oncIhKzSS/ZUp/Q1iSFFf
         JsiXOubVBMf7m8CZeTDmM83ZvBHXDN3hqEFeLB76KfF+FcLN2nbCMXKmlQX7cXnNukzE
         ALhw==
X-Forwarded-Encrypted: i=1; AJvYcCUCBEJ4bTFFp9B84wIbknHtOwqVo0U5xbI79GjGl+IrsJqFDBliLvg+gBBklb8aVuInBB/aWyyIGkdLZhFlo8ek@vger.kernel.org
X-Gm-Message-State: AOJu0YxbJDae1HTYhlVZTLVJkPCwr2bON+jGyF8H3brbWlMH8ocXtCLq
	TJtksnXEDgLcR5PTT7xkipv0L0GWv6kjXPu0JJassjnVDlP81rSb1BfH7wO2KoA5yorlqB/45hC
	P3v/1Mqncy13+dwWKMRigYOtgCtQX+NwZATIcStyT9MMZlb1gFdw8ElCkcnMLvEXNKCmt06TT
X-Gm-Gg: AZuq6aJXHG4F2XRE55hy+nwD98BfI0Ekk6yOoXt/5Yp0e6ATthkxOm9jbrGrG3MA5js
	PssG0UbiV728tW1kmgcCaxFRDgP2TWulvfm+XR2wSwV3AKSNCl3yzURboyppvmbil0xLvqE9slU
	6d54Nc4oWWUEd019gdridS8TzY8ZRnhjubBNgMYuqBFKXbIbSet2YvCo/c4PqQIDZ770XpzGkaM
	a6nxwpvUSyk7/pcxzXhA1gtIjlf+eAS/RQDIx7CSeStr8mS3fnjyAnnrLvKm3cYNdEhqiFfBcBu
	Mb5sVxsZfkRaF++aGvHTvXHo4fzLvMrSTM9FS+Y22AqDPucIS4Fw/bAANQV58o/stvJt5TtobzF
	6nIjsJiS56G6ZskP9th/Panjlo18oOC/vPhyN
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cb4d9b6f08mr1048829485a.6.1771329805252;
        Tue, 17 Feb 2026 04:03:25 -0800 (PST)
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cb4d9b6f08mr1048825385a.6.1771329804732;
        Tue, 17 Feb 2026 04:03:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836aa0847asm555188455e9.3.2026.02.17.04.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:03:24 -0800 (PST)
Date: Tue, 17 Feb 2026 14:03:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: glymur: Add ADSP and CDSP for
 Glymur SoC
Message-ID: <45m4c3g222mfkyiff4qqcvfwjfeqszrfvsg6dcwrlnanvrodtg@ilheo3ppgwsf>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX6NMoIJ/bD9B2
 aihn9YmzGnUcb7H17THWGIpfqmTDTf5a+Lb5BZDS1qKJQW4qZV0D4hwFyfGuBjK3LNLs+Sr3zVd
 9E/1TMRzKWmkMayi8+dpLmIMUqQdVlxMYSDPkmnHa4ynWtlHWdJYFm0pyfAOBn5GSO7oB9erucC
 T+wz6hyLguVQasmIxoYqAuFgHx2m0BQVGmJ7GK6QnPSXnPkofZKVNxzrkfoRc/Zg3loVn7kF9kC
 Ux5MhLU4JkzCk9blv5i2aFTK6DZ/VNtxecj/MGzgRBryMQch7x9truT8u7sgZsC5NKBSKI0Ne/b
 YHbOcGQX3W5JdGrFLLC7SCunEpmkrXPzI/yn6Yacw0h6dN5KOBX5bRlarxNRDZ6X0mO3DwjoLc/
 895gjmsgqLyBrrPyhFmDIASbiSaGym06rhHC7ir2AtLWs1nLAqZNq6ODid+pPH0kDG5pQQD6P9M
 vTxTVCYVnJtn9PAi3og==
X-Proofpoint-ORIG-GUID: KWrqzg0JcXmvmerBmWwPaKbPynvZjGvH
X-Proofpoint-GUID: KWrqzg0JcXmvmerBmWwPaKbPynvZjGvH
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6994590d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=JOSM2k-csAVseA6ZNKgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170099

On 26-01-29 05:43:57, Sibi Sankar wrote:
> Add remoteproc PAS loader for ADSP and CDSP with its fastrpc nodes.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

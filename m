Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F55D27144B
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732545; cv=none; b=p7iExhq77yw+KcTeXP6ZHXLLZQIx0zfx0tGWUR+X9fHlfOJ7qnP812jHeq0uqvi1HpXbudAu1U/khTEGj6cNjXFaPyXpYBTj/fHfsLIjr6Igv9lXdVKkoBmZ0jm9V7NbSgn+RUJuCoOmUUNv1d5lDPM6ec7zLD3cevZIkiC0/14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732545; c=relaxed/simple;
	bh=ONh8Ox0sflnYK+apVyW/Ix8nn3epMvhEIggWmET/cSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8URU4c6LLysiohMXyFkqRDYvpFb/AQNFd6/enLSZuCWVhkyWKpHyggr4zt0gDO/clAXI3ycORBxbpz4fw3IdDAs27hwq4fLlklRunJ33YEiMmv84NLAZAuTRRIGulmEi1+w8vTUGks9YGOTzBSFbQyQOuCWigkbXHU3tKeZLpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVoPJG8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8wvSFoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVoPJG8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8wvSFoE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TJ0SZG1949148
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjCZQXKJgjZ9Ks+eaKcXCSOamlGnnAHP4v+PpAcUslk=; b=MVoPJG8zmi7s8jFh
	fHUh4YhLEm3/oo6/Mdbf1y1VxBYUV8tfiAKf+97EVM9gqWOueJ/RltXO80A7aHah
	yPVqegw9SuIu8SzVyfiKhHqIR2NeMKAys+MUpWKfWMvD1SX9lHFpSms4tuKqt5OG
	uPuMhDC5PGjw1onmS7l53hNjT2JSm38Bh0olqwAWDXwQizHq3jSKXk1CQGLYerZV
	662F85lZwPsbfGuICalb+EtZPYeDd0OKY4xDdjMN4/GT5EU5IgAMplEmS9WRqPPP
	S2UMvij4qHVzN86wBX4+9/7AtMB+pNHemV2XEJeezF0QZh7mK25NcX0Ip3WbQ/oo
	ZN/kJQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1gsbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:22:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b70d8095daso1754601eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 16:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732543; x=1770337343; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjCZQXKJgjZ9Ks+eaKcXCSOamlGnnAHP4v+PpAcUslk=;
        b=b8wvSFoEQZh/E00JIcLbJi1ktsa53XtOVod0XZKUm5gOaM97IMrd3cCebGGZKHnV4U
         Ed8FBYBxP3uAxckcwsgyMPECckyAiNV+m1cw/wGO+KSHWhgDz5dciWEZgWtDTn+XyltS
         bJePVtT1DnkqDTqQdn0QQ/ff7Y3ikrjaXWQ6KVU13DYl2upiShEpH4qHYmQtQGw0OIvr
         RreyrwErXpSD0MDmyhtQKsSpT8tzAI7EsImPUimO+896NdueR3s4YSeb1oMt4JWew550
         3khZCdaAEX4W42klK+Vml13IcAZFofTUfdpNYk0uBSRTfpROLfsw6fA2HWeoSVdui6cS
         g6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732543; x=1770337343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjCZQXKJgjZ9Ks+eaKcXCSOamlGnnAHP4v+PpAcUslk=;
        b=q3HM898mSDxSNiKPjzKeeVRDX79EXSvhHL8j++y0T3oW6BopaghjhA5U4rNS0pID9T
         TpaY5tABG2QzWXn7IcB8RNaEIywLboAaBoSlnXtXJA83k+PC1xXxQWoOzBsGMOqBASSk
         XgEz76GJohKOmvToD/Nr/NspO/swpAFiKTzd0luiRXbPFx1R9rXAEtT4QYWYrb57ZoEr
         ChDqK94nQpoNgNvBURKkOvlWIMyBPL2MdTaCsTVxrdwIUZWSHc7X5dQi+YWEpB3K3cUm
         oAbrM/WdJ9UWS5fCb2cJiTXBD3lXHRe9hLIepvuDqSYsxvlr66zfjjzYt5be20UZTc7K
         XqRw==
X-Forwarded-Encrypted: i=1; AJvYcCWm7eRPTeGh6l8X06zHk+uV0s0GzC8j8Bsej2e9qrKEq540Qx8BpFku0i8TTLFm33+TsRZcn+qP16zdzQI6bm6d@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/WIm85+AFTgyYCF/O0qOHo1qAKf7E+Xp5rYPbQGD8A5UE2a0G
	zppP++0+EoNkLuY7b8CY3MGmPsDzZMxza+Ie7qmUP4siQvUArlpz21tnHhD96DFdduRpMN0G7Ek
	OVvtSjCqBFK6J3WVLqQrPBA3ygSg6uZjYg2EVXE+fgbZQyAIQmxBRPZz7gA9Rt6AZLiI3cUp6
X-Gm-Gg: AZuq6aJ+WKbIDGvxJibH5/S+0jFWz050WGwRErye4TwstZaEgtIOFEb2UWo14rEBOg0
	w8Wzm/i3KXYHRV6ZzPg0nNLzf0BWT3mIjJc9//6hHaePYnI6y3tGtbFYYwrFaWs7RjG2KsjYjzo
	Bu1OKlv3D5snSna4xF+V0kmtBaKla6uco2RlSkovQHkOBtwPgI4NFNNGwLfxLZKwQjBGMqdimFe
	iaO5/12QejnRtFYawfLHtzyVwsi3ln6FMdWbMGX4kc2BIoNaHfc4Zkju2PXoTw9ZMDUErU05/K9
	5VJ8quSt8CMaOwyKeSBBD41lRGbCSDXtHZImx5ReD4B9IxusaTiTzsevPFlCjPlxAhyFXJ/ilT5
	PDT/2Zin6AEVYWzn6/J43z8iyVI9J6A5p2gVIpw7J4kPQad8bxUF1ehaugmf812k=
X-Received: by 2002:a05:7300:8ca2:b0:2b7:befe:3743 with SMTP id 5a478bee46e88-2b7c866cf6fmr563459eec.18.1769732542860;
        Thu, 29 Jan 2026 16:22:22 -0800 (PST)
X-Received: by 2002:a05:7300:8ca2:b0:2b7:befe:3743 with SMTP id 5a478bee46e88-2b7c866cf6fmr563439eec.18.1769732542165;
        Thu, 29 Jan 2026 16:22:22 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef40asm8798357eec.13.2026.01.29.16.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:22:21 -0800 (PST)
Date: Thu, 29 Jan 2026 16:22:20 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] rpmsg: char: Fix typo in comment
Message-ID: <aXv5vErz5I2AFmb1@hu-clew-lv.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
 <20251217065112.18392-4-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217065112.18392-4-zhongqiu.han@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: egAOjAQqbq0omh1NtCJ5LEfWODBXRs8P
X-Proofpoint-GUID: egAOjAQqbq0omh1NtCJ5LEfWODBXRs8P
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697bf9bf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sgd4GuN26VHFCRKVnZMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfXwc83GSAvZ3fh
 a7/I5QS+nE8HaXQIhzxx2oWpquIHtP9TRVQt8Ov2uIWah8a4Ge7uaEWi4FD4FefgR3Kr69hOw1S
 XZQ23oaJA3+21rtZQPaRdi053Cc9Wobe1Alk7H55DdtGHcPiLabIqIgZqZoEwHZRysBN7xXUp5S
 57vOqog75TJhSPXsqpzwLH/x426VGVdFe0uCaofkRnga2am2tdOcxs5JvUVcw5o0g0eWIkojT2Q
 pj0ZrbG67ujMLwW2MdK4h+uA7y+7AUm70X2d9txA+30oDzUglM9NJLxxozEsl9OAZ7pka+5W6lB
 O0T5/BNIBAuBRJ0edxENsVgDcLB5EgJVBCWlj1fmcvBdOO4cvFsdoW3oVqsm6P6FPfW+iOX07cg
 xpaFqWh7Gul4sXVDDnQyKNMXqw113TMYzXxNtSEPd2K3sYM8ewI1QmUja2FZjgkZJO4jgfsX2qu
 cuZgqxqM0HaQjMtFa6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300000

On Wed, Dec 17, 2025 at 02:51:10PM +0800, Zhongqiu Han wrote:
> Correct a spelling mistake in a comment: "Storedit" → "Stored it".
> 
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>


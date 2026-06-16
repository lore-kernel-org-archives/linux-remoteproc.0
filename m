Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2D735CBD7
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jun 2026 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612370; cv=none; b=Q7w0r82EOULFTnO5zzj5Gp/4rwj+Xbp88c9C+VSGMNxuPsvBz/ZZxHC2fNS9LA3z0BozGWYQIi1lmeuBd6/xMM2D86AA/0klKDta/U9wQz/bRPmoVc+JAXD2SBVEXQ9h1tUEJPnjh7K/7b2p5Snz6+HBOPZWC5c9IK+5HDkIL9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612370; c=relaxed/simple;
	bh=XYaA+UWCbB0K6C+NNWFgXK8Fg1SV26FFn2i+1bmxouE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9ZHOD8+qESyS/t/z15FvgmzWGpvSCzEgb3+p9TFDSZ7r1rFUcDFE5DMpUfpd3Vm0YAe1F48xB8fpFR+66w2uwKGt0q2Hj60Ht8Zrl2hzXrXIm3B2JfpQGn8KihyMiDATSLr1P2KuYqQT64ECNq0c0EJl6FN4+1Bwhj/8LX6IBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khvTqkE/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTaUEKEK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khvTqkE/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTaUEKEK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9ViH2894202
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jun 2026 12:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65fAjQGthFAZQ79zujXvX12R3jKdepcD5FehXN+FWBM=; b=khvTqkE/QCt/mpqk
	ePUpkE9pYyKhtgeH1w6uH9a7x0VFvABfwn/BU4NiF5eUWyuw+OUkvpi9Edp3YI8y
	BTlUoLHhPgS6ikZ2yQNOA9Bnfk4Oi65HfcPN0HettCis/GXvU+qxOV4lE+Fe9kOy
	zfxllhuOXfY209kRu+wIGsBVr25a+tHgK4WKGZdjOg8KPAL730dkHfqjGivMN8Js
	LLt9ljlSn0wgqDn94AO8btO23cmOUFeh59p2Phx6PXp9nQW1ypuK8Oq9S0bjW/hz
	7rfqB9WbFTxyhpZ4DPRWFPEla0InaAEsTvFLh1kMdazoZZaUXZmbIUkqk8u9U49R
	G26TlA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253h63w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jun 2026 12:19:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966d2f25b83so1197241.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jun 2026 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781612366; x=1782217166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=65fAjQGthFAZQ79zujXvX12R3jKdepcD5FehXN+FWBM=;
        b=aTaUEKEKCP8A6g2vk60zCefgBYhNxs1fNoYDIij/QxG+XO7O0EcClZTs6e2sRWVq1a
         7TuSuTQDlfNifWD40AZyMHixa/c8f7nkqmTZrUOIvhhMcMf7BWxY2aAXVZIiN4KE9Uxr
         J+TPUG1E2mdIWa5iSr3hztFIUCetl8NXO6JZW5CHJZPx+gWkiKG5obv8LtJNJixDDqga
         hxQAm324zsIIvdDt6WEPkxH4WTu3dOLzZmp8JG14yRqFvvMNTGIWutsJ8HRqLtUFzf3O
         T5YYiOC75pafFyQ00PamaOIisuS/XIxjXoGv2b8b4WTj6k/ypSxUsTmKEj65klXNPTlN
         dosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612366; x=1782217166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65fAjQGthFAZQ79zujXvX12R3jKdepcD5FehXN+FWBM=;
        b=j650lT1+XOYuKdMiCCB5gGIUqmcSq2+Yh9n1BJQvqzRvsVkaozZysYZMDcRhw5WxWg
         mYnpjePlh+OkYCJFEm2p4zTLnBq8tC7jiZDK2qropTGfg2LRgIX61iqmRlQCH25+oaXa
         gPo7xueeWX5iue83zGczLQXQGP6xJchj0a4pz4MeGFI+cXmc6C0oHr9Z1YRQi5Tt3s8F
         tBkCfqPj0Y27rLw/CJrQWwn4BiyFGK2LrK1TEJ6LLI5amhiLUkFg+0wC+GyMfpSrC9uD
         +taZ6Jc1WGasxwL2QeWGU+cq2gEt/d9HVbCwbSfVLKPf5h4+JDOnNNBo47vn+v7vDSKi
         2HoA==
X-Forwarded-Encrypted: i=1; AFNElJ9E1I1urHrAjjnMTLgL7Q5qwvgtLIanotOmOwGmfQZWnaoyoj2ifMSDdMg02ku2bv+tOFSQDO4MKvLk1fyLxZXT@vger.kernel.org
X-Gm-Message-State: AOJu0YzT0DVTzCvy8ZevoC4yuGKQLayHIf28LPgf5HvcLLWPJZpryi6a
	yh/QB+WhGZl+FVbxqHj6XfaFxld/imGStLXVajkHI7DDvzSFpFqssPy76Or1o3bZJA1CbUUsXg3
	hWHEkH/oAmwFWhrrfQ8b3pggPRGbzbxggNIrP/ihgRy6I63HVsmRjDbUQ8MvRENmk/LNZNrFi
X-Gm-Gg: Acq92OEslgqPXb5yUl8/sJ6sQzyI/fm53ShWV6qdAP5euxCrzc/eSG6lL3gE8/IpQVY
	FLu+4ougtUOdiZgk3WgJcDPt3aTQyjxTKOUn8DGnLUMBzNBV+uZurK/Gmh9xVduOh6V+Ro4zbiD
	bQ3KwlGLS5KmaScTmO6PnAcxKqTAzGozzAFsWNlyiW6XzTB35nnGYUY4wN5O8xEgL6bF8I9cZa0
	ZTbF02/jdftJki0FyuNewGx8Te2SHzQ3vzFQ1dE+yvfirqkig19v0jpcqS/rpthbjcn0fsaVHjU
	mjcQij8T46s05Txr+jqc6DdhYGBe09zT0sKL42s6EFiEmeSiaALesCN1AF4h8X95+VaOtXJ8XzJ
	g5w9D9t7blRUYl6ZIy9vpnOv82aF0mgaO6K+W7/+gHXjfkg==
X-Received: by 2002:a05:6102:d89:b0:633:7c8:37aa with SMTP id ada2fe7eead31-71e88b9fe73mr2995459137.2.1781612366248;
        Tue, 16 Jun 2026 05:19:26 -0700 (PDT)
X-Received: by 2002:a05:6102:d89:b0:633:7c8:37aa with SMTP id ada2fe7eead31-71e88b9fe73mr2995449137.2.1781612365746;
        Tue, 16 Jun 2026 05:19:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4423439sm640349366b.2.2026.06.16.05.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:19:25 -0700 (PDT)
Message-ID: <026fec8f-1375-4d12-ba7b-63fb2849a4c1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:19:22 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Qualcomm Maili ADSP and CDSP
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e-nFklmsG-tjptSoTfTrHkcckCJqDBFi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNSBTYWx0ZWRfX0tcVM2Q4XL/6
 vr3Z2jf3q6zv7QolkdFZ9fYjMTp51a73h9EeMqh9jTyCH0ov3ycpycQUdT0uwMWr7gPF2eQCCtW
 +g9hK1+aRC2vfQDB5jFKvcGyQIuBq7U=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a313f4f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9ovQy1WoeHIykmxQn8UA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNSBTYWx0ZWRfX3sULYXLtVC5L
 UbxLT9ZtAi+O1XCkN+GT1VZDqKm1AIxBQq+AVZ0tIKuULyn78q1USa6NQu0zD3gRvw0e+dGNfO1
 cmdwnWZbsZ5F2CgE/a76R+YUTeiiEQRzr5sOV+CLbvl8o2h62Tow7rDo0x30rnpy8UZepsaS3Rq
 tvn01KLathZQIflM1mrY/zovkJ84BzXcX69RgBKqS2aiZsM26Y/NiXn47Lz+0bILqSQQRfTUGNn
 VEEAOQS+hMusRH4nu8fTVMYezAA4mMm/VqTyRTuiSzMPvSraW/MY/cJENhM9hk2B9/JZKYfJ3WG
 nAgSPBd2ZjuRy1R5IXAXjLGtlFxnMQMKJsTbUymMTYJf/qPNZF7Lo22zx0IhdgWSsSZW5q/4a4f
 KVemmFQsL2wGN62BHt9DIeUwLDb723kdhTN6vLEPrd1MwRg0Hz4Ar+s2iD+PRiVyZZ/EQrZGIhr
 7wFhLViu7yrYXD0Vl3w==
X-Proofpoint-ORIG-GUID: e-nFklmsG-tjptSoTfTrHkcckCJqDBFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160125

On 6/15/26 10:30 AM, Yijie Yang wrote:
> Document compatible strings for the ADSP and CDSP Peripheral Authentication
> Services on the Qualcomm Maili SoC. Both are compatible with the Qualcomm
> SM8550 PAS and can fallback to SM8550 except for one additional interrupt
> ("shutdown-ack"). For CDSP, similar to Kaanapali, "global_sync_mem" is
> not managed by the kernel.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

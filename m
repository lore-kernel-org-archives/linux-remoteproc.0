Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD81E9B31
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 02:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766760; cv=none; b=rAItd7zWxborKuDWFYAK132ZU4pXeC6bdFZ3txazRIxDyhJnyohKAWMWJ4dFufLsqNn0jzVAZWyiUucjFqPGxV2WPdrteXjdAjBsDIeMU2YDfMI6+LosLyoeQ+WuCJrRk1GABeG/J9q96UdKlMjDbJ99A236zaygwL1GxQGE7Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766760; c=relaxed/simple;
	bh=V0o0RUbSBp5pz28ZYimBAnWbI9+qlIN8juPN5I30FXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jl9QrAMKmsWIsSv9nkD6EF9RWnouEbb5VV+WzFcBkgRVf7ub4oH6F0M1WbxxjKCOfOOL4c0z2NfRLiShbwro4ktljbuiy1YKOk0YhUDXXezV7xx3y6ns9bpNWWAm6a9/rxa69A54vOz2n0wjHluhHTXMBnXaz8VTqWsBAv2djK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcJ9qBim; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcJ9qBim"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1Sdjs030031
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 02:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kXk60tSvBFJFBNcCoJMszP6h
	av8IWwZrJglPAylRH68=; b=KcJ9qBimdnC4DcQ9taZSKFlEBr65ZwgcP691v3rR
	rVBr+bJOKGlI7De2HUw/QaU80Zor7DjqZT4daVHVTDgRLtgDeguznlTSq1ssCAIX
	SKrDS7FnshiAIjqMrFr8foGlk3n3PopOtyyeBKqP+bpMH4AFd3ry/8yzEP3HqpNj
	WgF5phMsGUnfe31Y07O40j0MimurZujxMWVw5rsIp9bJjGEmZJ0hlBx9517haYC1
	6zm7Kh58VygsJgmQbqC57zfsPwe3o8uJs73z4lxF9XgJETc9fl6Xu0/0y3KdRrrh
	uSmPOVafU5cq87OBUHsAnfXB6nv0//HbjL41ij3xTRb6BQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpa0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 02:19:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d7f90350f3so11421361cf.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 19:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758766757; x=1759371557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXk60tSvBFJFBNcCoJMszP6hav8IWwZrJglPAylRH68=;
        b=DnNtbcnDHTvhYXw56rKMNaza6ZbY+/7UrHCXIpVUgYZXC7k7vkvyNsBvJhovLM0JQi
         urvTR2c/6FSqnYOF5qS2SgyauPGuAKcQtb7cxN1Rs6hxqoAF+i23Epy5pezZV9gKl+sT
         1vgVgOprQCVxXdVix0Pf251sv79Kab4Hj44r5uBJmMfgs1sN0kJ9bcWeXbCRi9zAY6xv
         oHWMPibeVN9a1W7zUAqfNyXt8EZqg4iaQd7QTPF36Ftma2jXd1VOhO/5U5gtt1NSIdnQ
         ei1bmLmFEeQOpfJH2WRSACnaQeN9Qu8LQiGeKEMFqgqcuSLj/b2W+fFSn8ek+mEJUBj+
         n60Q==
X-Forwarded-Encrypted: i=1; AJvYcCVML2ht0+QBaBB6JDXyLtXiLLjkkWW7C5DFckf30g/Ixy/R9I60ol4zt++X2G6lk7ioQAa7A5grUpRRzw2FFVVn@vger.kernel.org
X-Gm-Message-State: AOJu0YxBDvb9h5Zfkzf+swzLWFvDTUbW/v+kHCgq0QfNabrPKcHHa1Kr
	iQKq0SL7NfZX/VRdI1spctdJ/v2BT1ziWSBc5T4ktRTvr3kJi66LZegqbSDBfcGN+kiIVtr6sdQ
	LcP/afK5VEpGAW5Qinzy7kLOqOotbjomnHoVF5KFbyl55toh8c+wLjXKPnWJsHTJOwkn0N62C
X-Gm-Gg: ASbGnctF9IXWhADbC0LPZLiLHUQUBVhsXrvcaM4MsNQJKLSAsV5kVoGR6FVYbnoq7cs
	cOO1CIJYowbC+C7jpIBJPQPGxG5Dj2QfomN5K5mCAV7T9WzmQrPMfBEagMmhhZl+MolxpBI0m0h
	V+qCfv2aYjXejCMYbS+GoQfz5iPIiDbzw2db1KhymGRmPNTP3dIVk3oBZuP3jNZyZQFnQpw1AYX
	+x2hfsNP9O+ivmGxHUH3jvPZ84gvorqJ34uXtkliN2iH9Ly4lDgNP032VjBfQB+5alvtlOwUVvs
	9J1HEFj6zLWJmz7261n6UQU1SOoK0ic86D0W2EVAB3g+idbGN6fsVOpVLqpJ0O23gD4cl5QRFmY
	2WLMr5nzExjOyutjWviFHblF5gQb+xHq4IYAZ31Zz84FA+q5eLvhD
X-Received: by 2002:ac8:5712:0:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4dacdce3156mr13155381cf.33.1758766757156;
        Wed, 24 Sep 2025 19:19:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkHoyd8pfNk/u0CL0VcNtv5YsWD3I6SuFs5XOWMFIZNGOfOtmwhgR8TS+cBKd/zfDeZIjh2w==
X-Received: by 2002:ac8:5712:0:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4dacdce3156mr13155191cf.33.1758766756673;
        Wed, 24 Sep 2025 19:19:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831343111asm244566e87.19.2025.09.24.19.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:19:14 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:19:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
Message-ID: <h4lk5psnwx3ma3um2sozhcdccwhmgmbje2lgjks2czcrzn4mre@svtnbyzvrivw>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VenignRcfmq9Y7VwJhxdhcg5bbsnLYhE
X-Proofpoint-GUID: VenignRcfmq9Y7VwJhxdhcg5bbsnLYhE
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4a6a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TG0ozkzLEzouTHCdhgAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXy3lHIImBIgDH
 X6o8zpP08lPeDRIUhF6E1iCNda2JUfmf5LosBY37dF6XPKdTXDWUD+B85WeUCz2EawjKRPsJxd+
 UGYb216M/+KQW79lrDeTQ5gsuhcyazt+CQ53763qCG48INrmG44gNI7K9ZHep61CReA9E0zfumv
 CJgGXaVc73i3qIJLPuy7V6zFgMx2za+/55W3Poul/5+k4pBSzZbrs+E5CY+PTcr9m3w4ei7DxdZ
 12lWjFe+144Suu7iSg/mbtSWljHzzbY37KBASuNmpMD7v1PKNFqblWDjFzML2nL5Vx4Exi8BKeE
 vfYtPdt8kERfgKLVCYcAtjN5nPBqiXFg5kXWvoQYt4dfgfbyOtj9YssLryhkTGbNmB3VgfRCgXP
 X8DbxG0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Wed, Sep 24, 2025 at 04:37:22PM -0700, Jingyi Wang wrote:
> Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
> compatible with SM8750, which can fallback to SM8550 except for one more
> interrupt ("shutdown-ack").
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 2dd479cf4821..be9e2a0bc060 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -28,7 +28,9 @@ properties:
>            - qcom,x1e80100-adsp-pas
>            - qcom,x1e80100-cdsp-pas
>        - items:
> -          - const: qcom,sm8750-adsp-pas
> +          - enum:
> +              - qcom,kaanapali-adsp-pas
> +              - qcom,sm8750-adsp-pas
>            - const: qcom,sm8550-adsp-pas
>        - items:
>            - const: qcom,sm8750-cdsp-pas
> @@ -95,6 +97,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,kaanapali-adsp-pas

This one and the next entry are redundant. Do you see why?

>                - qcom,sm8750-adsp-pas
>      then:
>        properties:
> @@ -185,6 +188,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,kaanapali-adsp-pas
>                - qcom,sm8550-adsp-pas
>                - qcom,sm8650-adsp-pas
>                - qcom,sm8750-adsp-pas
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

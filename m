Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5EA299931
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759138778; cv=none; b=ErtAMuBHHtvs4NXwrlFlmvTJ69dOvmISYjL7cZ2BpwjF7thOK/wfhZFXOxRhkr2NEqyHl3OgOSvOoVkXc1S7NN4x+JYex/5bPUnylWeTDpBiaApnfOEl2TkSP6UO88lNHx+fhLQT8CAtjCyiTZeQ6lOpDOF8kJYn9Sz2Gu6ISNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759138778; c=relaxed/simple;
	bh=wmaOlvumu+PGiHBM0uc3l7RnZ5fYIZJFS/xqPDKn8c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuFOiC32NAw+jvGEV+cBBhilu9+CynYKrBFqbn3X8iB8f2W9iI70azWvVZxUEgVRrK8ugETnF91oee+Vx6CHBGod7ivk1JKtjOz/qxMUDgSWsf8nRK1dr6xuDchDDDxCgfOm2FfMuyBsPC6OzH69UsWTeIqwV8hfSNCCuqdpJBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9UoRDWA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9UoRDWA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNJ3uS004221
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 09:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JazvdgIvvnPig1J7Sp2nmitK
	8Kg19jIV07jlBIPx7Gc=; b=b9UoRDWAyoPzK/GTFxIlR94ivZ8WoFN3B38R6mra
	Tx31lzGZi/7MTQ841aI4hnxWt4k3CeELcPSYPLlzABgenKSfxuMfBPQBpxFBcqdV
	bK96fWdS+A3xk35AVAo8gUWQ6K4o/C64tnL3KagoB6hW2G4NErs0YvphwSvbxvCb
	YqQiNMgnxFC3Gs9VhYuRGbJqkGF/okZ53h4yHv5BtFCZLNeKnA2vaO7X+RI6KsQk
	iGEmiDVC5xppEBk0jlIpYQ3M5wDFrdQbMFFdw2tO0LYUIBRWfnvlZvls/eDaGzle
	bTDIAx7nWnFC7ETAdt7KHGfdsG6AeEtbDde/yfDJpIVcbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hcftg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 09:39:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-859b89cd3f2so1025521685a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 02:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138774; x=1759743574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JazvdgIvvnPig1J7Sp2nmitK8Kg19jIV07jlBIPx7Gc=;
        b=na7Ij9uU9ItgX4y8CNwdF/LtLqClhbPPM4A3qXfxjexDb6as4XlVN9WGb09WoKMDgs
         vMFBqINxr0Qza7zYARIEC+nXGp4nfHbka7zAlwhDn9XG+j2Dydu5lCZ2+53at+Jbidrv
         gSD1OnSzBa9fbag4qZoKpL0ckctKJIlSt9aJE0I0kxG5EGSArr9T1jTkAs3wZ9Nw7aeR
         9449jMbLstxYujDfYFbY/uvkUVpbd2D5ohZISgJFopfR+3xMw+0G38i17B9YXr2gXKvP
         WWODHfV5vxa/vgAQtUqMF7XumdX6m8xxjWdfPFMvMYJzOksUEPehSnRKrakFfVKkQcTI
         HBZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF5+YaFcX6KPIy0vpsbZlsQz3/NUsbIuuRaWBSWnYHOK9IWPjFKOn3JaiB+VGCW0BiWLwM6z7aiBXXqXLz9kQj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+s8BxUwrh7JM70VAHpBk9EOfO9uSaoJ9scLTYu9b6fkmaY+43
	3216i0Qa1AIT0keOa5/UWkYFVvExKMlICAy4A7a3HIrMqBbi54O7iOm37yTUC6BIXP0nReVJZeR
	fg43m9HyJxGqx0+IzgfQG5xvriOppQ8jFRSoI+3P7Z1E8k6v9DlXWN35dhB1fraXG9YpQDFUi
X-Gm-Gg: ASbGncsEqczhGTKi/Uc5W9x9h8umLyNbQz33lVNOeuSMkdrFRQEhlZgWmYUaEhc6gaI
	vNapyq0/C9wT65iZQFLYI3sDxZArGHUNJcOGfxpm083xjc19jsIZS895kVwhN6vNW/bN2wj+BFb
	ECoHbv14cSM5rLldETi4ltOzbQLLsLeltuNgbWAykFsv8YwgXJFHQy7aKy9tG2LGgrGUgKzsM9T
	AtcVEJMNwLqmM0gsh7gEQrQ9XCsdlcJmHqjV96Yt4IvvZ7FXYrBlznDaO9lJzGFLY4Pr/uFqBRM
	EpH6Szd4AUlM2SSHbPp5AjNizkTjqh3dmflnQZh4RdNIa2KhqHn71J/7jAuwX7zrtBZpfvim+mR
	IGz+rm4vXU0oFM++o877ItjwLa4w+jhZ4eFjqLWD74Jf5Q2XUcO5P
X-Received: by 2002:a05:620a:29c7:b0:850:222a:817d with SMTP id af79cd13be357-85ae26a2f22mr2164877485a.37.1759138773702;
        Mon, 29 Sep 2025 02:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFspqGP3TSITY97/476JsiITLiXHo56C+x77gMdBmOfU0xXye44VDx9fxwmfyCsYh5US4mmg==
X-Received: by 2002:a05:620a:29c7:b0:850:222a:817d with SMTP id af79cd13be357-85ae26a2f22mr2164875485a.37.1759138773232;
        Mon, 29 Sep 2025 02:39:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe7fe4sm27035921fa.65.2025.09.29.02.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:39:32 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:39:30 +0300
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
Message-ID: <maeobo6qukgzn3acwtvhfrvwrfwo4q5pzspem6htbybr5xuwlm@opagojsav6ey>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
 <h4lk5psnwx3ma3um2sozhcdccwhmgmbje2lgjks2czcrzn4mre@svtnbyzvrivw>
 <d374036c-1263-42f4-b9ae-13b21427b01d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d374036c-1263-42f4-b9ae-13b21427b01d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX+jf8QLIzIjSG
 lvJdkL9U0WKC1HQ9A08MOGxRZQZY1aDDyC8+1SgPS2FrsTA6+L+iATkwBK/vXsL2vB1kxMM6E2o
 bPyS1motqDmh9ws5slHkn93qEfG0NmfTZhzboQstubVnaTWCPLh6d2+2zDd+l3ia63ZcJF6Dpk4
 PztWxSwNOO4Zer5IfWRvQEgwFJ5ev9NNhNpQz4EK/vQiQ9Ym2yT3c4viBxHZzZFrP6dk9mc8ia/
 /uptTAxOQdUPKJYBC33Q9rVEWxtKBdYirgJqMj5Gjf7pxlE9WgdEno/YEBZWWMy4wEYEWNkFR5s
 DMr9Ne94IhU4r4cdbQeulpWwq+sTidP75ysSGjcwJPXWNMr8NybNrult41fV9AQMtYNWXE7+auV
 9o7pYotFl5oB6LKgCOx3J6Ch2+Jr/Q==
X-Proofpoint-GUID: PPi2viFgi9yPlHS6ytWonG-ho1PwbOJt
X-Proofpoint-ORIG-GUID: PPi2viFgi9yPlHS6ytWonG-ho1PwbOJt
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68da53d7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tbtOcBIPLoXn284NOI0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Mon, Sep 29, 2025 at 02:06:11PM +0800, Jingyi Wang wrote:
> 
> 
> On 9/25/2025 10:19 AM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 04:37:22PM -0700, Jingyi Wang wrote:
> >> Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
> >> compatible with SM8750, which can fallback to SM8550 except for one more
> >> interrupt ("shutdown-ack").
> >>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >> index 2dd479cf4821..be9e2a0bc060 100644
> >> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >> @@ -28,7 +28,9 @@ properties:
> >>            - qcom,x1e80100-adsp-pas
> >>            - qcom,x1e80100-cdsp-pas
> >>        - items:
> >> -          - const: qcom,sm8750-adsp-pas
> >> +          - enum:
> >> +              - qcom,kaanapali-adsp-pas
> >> +              - qcom,sm8750-adsp-pas
> >>            - const: qcom,sm8550-adsp-pas
> >>        - items:
> >>            - const: qcom,sm8750-cdsp-pas
> >> @@ -95,6 +97,7 @@ allOf:
> >>          compatible:
> >>            contains:
> >>              enum:
> >> +              - qcom,kaanapali-adsp-pas
> > 
> > This one and the next entry are redundant. Do you see why?
> > 
> 
> This one describe the interrupt:
> 
>   - if:
>       properties:
>         compatible:
>           contains:

>             enum:
>               - qcom,kaanapali-adsp-pas
>               - qcom,sm8750-adsp-pas

It's still redundant. Don't you see it?

>     then:
>       properties:
>         interrupts:
>           maxItems: 6
>         interrupt-names:
>           maxItems: 6
>         memory-region:
>           maxItems: 2
> 
> 
> >>                - qcom,sm8750-adsp-pas
> >>      then:
> >>        properties:
> >> @@ -185,6 +188,7 @@ allOf:
> >>          compatible:
> >>            contains:
> >>              enum:
> >> +              - qcom,kaanapali-adsp-pas
> 
> This one describe the power domain
> 
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - qcom,kaanapali-adsp-pas
>               - qcom,sm8550-adsp-pas
>               - qcom,sm8650-adsp-pas
>               - qcom,sm8750-adsp-pas
>               - qcom,x1e80100-adsp-pas

Likewise

>     then:
>       properties:
>         power-domains:
>           items:
>             - description: LCX power domain
>             - description: LMX power domain
>         power-domain-names:
>           items:
>             - const: lcx
>             - const: lmx
> 
> 
> >>                - qcom,sm8550-adsp-pas
> >>                - qcom,sm8650-adsp-pas
> >>                - qcom,sm8750-adsp-pas
> >>
> >> -- 
> >> 2.25.1
> >>
> > 
> 
> Thanks,
> Jingyi

-- 
With best wishes
Dmitry

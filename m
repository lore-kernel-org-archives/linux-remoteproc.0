Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0FB45BE3
	for <linux-remoteproc@vger.kernel.org>; Sat,  3 May 2025 04:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746247325; cv=none; b=RhjpiDYwAjKLGbfpoWA0atPqIXwMmL3XePpjyJvzjkj9iT0Nwt2Ct8YUoST3F73Y7ZFeMv50DNl+V200B65VPPXhUiue75je5YSWPWssRjwqyEcljVXgK19QZpYm2B7dEQHOimrcE68oPf7AXMULCWy+89JFTsQbmfTYkTu4O4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746247325; c=relaxed/simple;
	bh=hTnfyiZ2cUPzYM3nK1hIvjQ7hVwgJqsGscfrKpVDqGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQGhF39++2tS+LFsqDqpyCuqtJIYx1UWAoFZfkDvN3fUs+3J04+nPmCNtBbdOsOsJT7OTx2rWnvzsjXjfrXC2rQU6cQ9Fu5Lb6+2CYBcEgI6Mfo9U2MQPJZvABDJVWGlXvO0zpS66NVq9/mSydW/53fg3zjAV3GLzRV8rwIcvQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7qD6pBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7qD6pBc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433c31e007514
	for <linux-remoteproc@vger.kernel.org>; Sat, 3 May 2025 04:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FQMLPON870FXgx0xo2DcGcx2
	oTDkSI85oPnoNhn08Ag=; b=I7qD6pBceWUXkppQQ7aYBdquC21FyzdWf+dtBQT/
	kw6+OPiJGHZnPLuP7wHfXC37gboS70UNuQTYQWQj1KJO2fbxxJDPFpYcNhLzl78U
	4fcUof4mhzL4Z/3uKlUOzT2jqCe2q+kGoNx/BL+MMG+jRF2pYgDR1anchzT8Mk6D
	64jYKRvA4aBEWOzGwHzzXCcsutG7KXw0wKacsAIXlcSWk7JgvOLHesG05kzjPC77
	6zLnxozOhIGGLgzGLkB/rTshcXjtwgIX3B9xvg0zSqw47Joa2KNRcpdjl5T8Kac4
	aJ1biqQIT13E4o4Pd33Jju1PKur/3BWBU0pp4ciqAR6xDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rr5cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 03 May 2025 04:42:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c793d573b2so379785885a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 May 2025 21:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746247321; x=1746852121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQMLPON870FXgx0xo2DcGcx2oTDkSI85oPnoNhn08Ag=;
        b=WSL01rQHix0cc+YkfRJE7O84rlAuZHrH21SzzrSzououQdEOSdGu5VAM9gBOGbDk7m
         gK6I50eESozXfj0im5dlNlkj3NHCrX/cSsHqHJ9mHjmeM6pp68UfnSmFWSAhlC92Vi0A
         tKQhYbzhE2TAsWM2D+jDA1Cjr7ticbFKbnN3Zf7HXkt+C1wlqNswcl7wKSrzWpP38YdY
         81DHOOXa9gs6d8KdbuTPH3yBHSm2oHIl6yd33c9KGQsdQPfBH0gyYxNCK8gWcPWJJP+d
         RpdUPFboiwDKevvYWNooNuvI/LEMv2yRQfxXgxgeEVDK2ck0RmEm8rn2i65xA/vBJkBj
         TJEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3vXVBv9DT+sZPtsRFb8lwMOpC86kqpb/T5WOTQPYzci3CyZRKgchdzyQkYzpzYr0VaRcE+slscotngYzjXHnz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Xvd4IhWb4B9/fPM/80V/y0xtSCJ+4Grh2vKFqJAm++wHq/Pb
	p1BWsYWyL3VWi5tY2FwCHd4ScLJs/EqT8alEYaRo7UG9v9N/pDiGQRbIeCJnAkL7kfKI5bIkh50
	OwRza+ESG+2QqgKuyrgVFATMh9LIOisNXv4AvChBYhNQJjz4vt/JpDPASDELLta4j5egL
X-Gm-Gg: ASbGncuM30LBxnuGcnp2X0P9HiMtTZT06UiBmixHOSSMDYnoGtLpv+Cjoq34oMsF2Kr
	TTO5dENVKnJyogzxFFiSwEM1h6iiSHrf7LT2gTW2+RvKGB7j60003iVN3r0gBJfhBZHvnFmnB13
	EaZ9By4c3IHAtMx5pQLOWpGQEQ9kObhIZKeuvW1GOYvsie3HYpQm+v2+PkuScoLUA/E86+c3OkM
	q5CO2IY9eB8UlyyhYE8jZIsIH72s0bfcPqp4NTvgaJzl9PO9JLFDtbLCrVSnE/nc4wbP2AaboGj
	9INHRjMnJ4Rb4ZdTducnATBu2bACMdhnuwwvTyY0U1NnyvUytisB+jlNj4v58OycFFz3HqRq+pw
	=
X-Received: by 2002:a05:622a:6110:b0:476:7e6b:d297 with SMTP id d75a77b69052e-48d5d6e92e2mr27117041cf.41.1746247321100;
        Fri, 02 May 2025 21:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8EhiCjDNNO/uwSIfsGfYL22hzcntZSkFEpC4Jvq708YzrvTHfCEi0esTQo4dgUDZpM7GpBA==
X-Received: by 2002:a05:622a:6110:b0:476:7e6b:d297 with SMTP id d75a77b69052e-48d5d6e92e2mr27116851cf.41.1746247320782;
        Fri, 02 May 2025 21:42:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202b18e625sm5826381fa.114.2025.05.02.21.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 21:41:59 -0700 (PDT)
Date: Sat, 3 May 2025 07:41:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
Message-ID: <sz2qriqarxlfjr2pa6fpjfmeugagbztk42siuvtlgp45vjrokh@e3jdwa6ocxp5>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
 <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
 <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GxCSpvaIpm92De8Es7h-0oUUiq40jCNc
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68159e9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yefebYspku7_6as8HWsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: GxCSpvaIpm92De8Es7h-0oUUiq40jCNc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAzNiBTYWx0ZWRfXyCP5Ph93JVpE
 CwLUfYXl6X2YTlAORl3HU+T9+GW4zoV0Yo3zz5WSaSp7Lb3BVOf9zf4Zz9PZSpLhWBVw/VDBAfH
 0hWW8TOYbGDHBO9DSXqTxCj9wkEYe39/paiBc4jJS3FJCj0WUV9u6nmMtRS3cjORMpApM9w6KDt
 MwRNg/eOOYVzWKFEYQm/L2z0pYL7KVYapSnwI1UnlsaIR0oG56WkAW0bOdzuYbaaqAQy3h93pwV
 dNKjHbNhuB0w636Epn6aKX25Kju6pjwPEXmJrn/UT5uaXz0jG23GhyV7+amRheN0Y7v/Y6DWeow
 5UDowrQq7BIASPByRrfA0lcAkXiLTGSGGDihnNA8m4wOr6VW7u7lkw+4DeRhDdbhyyGqX7BgHPU
 CCSfXDP/eZY3jxg5HOrR+qpDi/7w08V5tPPiQQyCicSKcH8SypJtFMdzYvjEzMnBvasVSkKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=719
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030036

On Sat, May 03, 2025 at 12:57:26AM +0200, Konrad Dybcio wrote:
> On 5/3/25 12:55 AM, Dmitry Baryshkov wrote:
> > On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Have your tried enabling it for X13s? Windows drivers provide
> > qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.
> 
> Forgot to mention, it powers up and exposes the expected qrtr
> service on the CRD
> 
> [...]
> 
> >> +			glink-edge {
> >> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> >> +							IPCC_MPROC_SIGNAL_GLINK_QMP
> >> +							IRQ_TYPE_EDGE_RISING>;
> >> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
> >> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> >> +
> >> +				label = "slpi";
> >> +				qcom,remote-pid = <3>;
> > 
> > No fastrpc contexts?
> 
> I frankly don't know how to validate them

Well... The easiest way would be to upload fastrpc_shell_2 and attempt
to start sdsprpcd or hexagonrpcd.

-- 
With best wishes
Dmitry

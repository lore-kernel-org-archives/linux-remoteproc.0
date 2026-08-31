Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374014AEBD3
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197307; cv=none; b=fyoD7NH4etSCs3LsDGwFfS77/sSR5/KY5iOi2aCVU8Wzd8BrY5cb6/3J0/4BeXT6BrKecl1CGvkF8lVzL5DTEEZLec1Yf2cMXJwUVGNS52LJaKdwUH80rBOJ695StGuErUVCUj736Rpm0jiSya16drUaDPUEXbVSsJn2SG+WGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197307; c=relaxed/simple;
	bh=EQKLGIpclNr7gypVyVTiYlY5af+PuK8ZOUJsJYBYGjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXMG+TNhOl9YnYibVq0FPN5S54QDe15vR2jS3XB1bfjHgocj2UL14fWQTRPlNZ1cctzz99GT91bVGp6I4jGD3EpphFsYBPIZIMwOaiytuWty8DSmzWCiXQkeoE1/4Hz2tu8FGw4x2Ihljft2+HHPPPMCXiNOufEjbD2Q5TJa3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIolEwn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxSO3AC1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIolEwn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxSO3AC1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq9SZ305909
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 17:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U+FJDreApvOiHgVna50wFhn3
	6lEdXGcRrdbklNgyIFA=; b=nIolEwn7iIuKQyspnYSNalgpKUBDYw7H+2vE+VSy
	Kw0C4ZRxp89bxPrYsO71dQIgb5FW5TGANlE3YsXHTi/6nFH/GYszk4LEGdF9j8lg
	bJzOi525PK56jw62/8LKn3RSZGX286op6ciykWOLgRw9dMVxVPY+fLlX+MX+ZfxC
	Q/hUXYjkcvFVU5rnw0pqsj9cQkP8d//tEb/TDcnsON4AxjS9TeEbLwm2vfEEkngd
	y8fYZk17v4unB0Yr8qtj5WL3qTGSZKFQTeZ9DOLAbcjwepIQ/JdZAW4MSH/WgQgc
	3eQQGDOqHCmi4dUXjXzu4h+jo3VlQc3C5StJGRBZ2Uouzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pmatj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 17:28:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so793535a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 10:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788197304; x=1788802104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+FJDreApvOiHgVna50wFhn36lEdXGcRrdbklNgyIFA=;
        b=kxSO3AC1Hef/bkbWbAJTkmGm8zNbbxMWkKup/2d3geJmwwE/xiYTTfSsJNuMjNGpOz
         su0v2JRkD1csmvfFZWQ5KcxAR1vp/lU5fWh0gXcx9N31nVeuHztGggoRXoOmCI6dBymB
         /M5aN986oeZ/Vtuf/J1xAmeUruTlmPnPA7MtjMmgkjxiBNcb830gmOqG/ADFFw0KwOMq
         GL/XgdxWn+kD5KvYf1zIAVZc4cNb/Tg2i9AOIW34Fd3f4H1Qo/fVpWKJXPqbRzcVpoKk
         JA9LEhArUWtDKDlTr1JrMey+bwTZJ0n/l8E5RSp0Q5ngtTn5MpZhpL9pcOOCvxcR2Cly
         iChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197304; x=1788802104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+FJDreApvOiHgVna50wFhn36lEdXGcRrdbklNgyIFA=;
        b=Se8fMLUagQk5yXm5X+GVx8DYgVhoHpcvQPsYEr69Yb9xZuK92iVN9PFeEsDXoFR/bq
         nH9teldW99N7LvH6SW2e5nnY3uUAN8S9wrO4mOK4df3h0yoothyCLZSOI61veAiW60pg
         /cqPwIwLa2/gB1S0c0fmppxAQRzUxI+rQJjjssgLMHxMOFasxWZVAbmUhW1iPwDeN95D
         byyGMR9h9j2nQIcrCOIUDvqivTgnIT6AHzFrzyI+UmYMjUKv5/IYuA5pm4M/FgMC8KN9
         fCDHaBN8jUlyARJcqUtaSKPrgFUAlgf2BSwjTvDa0gXLRaW36yB6Ymx24A7AjSdqIN+I
         7gFA==
X-Forwarded-Encrypted: i=1; AKwUvBxVn+t1vEZEQyUd/zfhRFXMHx5tYTVaGS7LjU1QDOx3r5hVYWb+YxOQp67l9OIoEme3T5nZ5C1eorQ1rreE8x8R@vger.kernel.org
X-Gm-Message-State: AFuF++lVlgTRhYJe3VtOHUPofFE7RnNoKgnCmIppjzH4WZ7bVw4wTEYT
	7hl84TF98RnO0hqeGDuzVj9Y5ZCyAfPJnZv4Unvx4SERg3mdADNg6BFVqbB+B/+6NT3HELebXm1
	Gklobr2m5ZMG/ExPAZAYOO5TzQMisi/HbKGkMs9yX/m/TP7SXz/t4klVwa0SczgkjxD3ZeQ28
X-Gm-Gg: AYBFou0YZxpHd2qoxd0t9LaRPLmjHyyNbgvPDcJbO6xgKvJN9lJXKChmbDj4QiDJ60e
	gh2mnt9Yd/Imavw7aZ++6tJRXpHgJxcdVE1LSQgrWsqyWkQG6ny27TJMp9r+crxGBJqRTiFhyFI
	s9qmqi8dHHamUSH0VR0uoQXr7NQkL6Ye7uaiNIs6zE9IsgvTthY2TZH0xThLwo37Y+m6vKwErI/
	d+OLFYLbCinl3+lg+BBOdnsIFb6LTXltsHxMS5pwTC6tRNuNVxMK0xxjYFtHVh4JBHESXxbbu6Y
	1YD7ahl5/5rQSDqyl14fAQIoyrm2GHkrtWq+ZshKcoadeYL0LYvq8btAms0kdVE+hxI4hhMVwC3
	Tpc9+V+NSXdwEJMKDOmkLYKJOGD8=
X-Received: by 2002:a17:90b:4a42:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3990723f576mr3198672a91.0.1788197303881;
        Mon, 31 Aug 2026 10:28:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4a42:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3990723f576mr3198592a91.0.1788197303312;
        Mon, 31 Aug 2026 10:28:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm51706451c88.14.2026.08.31.10.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:28:22 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:58:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <20260831172817.66p7yyo3ivdlzqei@hu-mojha-hyd.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
 <1ad7deb5-5544-40aa-baab-865a4612af70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ad7deb5-5544-40aa-baab-865a4612af70@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CORQyG_updqMm_41eM0alFvrOYt1OD_d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE1MCBTYWx0ZWRfX0qWD0AaPMt0g
 uhnZfx9e1ch/HoxBdtqbOMggqiz2WWmAJHrwEts4UZt+O07jrdN7JyyDXXiISt9DSgmu1iG7KJI
 iuM1Nme5Uhsb9UYcbP/doKuL2+8JmgtIKVpMVY0hk/C9hMwLqWQ0tcaNGRrkqvVcKmfwMt05PJF
 0KVLyE41aSOL/eMlAh4hlTA0kCiysS6r3ueW5D15ivaKGxvBOanXy/IP35LpMpMLIhL3ry2Trg0
 BKUaKDuiXZ8FYejhMvKVNjXaYRzXubWlIAJlc+NXqLkClwhcNOvrk0406C9YZ6K6AeAlQIgY25i
 xAKSyog5fa5X24oxcJt1582pucaiE3Nl/rFcwwNbbdVDCBqFlYgFLA/YwHFdmcXMvo4I1Yqz8vY
 2DGhDOJJeBFliRGNH2HzIOFjaEjyhKz1CIMXNcpOWtwgfliMbsZLr5yKUvvKK+1Evk7kvq2V3Sd
 kFo0gIvigo1oqyVVgbA==
X-Proofpoint-GUID: CORQyG_updqMm_41eM0alFvrOYt1OD_d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE1MCBTYWx0ZWRfX4Pj/09tW2GGd
 I9BApyvvk7V9zcXPgRzK6nCbq7kFvKHTA58bT1DK+xk10XiTBLOkXMCuwSHmTSXq5uz6mFd+smw
 XeAfB4JpDxi+P9atHbUaXE12WkIpaz4=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a95b9b8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=n1PayzcEgq9-v72wh0gA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310150

On Mon, Aug 31, 2026 at 09:08:15AM +0200, Konrad Dybcio wrote:
> On 8/28/26 8:13 PM, Mukesh Ojha wrote:
> > The proxy power domain enable path currently requests INT_MAX performance
> > state for every proxy PD.  While this serves as a "take highest available"
> > hint, some SoCs require specific per-domain RPMH levels for correct
> > operation during firmware load rather than a blanket maximum.
> 
> I would have assumed having a surplus of power shouldn't be an issue..
> 
> Is this specific to Hawi?

Yes, its for both Hawi and Maili as far as I know..

>Is that a firmware bug essentially?

It does not looks to be but not 100% sure and its found recently
on some devices.

-- 
-Mukesh Ojha

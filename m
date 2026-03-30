Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BEC3D1CA2
	for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875360; cv=none; b=HluofmyUn9T7YMWiIK7iYb/yGS1QcSMDqQNli/LTl6mUsFJrbSkX6feUyFTKLidG9aVE3d/cSb6YP8ARgzDEuVoWsmnKesEIJOed8R+zC26WNZfW3YRUopxAKMgur0HZbgpd1Ol9Hv+9kKo0ADahmdo7SyfO2H8YbTpMQtViJzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875360; c=relaxed/simple;
	bh=wADqLBIuu0wHUnd3L4QtQgmFjnNFqNtU+W+zPrEI+X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXkDvIHLbIRIB4+FV8LmycShSQv0/DjdfQCCSdP9C101aZJs4nCggrca9q6bvkeOYoEERevmuPOabgl+ALJb/qoa+SJOp1DmxY2MLVZO3Y8V9hY/DCm7HWxxtOl1HJgv/JCIcMwpih28CxxpeWBLXa/eJj1POBI6NxQm3EKT9Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUHb8Xv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TK2g3jK6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUHb8Xv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TK2g3jK6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9lNOw2197293
	for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 12:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ytaBsCpX3Oi+XaxiWu6gHvI8
	cOcnRa4qrGzzXNNXFps=; b=WUHb8Xv7E2jmWhGDBUDGQ79ESL2ZfZ3PBaeoHUwC
	3JADs2T3pj5ULUnueoQ0QwiSqREUjmV1s++FAjz3iJEB2PqHI6dt3kJh+pS8lDZu
	EsFN1PBwQE5uYqp2zafmcp64RVYgj/I5AZaOHUAysOD7/aq8zrVANuYLQ5UnKQhW
	LZlfolyK2hHVQB9GSAymwm+YSCSsIL4vxRb2JIpteo5y5HIG5TqQhFXdDGhvHRKI
	fKkLyw5Tilc4LwHe9Ye34kfn9+KOEgfEL9VkxSHOKcghB+61D4nd0WMRos7C1RV7
	R1jzG4m7KusJONaS3xarh7uFAXVA5VtKu85o7IRGOjRMwQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c479s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 12:55:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b241be0126so81141835ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 05:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774875357; x=1775480157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytaBsCpX3Oi+XaxiWu6gHvI8cOcnRa4qrGzzXNNXFps=;
        b=TK2g3jK61yKREnh9PQI4LqOFIlTPqEqBouFy3McYSOmzODa8zJJoimP9vswEJ6THRj
         QGL0knqQMyXpar+n7a/uBTIiTiyVIiC4Qcy2fuyCBm1p0TEd/cVDqXWjTmA9vXnsHO2Y
         I9elGbyMcWUT7tDrZ7v/sgcaTK7jtrrMWUPxToh9Il2f+4sKpai0hJObJpIu+u5urgXy
         +Td5gi8aa2PDM+SB+eIJkb+MKl/sa+W0pgqQQ8/JUE5pdQFdm7zB0D/SQwn/aBJCVPL4
         vVn+D4iv8gv89MOwOye0VVp0kOmRphUoV9H09FWcHEXCujN7SLruHs0JN1zjMG8rHE95
         ZOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875357; x=1775480157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytaBsCpX3Oi+XaxiWu6gHvI8cOcnRa4qrGzzXNNXFps=;
        b=M9ea2gPVO0aYc4/EVaXLaT7ipgHP1DIUqmQdaBacaS274I/rHaPIW5GRu6ezjD2Eml
         pFQ15WGoIoibRUGKAXxEwmDWHdJjM/s6kfQY/ySJQjF1MWKcZLsj6UCAsg2vOOjHGitG
         MAaN+e2anaj8zW6v7wFY3rpd0x0XF6kgAr9rLTE4sRy/J7q+AJtvaiFkUg4vuUa4OFCz
         fQiuRKSKX0812pgEENibVUnPJQZhleeXIVJlkL+zRKYv6NfrujUee+WlSZlAaJzHz5l6
         PmdmLmqZ+UrsXrcjDD89s/Acdt3bq1+0ZBAHZI15ycyU6X3PMgDs/c8K/9bZLAw7S9ZH
         6YrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtRVqPPvhalbUcbt8TUCesmK4XjZZXGStQjfQEDnsqimaz/MyK+46gmAVjiv83H+WbFYJjxTHIxWxRdyZUXtDe@vger.kernel.org
X-Gm-Message-State: AOJu0Yylik/rCU5sXJlaO7ChdTcB3VBCKBv6A253kKyGH7+V8egWa0ex
	WVl7LUik/CKQUTwDe8MEmVaLSNza1D8unQQ2Nh2jJ3G3fMlmLSORKfyBpXGjRSp42JRxMeMVSKa
	LINoRmi0jDyzorEvN35MiqEQnsVtikUnwDovft85+HpOqqVXBD25hxBT2t/z8m8/UBn+JTGjI
X-Gm-Gg: ATEYQzzfIVLuL3tJxKnLmarM/Hi8BFsl899CBJuFE6WMONVfLvmLaq/D1O9a0xZsEtQ
	B1xWqAE+TBUjtW1zcF4loERNPJSlhyqPxJ6vXLgU/2zV600/ra7U5UCmR0MG3OFuBxpKbUkqOG7
	yl9I1hz/LADMPWT7LRziC7nUImEm7EppWHbYFSIVrW+fP4OCgd4sp+3oTUHa5ypRg+30NjyZwew
	OkFP4LVlXlXOezphwoIuocn2P1Pmrd+XdOjudBg56Nr5HG5GIfZDJ4UAoF2Mkca2R2ARejB1Zu2
	FUhplP1orgn6VNFRNL1nKtQVy60ixapazXekVXej4Fend+WyZuUq1Q3s7Vq7MJ2wLDf9JFKs7b1
	8DrGSFGEl/cLTD+TymkSyrjs8/477YcRi8ECrozrQXgdTo3MO
X-Received: by 2002:a17:902:e809:b0:2ae:4150:3118 with SMTP id d9443c01a7336-2b0cdc3b9d9mr125462515ad.12.1774875357128;
        Mon, 30 Mar 2026 05:55:57 -0700 (PDT)
X-Received: by 2002:a17:902:e809:b0:2ae:4150:3118 with SMTP id d9443c01a7336-2b0cdc3b9d9mr125462285ad.12.1774875356530;
        Mon, 30 Mar 2026 05:55:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242765b93sm87234285ad.51.2026.03.30.05.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:55:56 -0700 (PDT)
Date: Mon, 30 Mar 2026 18:25:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
Message-ID: <20260330125550.5kvn4mo5kplexa62@hu-mojha-hyd.qualcomm.com>
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
 <fcgfzcg5upqw5idgb7acayxgtrmyojtmosqbzqok2cl6dhyr36@n5oyb2rbkf3k>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcgfzcg5upqw5idgb7acayxgtrmyojtmosqbzqok2cl6dhyr36@n5oyb2rbkf3k>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMSBTYWx0ZWRfX9Ja+5/jfqAy5
 7yglQTPNrdR7XUQmMp/nriDoVMTT2Hg2WbRmswU6mm86KaoQ7hiXQALTeHeZnYIuUpteYj22UHc
 +/xKps9gz4ZE3gr575/mJIgeGVTw0CKPhG9+ixZS3JpQ24jRwjP61m0BSvHGY9Q5Ou7Vbpnvfme
 cIiw8KvkCQodKGDWQG0vBiyzGXEAJuKd7PRYCYo0utUsQ9iVzFDb4PiasWbixt1KOvUvS4Zncq/
 6i4B2DFtapV69AzYS04RYHzpBYobQZzhiPGkF07hHH146FrsYCFowhuYm8r5MqnMYS6TIt713aW
 TJ2Ki4S9DK0C9xGl7ySXymsiIMpxPtdV4OF3M+YsrXpxNyRgADtd7UIP4lQc+ey95NPYahTuMIg
 1/kqGr3Py3S0JY1WEyHPjTU6VYKJbIMLsEp9c+4JWQduGFnZCeDkJTPd8ViHONtTYjhsyG60BhX
 NNjJjqts6Cdt3mZ5/6w==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca72de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0qksRMzqLdDqFFOAvkIA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Q8zJKFbtYrM3vZmOPa5cso87nV8ps_WX
X-Proofpoint-ORIG-GUID: Q8zJKFbtYrM3vZmOPa5cso87nV8ps_WX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300101

On Sun, Mar 29, 2026 at 01:51:16PM +0300, Dmitry Baryshkov wrote:
> On Thu, Mar 26, 2026 at 12:42:59AM +0530, Mukesh Ojha wrote:
> > DTB PAS context creation should be done only for subsystems that support
> > a DTB firmware binary; otherwise, memory is wasted. Move the context
> > creation to the appropriate location and, while at it, fix the place
> > where the DTB PAS context was being released unconditionally.
> 
> Okay, if it wasn't obvious from the previous comment: split into two
> patches.
> 
> > 
> > Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
> 
> Was the issue not present before this commit? Was the metadata correctly
> freed?

Yes, it was present and even after the above commit nothing has changed
as ctx->ptr is still NULL but DTB context memory is only needed for
subsystems which have DTB support.

Let me see if I can split this into two patches.
The first will put the DTB PAS ID check and the later will do the context
allocation movement.

> 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
> >  - No change.
> > 
> >  drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
> >  1 file changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 46204da046fa..3bde37ac510c 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >  	return 0;
> >  
> >  release_dtb_metadata:
> > -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > +	if (pas->dtb_pas_id)
> > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > +
> >  	release_firmware(pas->dtb_firmware);
> >  
> >  	return ret;
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha
